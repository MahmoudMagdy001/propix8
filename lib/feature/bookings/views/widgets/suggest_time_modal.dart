import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:propix8/core/utils/snackbar_utils.dart';

import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/utils/date_time_utils.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class SuggestTimeModal extends StatefulWidget {
  const SuggestTimeModal({super.key});

  @override
  State<SuggestTimeModal> createState() => _SuggestTimeModalState();
}

class _SuggestTimeModalState extends State<SuggestTimeModal> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  void _submit() {
    if (_selectedDate == null) {
      context.showInfoSnackbar(context.l10n.pleaseSelectDate);
      return;
    }

    if (_selectedTime == null) {
      context.showInfoSnackbar(context.l10n.pleaseSelectTime);
      return;
    }

    // Validation: Check if selected time is in the past if date is today
    final now = DateTime.now();
    final isSelectedDateToday =
        _selectedDate!.year == now.year &&
        _selectedDate!.month == now.month &&
        _selectedDate!.day == now.day;

    if (isSelectedDateToday) {
      final selectedDateTime = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      );

      if (selectedDateTime.isBefore(now)) {
        context.showErrorSnackbar(context.l10n.pastTimeError);
        return;
      }
    }

    final dateStr = DateTimeUtils.formatDateForApi(_selectedDate!);
    final timeStr = DateTimeUtils.formatTimeForApi(_selectedTime!);

    Navigator.pop(context, {
      'date': dateStr,
      'time': timeStr,
      'message': _messageController.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppTextFormField(
          label: context.l10n.date,
          prefixIcon: Icon(Icons.calendar_today_outlined, size: 20.w),
          controller: TextEditingController(
            text: _selectedDate != null
                ? DateFormat('yyyy/MM/dd').format(_selectedDate!)
                : context.l10n.selectDate,
          ),
          readOnly: true,
          onTap: _selectDate,
        ),
        SizedBox(height: 12.h),
        AppTextFormField(
          label: context.l10n.time,
          prefixIcon: Icon(Icons.access_time_rounded, size: 20.w),
          controller: TextEditingController(
            text: _selectedTime != null
                ? _selectedTime!.format(context)
                : context.l10n.selectTime,
          ),
          readOnly: true,
          onTap: _selectTime,
        ),
        SizedBox(height: 12.h),
        AppTextFormField(
          controller: _messageController,
          label: context.l10n.messageOptional,
          prefixIcon: const Icon(Icons.notes_rounded),
          maxLines: 3,
        ),
        SizedBox(height: 16.h),
        AppElevatedButton(
          onPressed: _submit,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          text: context.l10n.sendSuggestion,
          width: double.infinity,
        ),
      ],
    ),
  );
}
