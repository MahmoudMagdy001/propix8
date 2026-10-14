import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/storage/storage_service.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/date_time_utils.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/utils/snackbar_utils.dart';
import 'package:propix8/core/widgets/app_elevated_button.dart';
import 'package:propix8/core/widgets/app_form.dart';
import 'package:propix8/core/widgets/app_modal_sheet.dart';
import 'package:propix8/core/widgets/app_text_form_field.dart';
import 'package:propix8/core/widgets/terms_checkbox.dart';
import 'package:propix8/feature/auth/models/auth_model.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_bloc.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_event.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_state.dart';

class BookingSheet extends StatefulWidget {
  const BookingSheet({required this.unitId, super.key});
  final int unitId;

  static Future<void> show(BuildContext context, int unitId) =>
      showAppModalSheet(
        context: context,
        title: context.l10n.reserveNow,
        child: BlocProvider.value(
          value: context.read<UnitDetailsBloc>(),
          child: BookingSheet(unitId: unitId),
        ),
      );

  @override
  State<BookingSheet> createState() => _BookingSheetState();
}

class _BookingSheetState extends State<BookingSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _notesController = TextEditingController();
  final _appFormKey = GlobalKey<AppFormState>();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  bool _agreedToTerms = false;

  @override
  void initState() {
    super.initState();
    final userMap = locator<StorageService>().getUser();
    final user = userMap != null ? User.fromJson(userMap) : null;
    _nameController = TextEditingController(text: user?.name ?? '');
    _emailController = TextEditingController(text: user?.email ?? '');
    _phoneController = TextEditingController(text: user?.phone ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now.add(const Duration(days: 1)),
      firstDate: now,
      lastDate: now.add(const Duration(days: 90)),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateTimeUtils.formatDateForApi(picked);
      });
    }
  }

  Future<void> _selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? const TimeOfDay(hour: 10, minute: 0),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
        _timeController.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<UnitDetailsBloc, UnitDetailsState>(
        listenWhen: (previous, current) =>
            previous.bookingStatus != current.bookingStatus,
        listener: (context, state) {
          if (state.bookingStatus == HomeRequestStatus.success) {
            context.showSuccessSnackbar(
              state.bookingSuccessMessage ?? context.l10n.bookingSuccess,
            );
            context
                .read<UnitDetailsBloc>()
                .add(const UnitDetailsEvent.bookingStatusReset());
            Navigator.pop(context);
          } else if (state.bookingStatus == HomeRequestStatus.failure) {
            context.showErrorSnackbar(
              state.bookingErrorMessage ?? context.l10n.errorOccurred,
            );
            context
                .read<UnitDetailsBloc>()
                .add(const UnitDetailsEvent.bookingStatusReset());
          }
        },
        builder: (context, state) => AppForm(
          key: _appFormKey,
          formKey: _formKey,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextFormField(
                controller: _nameController,
                label: context.l10n.name,
                prefixIcon: const Icon(Icons.person_outline),
                validator: (value) =>
                    value?.isEmpty ?? true ? context.l10n.fieldRequired : null,
              ),
              SizedBox(height: 12.h),
              AppTextFormField(
                controller: _emailController,
                label: context.l10n.email,
                prefixIcon: const Icon(Icons.email_outlined),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return context.l10n.fieldRequired;
                  }
                  if (!value!.contains('@')) {
                    return context.l10n.invalidEmail;
                  }
                  return null;
                },
              ),
              SizedBox(height: 12.h),
              AppTextFormField(
                controller: _phoneController,
                label: context.l10n.phone,
                prefixIcon: const Icon(Icons.phone_outlined),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value?.isEmpty ?? true ? context.l10n.phoneRequired : null,
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      controller: _dateController,
                      label: context.l10n.date,
                      prefixIcon: const Icon(Icons.calendar_today_outlined),
                      readOnly: true,
                      onTap: _selectDate,
                      validator: (value) => value?.isEmpty ?? true
                          ? context.l10n.fieldRequired
                          : null,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: AppTextFormField(
                      controller: _timeController,
                      label: context.l10n.time,
                      prefixIcon: const Icon(Icons.access_time_outlined),
                      readOnly: true,
                      onTap: _selectTime,
                      validator: (value) => value?.isEmpty ?? true
                          ? context.l10n.fieldRequired
                          : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              AppTextFormField(
                controller: _notesController,
                label: context.l10n.unit_details_booking_notes,
                prefixIcon: const Icon(Icons.notes_outlined),
                maxLines: 3,
              ),
              SizedBox(height: 12.h),
              TermsCheckbox(
                value: _agreedToTerms,
                onChanged: (val) =>
                    setState(() => _agreedToTerms = val ?? false),
              ),
              SizedBox(height: 16.h),
              AppElevatedButton(
                text: context.l10n.reserveNow,
                isLoading: state.bookingStatus == HomeRequestStatus.loading,
                onPressed: _agreedToTerms
                    ? () {
                        if (_appFormKey.currentState?.validateAndScroll() ?? false) {
                          context.read<UnitDetailsBloc>().add(
                                UnitDetailsEvent.bookingSubmitted(
                                  name: _nameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  phone: _phoneController.text.trim(),
                                  date: _dateController.text.trim(),
                                  time: _timeController.text.trim(),
                                  notes: _notesController.text.trim(),
                                ),
                              );
                        }
                      }
                    : null,
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      );
}
