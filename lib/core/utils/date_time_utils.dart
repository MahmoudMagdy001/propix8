import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  DateTimeUtils._(); // private constructor

  /// yyyy-MM-dd (للـ backend)
  static String formatDateForApi(DateTime date) =>
      DateFormat('yyyy-MM-dd').format(date);

  /// hh:mm a (عرض للمستخدم)
  static String formatTimeForDisplay(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    return DateFormat('hh:mm a', 'en_US').format(dateTime);
  }

  /// HH:mm (للـ backend لو محتاج 24h)
  static String formatTimeForApi(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    return DateFormat('HH:mm').format(dateTime);
  }

  /// تحويل String وقت جاية من backend لـ TimeOfDay
  static TimeOfDay parseApiTime(String time) {
    try {
      final parsed = DateFormat('HH:mm').parse(time);
      return TimeOfDay(hour: parsed.hour, minute: parsed.minute);
    } on Object catch (_) {
      // Fallback or rethrow? For now, try parsing with other format or return generic
      // Trying with hh:mm a just in case
      try {
        final parsed = DateFormat('hh:mm a').parse(time);
        return TimeOfDay(hour: parsed.hour, minute: parsed.minute);
      } on Object catch (_) {
        return const TimeOfDay(hour: 0, minute: 0);
      }
    }
  }
}
