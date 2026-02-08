import 'package:flutter/material.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
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
          AppTextFormField(
            controller: _phoneController,
            label: context.l10n.phone,
            prefixIcon: const Icon(Icons.phone_outlined),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.l10n.phoneRequired;
              }
              return null;
            },
          ),
          SizedBox(height: 12.h),
          AppTextFormField(
            controller: _addressController,
            label: context.l10n.address,
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
            label: context.l10n.messageOptional,
            prefixIcon: const Icon(Icons.notes_rounded),
            maxLines: 3,
          ),
          SizedBox(height: 16.h),
          AppElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pop(context, {
                  'phone': _phoneController.text,
                  'address': _addressController.text,
                  'message': _messageController.text,
                });
              }
            },
            padding: EdgeInsets.symmetric(vertical: 16.h),
            text: context.l10n.saveChanges,
          ),
        ],
      ),
    ),
  );
}
