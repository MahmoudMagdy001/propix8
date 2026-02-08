import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/date_time_utils.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/app_modal_sheet.dart';
import '../../../../core/widgets/terms_checkbox.dart';
import '../../../auth/models/auth_model.dart';
import '../../models/booking_request_model.dart';
import '../../viewmodels/unit_details_cubit.dart';
import '../../viewmodels/unit_details_state.dart';

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

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final request = BookingRequest(
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
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.symmetric(horizontal: 6.w),
    child: BlocConsumer<UnitDetailsCubit, UnitDetailsState>(
      listenWhen: (previous, current) =>
          previous.bookingStatus != current.bookingStatus,
      listener: (context, state) {
        if (state.bookingStatus == RequestStatus.success) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.bookingSuccessMessage ?? context.l10n.bookingSuccess,
              ),
              backgroundColor: Colors.green,
            ),
          );
          context.read<UnitDetailsCubit>().resetBookingStatus();
        } else if (state.bookingStatus == RequestStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.bookingErrorMessage ?? context.l10n.error),
              backgroundColor: Colors.red,
            ),
          );
          context.read<UnitDetailsCubit>().resetBookingStatus();
        }
      },
      builder: (context, state) => Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(
              controller: _nameController,
              label: context.l10n.name,
              icon: Icons.person_outline_rounded,
              validator: (v) =>
                  v?.isEmpty ?? true ? context.l10n.fieldRequired : null,
            ),
            SizedBox(height: 12.h),
            _buildTextField(
              controller: _emailController,
              label: context.l10n.email,
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: (v) =>
                  v?.isEmpty ?? true ? context.l10n.fieldRequired : null,
            ),
            SizedBox(height: 12.h),
            _buildTextField(
              controller: _phoneController,
              label: context.l10n.phone,
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              validator: (v) =>
                  v?.isEmpty ?? true ? context.l10n.fieldRequired : null,
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: _dateController,
                    label: context.l10n.unit_details_booking_date,
                    icon: Icons.calendar_today_outlined,
                    readOnly: true,
                    onTap: _selectDate,
                    validator: (v) =>
                        v?.isEmpty ?? true ? context.l10n.fieldRequired : null,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildTextField(
                    controller: _timeController,
                    label: context.l10n.unit_details_booking_time,
                    icon: Icons.access_time_rounded,
                    readOnly: true,
                    onTap: _selectTime,
                    validator: (v) =>
                        v?.isEmpty ?? true ? context.l10n.fieldRequired : null,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            _buildTextField(
              controller: _notesController,
              label: context.l10n.unit_details_booking_notes,
              icon: Icons.notes_rounded,
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
                          color: context.colorScheme.error.withValues(
                            alpha: 0.5,
                          ),
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
                    onChanged: (v) =>
                        setState(() => _agreedToTerms = v ?? false),
                  ),
                  SizedBox(height: 4.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                          result.status == RequestStatus.loading ||
                              !_agreedToTerms
                          ? null
                          : _submit,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: result.status == RequestStatus.loading
                          ? SizedBox(
                              height: 20.h,
                              width: 20.h,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                          : Text(context.l10n.reserveNow),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    bool readOnly = false,
    VoidCallback? onTap,
    int maxLines = 1,
  }) => TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    validator: validator,
    readOnly: readOnly,
    onTap: onTap,
    maxLines: maxLines,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, size: 20.w),
    ),
  );
}
