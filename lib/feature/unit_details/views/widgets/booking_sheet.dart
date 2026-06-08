import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/public_feature/services/storage_service.dart';
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
import 'package:propix8/feature/unit_details/models/booking_request_model.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_cubit.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_state.dart';

class BookingSheet extends StatefulWidget {
  const BookingSheet({required this.unitId, super.key});
  final int unitId;

  static Future<void> show(BuildContext context, int unitId) =>
      showAppModalSheet(
        context: context,
        title: context.l10n.reserveNow,
        child: BlocProvider.value(
          value: context.read<UnitDetailsCubit>(),
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
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
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
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
        _timeController.text = DateTimeUtils.formatTimeForDisplay(picked);
      });
    }
  }

  void _submit(BuildContext context) {
    if (_appFormKey.currentState?.validateAndScroll() ?? false) {
      final request = BookingRequestModel(
        unitId: widget.unitId,
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        date: _dateController.text,
        time: _selectedTime != null
            ? DateTimeUtils.formatTimeForApi(_selectedTime!)
            : _timeController.text,
        notes: _notesController.text,
      );
      context.read<UnitDetailsCubit>().createBooking(request);
    }
  }

  @override
  Widget build(BuildContext context) => AppForm(
    key: _appFormKey,
    formKey: _formKey,
    padding: EdgeInsets.symmetric(horizontal: 6.w),
    child: BlocConsumer<UnitDetailsCubit, UnitDetailsState>(
      listenWhen: (previous, current) =>
          previous.bookingStatus != current.bookingStatus,
      listener: (context, state) {
        if (state.bookingStatus == RequestStatus.success) {
          Navigator.pop(context);
          context.showSuccessSnackbar(
            state.bookingSuccessMessage ?? context.l10n.bookingSuccess,
          );
          context.read<UnitDetailsCubit>().resetBookingStatus();
        } else if (state.bookingStatus == RequestStatus.failure) {
          context.showErrorSnackbar(
            state.bookingErrorMessage ?? context.l10n.error,
          );
          context.read<UnitDetailsCubit>().resetBookingStatus();
        }
      },
      builder: (context, state) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextFormField(
            controller: _nameController,
            label: context.l10n.name,
            prefixIcon: Icon(Icons.person_outline_rounded, size: 20.w),
            validator: (v) =>
                v?.isEmpty ?? true ? context.l10n.fieldRequired : null,
          ),
          SizedBox(height: 12.h),
          AppTextFormField(
            controller: _emailController,
            label: context.l10n.email,
            prefixIcon: Icon(Icons.email_outlined, size: 20.w),
            keyboardType: TextInputType.emailAddress,
            validator: (v) =>
                v?.isEmpty ?? true ? context.l10n.fieldRequired : null,
          ),
          SizedBox(height: 12.h),
          AppTextFormField(
            controller: _phoneController,
            label: context.l10n.phone,
            prefixIcon: Icon(Icons.phone_outlined, size: 20.w),
            keyboardType: TextInputType.phone,
            validator: (v) =>
                v?.isEmpty ?? true ? context.l10n.fieldRequired : null,
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  controller: _dateController,
                  label: context.l10n.unit_details_booking_date,
                  prefixIcon: Icon(Icons.calendar_today_outlined, size: 20.w),
                  readOnly: true,
                  onTap: _selectDate,
                  validator: (v) =>
                      v?.isEmpty ?? true ? context.l10n.fieldRequired : null,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: AppTextFormField(
                  controller: _timeController,
                  label: context.l10n.unit_details_booking_time,
                  prefixIcon: Icon(Icons.access_time_rounded, size: 20.w),
                  readOnly: true,
                  onTap: _selectTime,
                  validator: (v) =>
                      v?.isEmpty ?? true ? context.l10n.fieldRequired : null,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          AppTextFormField(
            controller: _notesController,
            label: context.l10n.unit_details_booking_notes,
            prefixIcon: Icon(Icons.notes_rounded, size: 20.w),
            maxLines: 3,
          ),
          BlocSelector<
            UnitDetailsCubit,
            UnitDetailsState,
            ({RequestStatus status, String? errorMessage})
          >(
            selector: (state) => (
              status: state.bookingStatus,
              errorMessage: state.bookingErrorMessage,
            ),
            builder: (context, result) => Column(
              children: [
                if (result.status == RequestStatus.failure &&
                    result.errorMessage != null) ...[
                  SizedBox(height: 16.h),
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: context.colorScheme.errorContainer.withValues(
                        alpha: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: context.colorScheme.error.withValues(alpha: 0.5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline_rounded,
                          color: context.colorScheme.error,
                          size: 20.w,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            result.errorMessage!,
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colorScheme.error,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                SizedBox(height: 4.h),
                TermsCheckbox(
                  value: _agreedToTerms,
                  onChanged: (v) => setState(() => _agreedToTerms = v ?? false),
                ),
                SizedBox(height: 4.h),
                AppElevatedButton(
                  onPressed: () => _submit(context),
                  isLoading: result.status == RequestStatus.loading,
                  enabled: _agreedToTerms,
                  text: context.l10n.reserveNow,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
