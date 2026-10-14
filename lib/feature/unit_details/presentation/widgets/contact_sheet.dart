import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/storage/storage_service.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/utils/snackbar_utils.dart';
import 'package:propix8/core/widgets/app_elevated_button.dart';
import 'package:propix8/core/widgets/app_form.dart';
import 'package:propix8/core/widgets/app_modal_sheet.dart';
import 'package:propix8/core/widgets/app_text_form_field.dart';
import 'package:propix8/feature/auth/models/auth_model.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_bloc.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_event.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_state.dart';

class ContactSheet extends StatefulWidget {
  const ContactSheet({super.key});

  static Future<void> show(BuildContext context) => showAppModalSheet(
        context: context,
        title: context.l10n.contactOwnerTitle,
        child: BlocProvider.value(
          value: context.read<UnitDetailsBloc>(),
          child: const ContactSheet(),
        ),
      );

  @override
  State<ContactSheet> createState() => _ContactSheetState();
}

class _ContactSheetState extends State<ContactSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  final _messageController = TextEditingController();
  final _appFormKey = GlobalKey<AppFormState>();

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
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<UnitDetailsBloc,
          UnitDetailsState>(
        listenWhen: (previous, current) =>
            previous.contactStatus != current.contactStatus,
        listener: (context, state) {
          if (state.contactStatus == HomeRequestStatus.success) {
            context.showSuccessSnackbar(context.l10n.contactUsSuccess);
            context
                .read<UnitDetailsBloc>()
                .add(const UnitDetailsEvent.contactStatusReset());
            Navigator.pop(context);
          } else if (state.contactStatus == HomeRequestStatus.failure) {
            context.showErrorSnackbar(
              state.contactErrorMessage ?? context.l10n.errorOccurred,
            );
            context
                .read<UnitDetailsBloc>()
                .add(const UnitDetailsEvent.contactStatusReset());
          }
        },
        builder: (context, state) {
          final owner = state.unit?.owner;

          return AppForm(
            key: _appFormKey,
            formKey: _formKey,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (owner != null) ...[
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24.r,
                        backgroundImage: owner.avatar.isNotEmpty
                            ? CachedNetworkImageProvider(owner.avatar)
                            : null,
                        child: owner.avatar.isEmpty
                            ? Text(owner.name.isNotEmpty
                                ? owner.name[0].toUpperCase()
                                : 'U')
                            : null,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              owner.name,
                              style: context.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (owner.role.isNotEmpty)
                              Text(
                                owner.role,
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                ],
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
                  validator: (value) => value?.isEmpty ?? true
                      ? context.l10n.phoneRequired
                      : null,
                ),
                SizedBox(height: 12.h),
                AppTextFormField(
                  controller: _messageController,
                  label: context.l10n.message,
                  prefixIcon: const Icon(Icons.message_outlined),
                  maxLines: 4,
                  validator: (value) => value?.isEmpty ?? true
                      ? context.l10n.fieldRequired
                      : null,
                ),
                SizedBox(height: 20.h),
                AppElevatedButton(
                  text: context.l10n.sendMessage,
                  isLoading: state.contactStatus == HomeRequestStatus.loading,
                  onPressed: () {
                    if (_appFormKey.currentState?.validateAndScroll() ?? false) {
                      context.read<UnitDetailsBloc>().add(
                            UnitDetailsEvent.contactOwnerSubmitted(
                              name: _nameController.text.trim(),
                              email: _emailController.text.trim(),
                              phone: _phoneController.text.trim(),
                              message: _messageController.text.trim(),
                            ),
                          );
                    }
                  },
                ),
                SizedBox(height: 8.h),
              ],
            ),
          );
        },
      );
}
