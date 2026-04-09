import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/auth_logger.dart';

/// Service for persisting app data using secure and non-secure storage.
///
/// SECURITY: Sensitive data (token, user) is stored in FlutterSecureStorage
/// (encrypted Keychain on iOS, EncryptedSharedPreferences on Android).
/// Non-sensitive data (locale, theme, onboarding) stays in SharedPreferences.
///
/// OPTIMIZATION: Uses in-memory cache to avoid repeated I/O on every
/// widget rebuild. Cache is populated lazily and invalidated on writes.
///
/// RESILIENCE: Graceful degradation methods (*Safe variants) that keep data
/// in memory even when disk persistence fails.
class StorageService {
  StorageService(this._prefs, this._secureStorage);

  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage;

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
  // WHY: Avoids repeated secure storage reads (which are async) on every
  // widget rebuild. Cache provides synchronous access after initialization.
  // ─────────────────────────────────────────────────────────────────────────

  String? _cachedToken;
  Map<String, dynamic>? _cachedUser;
  bool _cacheInitialized = false;

  /// Pre-populate cache from secure storage.
  ///
  /// MUST be called after construction but before first use (e.g., in DI setup).
  Future<void> initializeCache() async {
    if (_cacheInitialized) return;

    try {
      _cachedToken = await _secureStorage.read(key: _tokenKey);
    } catch (e) {
      AuthLogger.error('Failed to read cached token from secure storage', e);
    }

    try {
      final userString = await _secureStorage.read(key: _userKey);
      if (userString != null) {
        _cachedUser = jsonDecode(userString) as Map<String, dynamic>;
      }
    } catch (e) {
      AuthLogger.error('Failed to parse cached user data', e);
      _cachedUser = null;
    }

    _cacheInitialized = true;
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Token Management (Secure Storage)
  // ─────────────────────────────────────────────────────────────────────────

  Future<void> saveToken(String token) async {
    _cachedToken = token; // Update cache immediately for fast reads
    await _secureStorage.write(key: _tokenKey, value: token);
    AuthLogger.debug('Token saved to secure storage');
  }

  /// Get auth token (from cache first, secure storage as fallback).
  String? getToken() => _cachedToken;

  Future<void> deleteToken() async {
    _cachedToken = null; // Clear cache first for immediate effect
    await _secureStorage.delete(key: _tokenKey);
    AuthLogger.debug('Token deleted from secure storage');
  }

  /// Save token with graceful degradation.
  ///
  /// RESILIENCE: Returns true if secure write succeeded, false if only in-memory.
  /// Even on failure, token is kept in memory so auth continues to work
  /// for the current session.
  Future<bool> saveTokenSafe(String token) async {
    _cachedToken = token; // Always update memory first
    try {
      await _secureStorage.write(key: _tokenKey, value: token);
      return true;
    } catch (e) {
      AuthLogger.error('Failed to persist token to secure storage', e);
      // Token is still in memory, auth will work for this session
      return false;
    }
  }

  // ─────────────────────────────────────────────────────────────────────────
  // User Data Management (Secure Storage)
  // ─────────────────────────────────────────────────────────────────────────

  Future<void> saveUser(Map<String, dynamic> userJson) async {
    _cachedUser = userJson; // Update cache immediately
    await _secureStorage.write(key: _userKey, value: jsonEncode(userJson));
    AuthLogger.debug('User data saved to secure storage');
  }

  /// Get user data (from cache — secure storage requires async init).
  Map<String, dynamic>? getUser() => _cachedUser;

  Future<void> clearUser() async {
    _cachedUser = null; // Clear cache first
    await _secureStorage.delete(key: _userKey);
    AuthLogger.debug('User data cleared from secure storage');
  }

  /// Save user with graceful degradation.
  Future<bool> saveUserSafe(Map<String, dynamic> userJson) async {
    _cachedUser = userJson;
    try {
      await _secureStorage.write(key: _userKey, value: jsonEncode(userJson));
      return true;
    } catch (e) {
      AuthLogger.error('Failed to persist user to secure storage', e);
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

  /// Clear all auth-related data (both memory and secure storage).
  ///
  /// Use on logout to ensure complete cleanup.
  Future<void> clearAuthData() async {
    clearMemory();
    await Future.wait([deleteToken(), clearUser()]);
    AuthLogger.info('All auth data cleared');
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Locale & Theme (non-sensitive, SharedPreferences is fine)
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
  // Onboarding (non-sensitive, SharedPreferences is fine)
  // ─────────────────────────────────────────────────────────────────────────

  Future<void> saveOnboardingSeen() async {
    await _prefs.setBool(_onboardingKey, true);
  }

  bool getIsOnboardingSeen() => _prefs.getBool(_onboardingKey) ?? false;

  // ─────────────────────────────────────────────────────────────────────────
  // Clear All
  // ─────────────────────────────────────────────────────────────────────────

  Future<void> clearAll() async {
    clearMemory(); // Also clear in-memory cache
    await Future.wait([_prefs.clear(), _secureStorage.deleteAll()]);
  }
}
