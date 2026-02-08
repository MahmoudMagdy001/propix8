import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../utils/auth_logger.dart';

/// Service for persisting app data to SharedPreferences with in-memory caching.
///
/// OPTIMIZATION: Uses in-memory cache to avoid repeated disk I/O on every
/// widget rebuild. Cache is populated lazily and invalidated on writes.
///
/// SECURITY: Provides clearMemory() to wipe sensitive data from RAM on logout.
///
/// RESILIENCE: Graceful degradation methods (*Safe variants) that keep data
/// in memory even when disk persistence fails.
class StorageService {
  StorageService(this._prefs) {
    // OPTIMIZATION: Pre-populate cache from disk on initialization
    // This ensures first read is fast and avoids async gap issues
    _initializeCache();
  }

  final SharedPreferences _prefs;

  // ─────────────────────────────────────────────────────────────────────────
  // Storage Keys (centralized for easy maintenance)
  // ─────────────────────────────────────────────────────────────────────────

  static const String _tokenKey = 'auth_token';
  static const String _localeKey = 'app_locale';
  static const String _themeKey = 'app_theme';
  static const String _userKey = 'user_data';
  static const String _onboardingKey = 'onboarding_seen';

  // ─────────────────────────────────────────────────────────────────────────
  // In-Memory Cache
  // WHY: Avoids repeated SharedPreferences reads on every widget rebuild.
  // SharedPreferences reads are synchronous but still involve disk I/O.
  // ─────────────────────────────────────────────────────────────────────────

  String? _cachedToken;
  Map<String, dynamic>? _cachedUser;
  bool _cacheInitialized = false;

  /// Pre-populate cache from disk storage.
  void _initializeCache() {
    if (_cacheInitialized) return;

    _cachedToken = _prefs.getString(_tokenKey);
    final userString = _prefs.getString(_userKey);
    if (userString != null) {
      try {
        _cachedUser = jsonDecode(userString) as Map<String, dynamic>;
      } catch (e) {
        AuthLogger.error('Failed to parse cached user data', e);
        _cachedUser = null;
      }
    }
    _cacheInitialized = true;
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Token Management
  // ─────────────────────────────────────────────────────────────────────────

  Future<void> saveToken(String token) async {
    _cachedToken = token; // Update cache immediately for fast reads
    await _prefs.setString(_tokenKey, token);
    AuthLogger.debug('Token saved to storage');
  }

  /// Get auth token (from cache first, disk as fallback).
  String? getToken() {
    // OPTIMIZATION: Return cached value if available (avoids disk I/O)
    if (_cachedToken != null) return _cachedToken;

    // Fallback to disk if cache empty (e.g., direct storage access)
    _cachedToken = _prefs.getString(_tokenKey);
    return _cachedToken;
  }

  Future<void> deleteToken() async {
    _cachedToken = null; // Clear cache first for immediate effect
    await _prefs.remove(_tokenKey);
    AuthLogger.debug('Token deleted from storage');
  }

  /// Save token with graceful degradation.
  ///
  /// RESILIENCE: Returns true if disk write succeeded, false if only in-memory.
  /// Even on disk failure, token is kept in memory so auth continues to work
  /// for the current session.
  Future<bool> saveTokenSafe(String token) async {
    _cachedToken = token; // Always update memory first
    try {
      await _prefs.setString(_tokenKey, token);
      return true;
    } catch (e) {
      AuthLogger.error('Failed to persist token to disk', e);
      // Token is still in memory, auth will work for this session
      return false;
    }
  }

  // ─────────────────────────────────────────────────────────────────────────
  // User Data Management
  // ─────────────────────────────────────────────────────────────────────────

  Future<void> saveUser(Map<String, dynamic> userJson) async {
    _cachedUser = userJson; // Update cache immediately
    await _prefs.setString(_userKey, jsonEncode(userJson));
    AuthLogger.debug('User data saved to storage');
  }

  /// Get user data (from cache first, disk as fallback).
  Map<String, dynamic>? getUser() {
    // OPTIMIZATION: Return cached value if available
    if (_cachedUser != null) return _cachedUser;

    // Fallback to disk
    final userString = _prefs.getString(_userKey);
    if (userString == null) return null;

    try {
      _cachedUser = jsonDecode(userString) as Map<String, dynamic>;
      return _cachedUser;
    } catch (e) {
      AuthLogger.error('Failed to parse user data from storage', e);
      return null;
    }
  }

  Future<void> clearUser() async {
    _cachedUser = null; // Clear cache first
    await _prefs.remove(_userKey);
    AuthLogger.debug('User data cleared from storage');
  }

  /// Save user with graceful degradation.
  Future<bool> saveUserSafe(Map<String, dynamic> userJson) async {
    _cachedUser = userJson;
    try {
      await _prefs.setString(_userKey, jsonEncode(userJson));
      return true;
    } catch (e) {
      AuthLogger.error('Failed to persist user to disk', e);
      return false;
    }
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Memory Safety
  // ─────────────────────────────────────────────────────────────────────────

  /// Clear all sensitive auth data from memory.
  ///
  /// SECURITY: Call this on logout and when app goes to background to prevent
  /// sensitive data from persisting in RAM longer than necessary.
  void clearMemory() {
    _cachedToken = null;
    _cachedUser = null;
    AuthLogger.debug('Sensitive data cleared from memory');
  }

  /// Clear all auth-related data (both memory and disk).
  ///
  /// Use on logout to ensure complete cleanup.
  Future<void> clearAuthData() async {
    clearMemory();
    await Future.wait([deleteToken(), clearUser()]);
    AuthLogger.info('All auth data cleared');
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Locale & Theme (non-sensitive, no caching needed)
  // ─────────────────────────────────────────────────────────────────────────

  Future<void> saveLocale(String locale) async {
    await _prefs.setString(_localeKey, locale);
  }

  String getLocale() => _prefs.getString(_localeKey) ?? 'ar';

  Future<void> saveThemeMode(String themeMode) async {
    await _prefs.setString(_themeKey, themeMode);
  }

  String? getThemeMode() => _prefs.getString(_themeKey);

  // ─────────────────────────────────────────────────────────────────────────
  // Onboarding
  // ─────────────────────────────────────────────────────────────────────────

  Future<void> saveOnboardingSeen() async {
    await _prefs.setBool(_onboardingKey, true);
  }

  bool getIsOnboardingSeen() => _prefs.getBool(_onboardingKey) ?? false;

  // ─────────────────────────────────────────────────────────────────────────
  // Clear All (existing method preserved)
  // ─────────────────────────────────────────────────────────────────────────

  Future<void> clearAll() async {
    clearMemory(); // Also clear in-memory cache
    await _prefs.clear();
  }
}
