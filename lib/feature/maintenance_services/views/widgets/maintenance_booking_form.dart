import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../auth/models/auth_model.dart';
import '../../viewmodels/maintenance_booking_cubit.dart';

class MaintenanceBookingForm extends StatefulWidget {
  const MaintenanceBookingForm({
    required this.serviceId,
    required this.serviceName,
    super.key,
  });

  final int serviceId;
  final String serviceName;

  @override
  State<MaintenanceBookingForm> createState() => _MaintenanceBookingFormState();
}

class _MaintenanceBookingFormState extends State<MaintenanceBookingForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  final _messageController = TextEditingController();

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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.response?.message ?? context.l10n.success),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        } else if (state.status == BookingStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? context.l10n.errorOccurred),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) => SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        child: Form(
          key: _formKey,
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
              _buildTextField(
                controller: _phoneController,
                label: context.l10n.phone,
                icon: Icons.phone_outlined,
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
              _buildTextField(
                controller: _addressController,
                label: context.l10n.location,
                icon: Icons.location_on_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.l10n.addressRequired;
                  }
                  return null;
                },
              ),
              SizedBox(height: 12.h),
              _buildTextField(
                controller: _messageController,
                label: context.l10n.message,
                icon: Icons.notes_rounded,
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
                  return ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              context
                                  .read<MaintenanceBookingCubit>()
                                  .bookMaintenance(
                                    maintenanceServiceId: widget.serviceId,
                                    phone: _phoneController.text,
                                    address: _addressController.text,
                                    message: _messageController.text,
                                  );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: isLoading
                        ? SizedBox(
                            height: 20.h,
                            width: 20.h,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : Text(context.l10n.bookNow),
                  );
                },
              ),
            ],
          ),
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
