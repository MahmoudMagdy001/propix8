import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/app_modal_sheet.dart';
import '../../models/testimonial_model.dart';
import '../../viewmodels/our_services_cubit.dart';
import '../../viewmodels/our_services_state.dart';

class AddTestimonialSheet extends StatefulWidget {
  const AddTestimonialSheet({super.key, this.testimonial});

  final TestimonialModel? testimonial;

  static Future<void> show(
    BuildContext context, {
    TestimonialModel? testimonial,
  }) => showAppModalSheet(
    context: context,
    title: testimonial != null
        ? context.l10n.editTestimonial
        : context.l10n.addTestimonial,
    child: BlocProvider.value(
      value: context.read<OurServicesCubit>(),
      child: AddTestimonialSheet(testimonial: testimonial),
    ),
  );

  @override
  State<AddTestimonialSheet> createState() => _AddTestimonialSheetState();
}

class _AddTestimonialSheetState extends State<AddTestimonialSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _contentController = TextEditingController(
      text: widget.testimonial?.content,
    );
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<OurServicesCubit, OurServicesState>(
        listenWhen: (previous, current) =>
            previous.addTestimonialStatus != current.addTestimonialStatus ||
            previous.updateTestimonialStatus != current.updateTestimonialStatus,
        listener: (context, state) {
          final isSuccess =
              state.addTestimonialStatus == OurServicesStatus.success ||
              state.updateTestimonialStatus == OurServicesStatus.success;

          if (isSuccess) {
            Navigator.of(context).pop();
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: BlocBuilder<OurServicesCubit, OurServicesState>(
            builder: (context, state) {
              final isLoading =
                  state.addTestimonialStatus == OurServicesStatus.loading ||
                  state.updateTestimonialStatus == OurServicesStatus.loading;

              return Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTextField(
                      controller: _contentController,
                      label: context.l10n.shareThoughts,
                      icon: Icons.notes_rounded,
                      maxLines: 4,
                      validator: (value) => value?.trim().isEmpty ?? true
                          ? context.l10n.fieldRequired
                          : null,
                    ),
                    SizedBox(height: 24.h),
                    ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                if (widget.testimonial != null) {
                                  context
                                      .read<OurServicesCubit>()
                                      .updateTestimonial(
                                        widget.testimonial!.id,
                                        _contentController.text.trim(),
                                      );
                                } else {
                                  context
                                      .read<OurServicesCubit>()
                                      .addTestimonial(
                                        _contentController.text.trim(),
                                      );
                                }
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
                          : Text(
                              widget.testimonial != null
                                  ? context.l10n.update
                                  : context.l10n.submit,
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
