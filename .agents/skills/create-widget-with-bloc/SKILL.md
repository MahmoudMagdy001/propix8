---
name: create-widget-with-bloc
description: Create or modify a UI widget that consumes a Bloc or Cubit, using BlocSelector to optimize performance and prevent unnecessary rebuilds.
---

When the user asks to create or modify a UI widget that consumes a Bloc or Cubit, follow these guidelines to ensure optimal performance and avoid unnecessary rebuilds:

1. **Prefer `BlocSelector` over `BlocBuilder`**:
   To prevent the entire widget or large widget trees from rebuilding when unrelated parts of the Bloc's state change, use `BlocSelector`.
   - Use `BlocSelector` when the widget only needs to rebuild based on a specific property (e.g., `status`, a list of items, or a single boolean flag).
   - Only use `BlocBuilder` when the UI layout depends on complex, multi-field state changes that cannot be easily isolated.

2. **Structure of `BlocSelector`**:
   Specify the Bloc, the State, and the selected value's type explicitly:
   ```dart
   BlocSelector<MyBloc, MyState, SelectedType>(
     selector: (state) => state.someProperty,
     builder: (context, selectedValue) {
       // Rebuilds ONLY when state.someProperty changes.
       return MySubWidget(value: selectedValue);
     },
   )
   ```

3. **Common Selectors**:
   - **Status Selector**: To show loading, error, or success states.
     ```dart
     BlocSelector<AuthBloc, AuthState, AppStatus>(
       selector: (state) => state.status,
       builder: (context, status) {
         if (status == AppStatus.loading) {
           return const AppLoading();
         }
         return const MyContentWidget();
       },
     )
     ```
   - **Field Selector**: To display a specific field (e.g., username).
     ```dart
     BlocSelector<UserBloc, UserState, String>(
       selector: (state) => state.userName,
       builder: (context, userName) {
         return Text(
           userName,
           style: context.textTheme.titleMedium,
         );
       },
     )
     ```

4. **Combine with `BlocListener` for Side Effects**:
   Do not trigger navigation, snackbars, or dialogs inside the `builder` of `BlocSelector` or `BlocBuilder`. Use `BlocListener` or `BlocConsumer` (if both rebuild and side-effects are needed).
   ```dart
   BlocListener<MyBloc, MyState>(
     listenWhen: (previous, current) => previous.status != current.status,
     listener: (context, state) {
       if (state.status == AppStatus.failure) {
         showSnackBar(context, state.errorMessage ?? context.l10n.unknownError);
       }
     },
     child: const MyWidgetBody(),
   )
   ```

5. **Aesthetics & Styling Checklist**:
   - Ensure all dimensions use `ScreenUtil` extensions (e.g., `16.w`, `24.h`, `12.r`).
   - Use semantic context extensions (`context.colors`, `context.textTheme`, `context.l10n`).
   - Use shared widgets: `AppButton`, `AppTextField`, `AppLoading`, `CommonImage`.
   - Never use hardcoded strings (always use `context.l10n`).
   - Always use trailing commas for clean formatting.
