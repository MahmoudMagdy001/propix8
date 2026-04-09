import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_state_manager/internet_state_manager.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/utils/snackbar_utils.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_form.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../auth/models/auth_model.dart';
import '../../auth/models/city_model.dart';
import '../viewmodels/user_profile_cubit.dart';
import '../viewmodels/user_profile_state.dart';

class EditProfileDataView extends StatefulWidget {
  const EditProfileDataView({super.key});

  @override
  State<EditProfileDataView> createState() => _EditProfileDataViewState();
}

class _EditProfileDataViewState extends State<EditProfileDataView> {
  final _formKey = GlobalKey<FormState>();
  final _appFormKey = GlobalKey<AppFormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _cityIdController;
  File? _avatarFile;

  @override
  void initState() {
    super.initState();
    context.read<UserProfileCubit>().fetchCities();
    final user = context.read<UserProfileCubit>().state.user;
    _nameController = TextEditingController(text: user?.name ?? '');
    _phoneController = TextEditingController(text: user?.phone ?? '');
    _addressController = TextEditingController(text: user?.address ?? '');
    _cityIdController = TextEditingController(
      text: user?.cityId?.toString() ?? '',
    );

    _nameController.addListener(() => setState(() {}));
    _phoneController.addListener(() => setState(() {}));
    _addressController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityIdController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      var file = File(pickedFile.path);

      final targetPath =
          '${file.absolute.path.replaceAll(RegExp(r'\.(png|jpg|jpeg)'), '')}_compressed.jpg';

      final result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: 100,
        minWidth: 800,
        minHeight: 800,
      );

      if (result != null) {
        file = File(result.path);
      }

      if (!mounted) return;

      setState(() {
        _avatarFile = file;
      });
    }
  }

  void _submit() {
    if (_appFormKey.currentState!.validateAndScroll()) {
      final data = {
        'name': _nameController.text,
        'phone': _phoneController.text,
        'address': _addressController.text,
        'city_id': _cityIdController.text,
      };

      context.read<UserProfileCubit>().updateProfile(
        data,
        avatarPath: _avatarFile?.path,
      );
    }
  }

  bool _hasDataChanged() {
    final user = context.read<UserProfileCubit>().state.user;
    if (user == null) return false;

    if (_avatarFile != null) return true;

    final nameChanged = _nameController.text.trim() != (user.name ?? '');
    final phoneChanged = _phoneController.text.trim() != (user.phone ?? '');
    final addressChanged =
        _addressController.text.trim() != (user.address ?? '');
    final cityChanged =
        _cityIdController.text != (user.cityId?.toString() ?? '');

    return nameChanged || phoneChanged || addressChanged || cityChanged;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(context.l10n.editData),
      centerTitle: true,
      leading: const CustomBackButton(),
    ),
    body: BlocConsumer<UserProfileCubit, UserProfileState>(
      listener: (context, state) {
        if (state.status == UserProfileStatus.updated) {
          context.showSuccessSnackbar(context.l10n.profileUpdateSuccess);
        } else if (state.status == UserProfileStatus.failure) {
          context.showErrorSnackbar(
            state.errorMessage ?? context.l10n.errorOccurred,
          );
        }
      },
      builder: (context, state) =>
          BlocSelector<
            UserProfileCubit,
            UserProfileState,
            ({UserProfileStatus status, List<City> cities, User? user})
          >(
            selector: (state) =>
                (status: state.status, cities: state.cities, user: state.user),
            builder: (context, result) {
              final isLoading = result.status == UserProfileStatus.loading;
              final cities = result.cities;
              final user = result.user;

              return InternetStateManager(
                noInternetScreen: const NoInternetScreen(),
                onRestoreInternetConnection: () {
                  context.read<UserProfileCubit>().fetchCities();
                },
                child: AppForm(
                  key: _appFormKey,
                  formKey: _formKey,
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 50.r,
                              child: ClipOval(
                                child: _avatarFile != null
                                    ? Image.file(
                                        cacheHeight: 100 * 3,
                                        _avatarFile!,
                                        width: 100.w,
                                        height: 100.h,
                                        fit: BoxFit.cover,
                                      )
                                    : (user?.avatar != null &&
                                          user?.avatar != '')
                                    ? CachedNetworkImage(
                                        memCacheHeight: 100 * 3,
                                        imageUrl: user!.avatar!,
                                        width: 100.w,
                                        height: 100.h,
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.broken_image),
                                      )
                                    : Icon(
                                        Icons.person,
                                        size: 50.r,
                                        color: Colors.grey,
                                      ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 18.r,
                                backgroundColor: context.colorScheme.primary,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 18.r,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),
                      AppTextFormField(
                        controller: _nameController,
                        label: context.l10n.name,
                        prefixIcon: const Icon(Icons.person_outline),
                        validator: (v) =>
                            v!.isEmpty ? context.l10n.requiredField : null,
                      ),
                      SizedBox(height: 16.h),
                      AppTextFormField(
                        controller: _phoneController,
                        label: context.l10n.phone,
                        prefixIcon: const Icon(Icons.phone_outlined),
                        keyboardType: TextInputType.phone,
                        validator: (v) =>
                            v!.isEmpty ? context.l10n.requiredField : null,
                      ),
                      SizedBox(height: 16.h),
                      AppTextFormField(
                        controller: _addressController,
                        label: context.l10n.address,
                        prefixIcon: const Icon(Icons.location_on_outlined),
                      ),
                      SizedBox(height: 16.h),
                      DropdownButtonFormField<int>(
                        decoration: InputDecoration(
                          labelText: context.l10n.city,
                          prefixIcon: const Icon(Icons.location_city_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        initialValue: int.tryParse(_cityIdController.text),
                        items: cities
                            .map(
                              (City city) => DropdownMenuItem<int>(
                                value: city.id,
                                child: Text(city.name),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _cityIdController.text = value.toString();
                            });
                          }
                        },
                        validator: (value) =>
                            value == null ? context.l10n.requiredField : null,
                      ),
                      SizedBox(height: 32.h),
                      AppElevatedButton(
                        onPressed: _submit,
                        isLoading: isLoading,
                        enabled: _hasDataChanged(),
                        text: context.l10n.saveChanges,
                        width: double.infinity,
                        height: 50.h,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
    ),
  );
}
