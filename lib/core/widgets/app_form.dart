import 'dart:async';
import 'package:flutter/material.dart';

/// A scope that allows child fields to register themselves with the [AppForm].
abstract class AppFormScope {
  void registerField(GlobalKey key);
  void unregisterField(GlobalKey key);
}

/// A reusable form widget that wraps [Form] and [SingleChildScrollView]
/// and supports automatic scrolling to the first validation error.
class AppForm extends StatefulWidget {
  const AppForm({
    required this.child,
    required this.formKey,
    super.key,
    this.scrollController,
    this.padding,
    this.enableScrolling = true,
  });

  final Widget child;
  final GlobalKey<FormState> formKey;
  final ScrollController? scrollController;
  final EdgeInsetsGeometry? padding;
  final bool enableScrolling;

  static AppFormState of(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<_AppFormInheritedScope>();
    if (scope == null) {
      throw FlutterError(
        'AppForm.of() called with a context that does not contain an AppForm.',
      );
    }
    return scope.state;
  }

  @override
  State<AppForm> createState() => AppFormState();
}

class AppFormState extends State<AppForm> implements AppFormScope {
  late final ScrollController _scrollController;
  final List<GlobalKey> _registeredFields = [];

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  @override
  void registerField(GlobalKey key) {
    if (!_registeredFields.contains(key)) {
      _registeredFields.add(key);
    }
  }

  @override
  void unregisterField(GlobalKey key) {
    _registeredFields.remove(key);
  }

  /// Validates the form and scrolls to the first invalid field if validation fails.
  bool validateAndScroll() {
    final isValid = widget.formKey.currentState?.validate() ?? false;

    if (!isValid) {
      _scrollToFirstError();
    }

    return isValid;
  }

  void _scrollToFirstError() {
    for (final key in _registeredFields) {
      final state = key.currentState;
      if (state is FormFieldState && state.hasError) {
        final context = key.currentContext;
        if (context != null) {
          unawaited(
            Scrollable.ensureVisible(
              context,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              alignment: 0.2, // Align to top with some offset
            ),
          );

          // Focus the field if possible
          if (state is FocusNode) {
            // This depends on how the field is implemented
          }
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) => _AppFormInheritedScope(
    state: this,
    child: Form(
      key: widget.formKey,
      child: widget.enableScrolling
          ? SingleChildScrollView(
              controller: _scrollController,
              padding: widget.padding,
              child: widget.child,
            )
          : Padding(
              padding: widget.padding ?? EdgeInsets.zero,
              child: widget.child,
            ),
    ),
  );
}

class _AppFormInheritedScope extends InheritedWidget {
  const _AppFormInheritedScope({required this.state, required super.child});

  final AppFormState state;

  @override
  bool updateShouldNotify(_AppFormInheritedScope oldWidget) =>
      state != oldWidget.state;
}
