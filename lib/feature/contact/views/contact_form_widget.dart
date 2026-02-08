import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../auth/models/auth_model.dart';
import '../models/contact_request_model.dart';
import '../viewmodels/contact_cubit.dart';
import '../viewmodels/contact_state.dart';

class ContactFormWidget extends StatefulWidget {
  const ContactFormWidget({super.key});

  @override
  State<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;

  final _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final userMap = locator<StorageService>().getUser();
    final user = userMap != null ? User.fromJson(userMap) : null;
    _nameController = TextEditingController(text: user?.name ?? '');
    _emailController = TextEditingController(text: user?.email ?? '');
    _phoneController = TextEditingController(text: user?.phone ?? '');
    _addressController = TextEditingController(text: user?.address ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => locator<ContactCubit>(),
    child: BlocListener<ContactCubit, ContactState>(
      listener: (context, state) {
        if (state.status == ContactStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.l10n.contactUsSuccess),
              backgroundColor: Colors.green,
            ),
          );
          _formKey.currentState?.reset();
          _nameController.clear();
          _emailController.clear();
          _phoneController.clear();
          _addressController.clear();
          _messageController.clear();
        } else if (state.status == ContactStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? context.l10n.error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 24.h, bottom: 6.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Text(
                  context.l10n.contactUsSection,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              _buildTextField(
                controller: _nameController,
                label: context.l10n.name,
                validator: (value) =>
                    value?.isEmpty ?? true ? context.l10n.fieldRequired : null,
              ),
              SizedBox(height: 12.h),
              _buildTextField(
                controller: _emailController,
                label: context.l10n.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value?.isEmpty ?? true) return context.l10n.fieldRequired;
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value!)) {
                    return context.l10n.invalidEmail;
                  }
                  return null;
                },
              ),
              SizedBox(height: 12.h),
              _buildTextField(
                controller: _phoneController,
                label: context.l10n.phone,
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value?.isEmpty ?? true ? context.l10n.fieldRequired : null,
              ),
              SizedBox(height: 12.h),
              _buildTextField(
                controller: _addressController,
                label: context.l10n.address,
                validator: (value) =>
                    value?.isEmpty ?? true ? context.l10n.fieldRequired : null,
              ),
              SizedBox(height: 12.h),
              _buildTextField(
                controller: _messageController,
                label: context.l10n.yourMessage,
                maxLines: 4,
                validator: (value) =>
                    value?.isEmpty ?? true ? context.l10n.fieldRequired : null,
              ),
              SizedBox(height: 24.h),
              BlocBuilder<ContactCubit, ContactState>(
                builder: (context, state) => ElevatedButton(
                  onPressed: state.status == ContactStatus.loading
                      ? null
                      : () {
                          if (_formKey.currentState?.validate() ?? false) {
                            final request = ContactRequestModel(
                              name: _nameController.text,
                              email: _emailController.text,
                              phone: _phoneController.text,
                              address: _addressController.text,
                              message: _messageController.text,
                            );
                            context.read<ContactCubit>().sendContactRequest(
                              request,
                            );
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: state.status == ContactStatus.loading
                      ? SizedBox(
                          height: 20.h,
                          width: 20.h,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(context.l10n.sendMessage),
                ),
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
    int maxLines = 1,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) => TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    ),
    maxLines: maxLines,
    keyboardType: keyboardType,
    validator: validator,
  );
}
