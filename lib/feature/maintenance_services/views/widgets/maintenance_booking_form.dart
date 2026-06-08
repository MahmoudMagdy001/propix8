import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/public_feature/services/storage_service.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/utils/snackbar_utils.dart';
import 'package:propix8/core/widgets/app_elevated_button.dart';
import 'package:propix8/core/widgets/app_form.dart';
import 'package:propix8/core/widgets/app_text_form_field.dart';
import 'package:propix8/feature/auth/models/auth_model.dart';
import 'package:propix8/feature/maintenance_services/viewmodels/maintenance_booking_cubit.dart';

class MaintenanceBookingForm extends StatefulWidget {
  const MaintenanceBookingForm({
    required this.serviceId,
    required this.serviceName,
    this.onBookingSuccess,
    super.key,
  });

  final int serviceId;
  final String serviceName;
  final VoidCallback? onBookingSuccess;

  @override
  State<MaintenanceBookingForm> createState() => _MaintenanceBookingFormState();
}

class _MaintenanceBookingFormState extends State<MaintenanceBookingForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  final _messageController = TextEditingController();
  final _appFormKey = GlobalKey<AppFormState>();

  @override
  void initState() {
    super.initState();
    final userMap = locator<StorageService>().getUser();
    final user = userMap != null ? User.fromJson(userMap) : null;
    _phoneController = TextEditingController(text: user?.phone ?? '');
    _addressController = TextEditingController(text: user?.address ?? '');
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _addressController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => locator<MaintenanceBookingCubit>(),
    child: BlocConsumer<MaintenanceBookingCubit, MaintenanceBookingState>(
      listener: (context, state) {
        if (state.status == BookingStatus.success) {
          // Notify parent about successful booking for reactive UI update
          widget.onBookingSuccess?.call();
          context.showSuccessSnackbar(
            state.response?.message ?? context.l10n.success,
          );
          Navigator.pop(context);
        } else if (state.status == BookingStatus.failure) {
          context.showErrorSnackbar(
            state.errorMessage ?? context.l10n.errorOccurred,
          );
        }
      },
      builder: (context, state) => AppForm(
        key: _appFormKey,
        formKey: _formKey,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${context.l10n.bookingFor} ${widget.serviceName}',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            AppTextFormField(
              controller: _phoneController,
              label: context.l10n.phone,
              prefixIcon: const Icon(Icons.phone_outlined),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.l10n.phoneRequired;
                }
                if (value.length < 11) {
                  return context.l10n.invalidPhoneNumber;
                }
                return null;
              },
            ),
            SizedBox(height: 12.h),
            AppTextFormField(
              controller: _addressController,
              label: context.l10n.location,
              prefixIcon: const Icon(Icons.location_on_outlined),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.l10n.addressRequired;
                }
                return null;
              },
            ),
            SizedBox(height: 12.h),
            AppTextFormField(
              controller: _messageController,
              label: context.l10n.message,
              prefixIcon: const Icon(Icons.notes_rounded),
              maxLines: 3,
            ),
            SizedBox(height: 16.h),
            BlocSelector<
              MaintenanceBookingCubit,
              MaintenanceBookingState,
              BookingStatus
            >(
              selector: (state) => state.status,
              builder: (context, status) {
                final isLoading = status == BookingStatus.loading;
                return AppElevatedButton(
                  onPressed: () {
                    if (_appFormKey.currentState?.validateAndScroll() ??
                        false) {
                      context.read<MaintenanceBookingCubit>().bookMaintenance(
                        maintenanceServiceId: widget.serviceId,
                        phone: _phoneController.text,
                        address: _addressController.text,
                        message: _messageController.text,
                      );
                    }
                  },
                  isLoading: isLoading,
                  text: context.l10n.bookNow,
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}
