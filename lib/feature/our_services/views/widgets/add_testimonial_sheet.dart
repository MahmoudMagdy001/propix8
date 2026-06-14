import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_elevated_button.dart';
import 'package:propix8/core/widgets/app_form.dart';
import 'package:propix8/core/widgets/app_modal_sheet.dart';
import 'package:propix8/core/widgets/app_text_form_field.dart';
import 'package:propix8/feature/our_services/models/testimonial_model.dart';
import 'package:propix8/feature/our_services/viewmodels/our_services_cubit.dart';
import 'package:propix8/feature/our_services/viewmodels/our_services_state.dart';

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
  final _appFormKey = GlobalKey<AppFormState>();

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
        child: BlocBuilder<OurServicesCubit, OurServicesState>(
          builder: (context, state) {
            final isLoading =
                state.addTestimonialStatus == OurServicesStatus.loading ||
                state.updateTestimonialStatus == OurServicesStatus.loading;

            return AppForm(
              key: _appFormKey,
              formKey: _formKey,
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppTextFormField(
                    controller: _contentController,
                    label: context.l10n.shareThoughts,
                    prefixIcon: Icon(Icons.notes_rounded, size: 20.w),
                    maxLines: 4,
                    validator: (value) => value?.trim().isEmpty ?? true
                        ? context.l10n.fieldRequired
                        : null,
                  ),
                  SizedBox(height: 24.h),
                  AppElevatedButton(
                    onPressed: () async {
                      if (_appFormKey.currentState?.validateAndScroll() ??
                          false) {
                        if (widget.testimonial != null) {
                          await context.read<OurServicesCubit>().updateTestimonial(
                            widget.testimonial!.id,
                            _contentController.text.trim(),
                          );
                        } else {
                          await context.read<OurServicesCubit>().addTestimonial(
                            _contentController.text.trim(),
                          );
                        }
                      }
                    },
                    isLoading: isLoading,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    text: widget.testimonial != null
                        ? context.l10n.update
                        : context.l10n.submit,
                  ),
                ],
              ),
            );
          },
        ),
      );
}
