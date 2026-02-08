import 'package:flutter/material.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../models/maintenance_booking_model.dart';

class EditMaintenanceBookingSheet extends StatefulWidget {
  const EditMaintenanceBookingSheet({required this.booking, super.key});

  final MaintenanceBookingModel booking;

  @override
  State<EditMaintenanceBookingSheet> createState() =>
      _EditMaintenanceBookingSheetState();
}

class _EditMaintenanceBookingSheetState
    extends State<EditMaintenanceBookingSheet> {
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;
  late final TextEditingController _messageController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController(text: widget.booking.phone);
    _addressController = TextEditingController(text: widget.booking.address);
    _messageController = TextEditingController(text: widget.booking.message);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _addressController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
    child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField(
            controller: _phoneController,
            label: context.l10n.phone,
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.l10n.phoneRequired;
              }
              return null;
            },
          ),
          SizedBox(height: 12.h),
          _buildTextField(
            controller: _addressController,
            label: context.l10n.address,
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
            label: context.l10n.messageOptional,
            icon: Icons.notes_rounded,
            maxLines: 3,
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pop(context, {
                  'phone': _phoneController.text,
                  'address': _addressController.text,
                  'message': _messageController.text,
                });
              }
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(context.l10n.saveChanges),
          ),
        ],
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
