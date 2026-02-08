import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/public_feature/services/storage_service.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/utils/snackbar_utils.dart';
import '../../../../core/widgets/app_modal_sheet.dart';
import '../../../auth/models/auth_model.dart';
import '../../viewmodels/unit_details_cubit.dart';
import '../../viewmodels/unit_details_state.dart';

class ContactSheet extends StatefulWidget {
  const ContactSheet({super.key});

  static Future<void> show(BuildContext context) => showAppModalSheet(
    context: context,
    title: context.l10n.contactOwnerTitle,
    child: BlocProvider.value(
      value: context.read<UnitDetailsCubit>(),
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
  Widget build(
    BuildContext context,
  ) => BlocListener<UnitDetailsCubit, UnitDetailsState>(
    listenWhen: (previous, current) =>
        previous.contactStatus != current.contactStatus,
    listener: (context, state) {
      if (state.contactStatus == RequestStatus.success) {
        Navigator.of(context).pop();
        context.showSuccessSnackbar(context.l10n.messageSuccess);
        context.read<UnitDetailsCubit>().resetContactStatus();
      } else if (state.contactStatus == RequestStatus.failure) {
        context.showErrorSnackbar(
          state.contactErrorMessage ?? context.l10n.messageFailure,
        );
        context.read<UnitDetailsCubit>().resetContactStatus();
      }
    },
    child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: BlocBuilder<UnitDetailsCubit, UnitDetailsState>(
        builder: (context, state) {
          final owner = state.unit?.owner;

          return Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (owner != null) ...[
                  Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      color: context.theme.cardTheme.color,
                      borderRadius: BorderRadius.circular(12.r),
                      // border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: owner.avatar,
                            width: 48.r,
                            height: 48.r,
                            fit: BoxFit.cover,

                            memCacheWidth: 200,

                            errorWidget: (_, _, _) => CircleAvatar(
                              radius: 24.r,
                              backgroundColor: context.colorScheme.primary
                                  .withValues(alpha: 0.1),
                              child: Icon(
                                Icons.person,
                                color: context.colorScheme.primary,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.contactOwnerTitle,
                                style: context.textTheme.labelSmall?.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 2.h),
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
                                    color: context.colorScheme.primary,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
                _buildTextField(
                  controller: _nameController,
                  label: context.l10n.name,
                  icon: Icons.person_outline_rounded,
                  validator: (value) => value?.isEmpty ?? true
                      ? context.l10n.fieldRequired
                      : null,
                ),
                SizedBox(height: 12.h),
                _buildTextField(
                  controller: _emailController,
                  label: context.l10n.email,
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value?.isEmpty ?? true
                      ? context.l10n.fieldRequired
                      : null,
                ),
                SizedBox(height: 12.h),
                _buildTextField(
                  controller: _phoneController,
                  label: context.l10n.phone,
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  validator: (value) => value?.isEmpty ?? true
                      ? context.l10n.fieldRequired
                      : null,
                ),
                SizedBox(height: 12.h),
                _buildTextField(
                  controller: _messageController,
                  label: context.l10n.message,
                  icon: Icons.notes_rounded,
                  maxLines: 4,
                  validator: (value) => value?.isEmpty ?? true
                      ? context.l10n.fieldRequired
                      : null,
                ),
                SizedBox(height: 16.h),
                BlocSelector<UnitDetailsCubit, UnitDetailsState, RequestStatus>(
                  selector: (state) => state.contactStatus,
                  builder: (context, status) => ElevatedButton(
                    onPressed: status == RequestStatus.loading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              context.read<UnitDetailsCubit>().contactOwner(
                                name: _nameController.text,
                                email: _emailController.text,
                                phone: _phoneController.text,
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
                    child: status == RequestStatus.loading
                        ? SizedBox(
                            height: 20.h,
                            width: 20.h,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : Text(context.l10n.send),
                  ),
                ),
              ],
            ),
          );
        },
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
