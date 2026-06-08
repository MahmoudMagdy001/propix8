import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/router/app_routes.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/utils/snackbar_utils.dart';
import 'package:propix8/feature/auth/viewmodels/auth_cubit.dart';
import 'package:propix8/feature/auth/viewmodels/auth_state.dart';

class EmailVerificationHandler extends StatefulWidget {
  const EmailVerificationHandler({
    required this.id,
    required this.hash,
    required this.queryParams,
    super.key,
  });

  final String id;
  final String hash;
  final Map<String, String> queryParams;

  @override
  State<EmailVerificationHandler> createState() =>
      _EmailVerificationHandlerState();
}

class _EmailVerificationHandlerState extends State<EmailVerificationHandler> {
  @override
  void initState() {
    super.initState();
    _verify();
  }

  void _verify() {
    // Reconstruct the URL
    // The format from laravel typically needs the full signature url
    // baseUrl/api/email/verify/{id}/{hash}?expires=...&signature=...
    // But since we are catching /api/email/verify/:id/:hash in app,
    // we need to construct the full verify URL that the backend expects.
    // The link the user provided is: https://www.propix8.com/api/email/verify/25/...
    // Our repository method `verifyEmail(url)` takes the full URL.

    const baseUrl = 'https://www.propix8.com/api/email/verify';
    final queryString = widget.queryParams.entries
        .map((e) => '${e.key}=${e.value}')
        .join('&');
    final fullUrl = '$baseUrl/${widget.id}/${widget.hash}?$queryString';

    context.read<AuthCubit>().verifyEmail(fullUrl);
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
    value: locator<AuthCubit>(),
    child: BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.verificationStatus != current.verificationStatus,
      listener: (context, state) {
        if (state.verificationStatus == AuthRequestStatus.success) {
          context
            ..showSuccessSnackbar(context.l10n.emailVerified)
            ..goNamed(AppRoutes.login);
        } else if (state.verificationStatus == AuthRequestStatus.failure) {
          context
            ..showErrorSnackbar(state.errorMessage ?? context.l10n.error)
            ..goNamed(AppRoutes.login);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              SizedBox(height: 16.h),
              Text(context.l10n.verifyingEmail),
            ],
          ),
        ),
      ),
    ),
  );
}
