# Project Architecture Rules (Canonical)

> **Status**: GLOBAL STANDARD
> **Reference Feature**: `lib/feature/unit_details`
> **Scope**: All Features (`lib/feature/*`)
> **Enforcement**: Strict

This document defines the mandatory architectural patterns for ALL features in the project. It is based on the `unit_details` reference implementation. All future additions must comply with these rules.

---

## 1. Architecture Overview

The feature follows a **Feature-First MVVM** architecture with a **Repository Pattern**.

**Layer Responsibilities:**
- **View (`views/`)**: Render UI based on state. Passive. No logic.
- **ViewModel (`viewmodels/`)**: Manage state, handle user input, call repositories.
- **Repository (`repositories/`)**: Abstract data sources, handle data conversion (JSON -> Model).
- **Service (`services/`)**: Handle raw network requests (Dio -> JSON).
- **Model (`models/`)**: Immutable data structures.

---

## 2. Folder Structure Rules

The folder structure is **strict**. No new top-level folders allowed within the feature.

```
lib/feature/feature_name/
├── models/        # Data classes (Equatable, JsonSerializable)
├── repositories/  # Repository Interfaces + Implementations
├── services/      # API Services (Dio only)
├── viewmodels/    # Cubits + States
└── views/         # UI Widgets
    └── widgets/   # Sub-widgets specific to this feature
```

---

## 3. Naming Conventions

| Component | File Naming | Class Naming | Example |
| :--- | :--- | :--- | :--- |
| **Model** | `*_model.dart` | `*Model` | `UnitDetailsModel` |
| **Repository** | `*_repository.dart` | `*Repository`, `*RepositoryImpl` | `UnitDetailsRepository` |
| **Service** | `*_service.dart` | `*Service` | `UnitDetailsService` |
| **Cubit** | `*_cubit.dart` | `*Cubit` | `UnitDetailsCubit` |
| **State** | `*_state.dart` | `*State` | `UnitDetailsState` |
| **View** | `*_view.dart` | `*View` | `UnitDetailsView` |

---

## 4. State Management Rules (Strict)

1.  **Single State Class**: Each Cubit must have exactly ONE state class.
2.  **Immutability**: State class must be `@immutable`, extend `Equatable`, and have `final` fields.
3.  **Status Enum**: Use `RequestStatus` enum (`initial`, `loading`, `success`, `failure`) for async operations.
4.  **Granular Statuses**: Use separate `RequestStatus` fields for independent operations (e.g., `status` for main data, `reviewStatus` for submitting reviews).
    ```dart
    // ✅ Correct
    final RequestStatus status;
    final RequestStatus reviewStatus;
    ```
5.  **No Inheritance**: Do NOT use `class Loading extends State` or `class Success extends State`. Use fields.

---

## 5. View / UI Rules

1.  **Passive UI**: Views must only render data from `state`. No business logic in `build()`.
2.  **BlocSelector**: Use `BlocSelector` or `BlocBuilder` to listen to specific parts of the state to minimize rebuilds.
3.  **Responsiveness**: ALL dimensions (padding, size, radius) must use `flutter_screenutil` (`.w`, `.h`, `.sp`, `.r`).
4.  **Widgets**: Complex UI components must be extracted to `views/widgets/`.
5.  **Localization**: Use `context.l10n` for all user-facing text.
6.  **State Initialization**: Use `BlocProvider.value` if the Cubit is provided via DI.

---

## 6. Data & Repository Rules

1.  **Service Responsibility**:
    -   Must use `DioClient`.
    -   Returns `Future<Map<String, dynamic>>` (raw JSON) or `Future<void>`.
    -   Must not parse models.
    -   Must rethrow exceptions.

2.  **Repository Responsibility**:
    -   Depends on `Service`.
    -   Parses JSON into Models (`Model.fromJson`).
    -   Returns `Future<Model>` or `Future<void>`.
    -   Must rethrow exceptions for the Cubit to handle.

3.  **Model Rules**:
    -   Must extend `Equatable`.
    -   Must have `const` constructor.
    -   `fromJson` factory for parsing.
    -   `dummy` static getter for testing/skeleton is encouraged.

---

## 7. Forbidden Patterns (Do NOT Do This)

-   ❌ **No Logic in UI**: Do not call `repo.getData()` inside a widget. Call `cubit.getData()`.
-   ❌ **No Service in Cubit**: Cubits must talk to Repositories, NEVER directly to Services.
-   ❌ **No Mutable State**: State fields must always be `final`.
-   ❌ **No Hardcoded Strings**: Use `l10n`.
-   ❌ **No Hardcoded Dimensions**: Use `ScreenUtil`.
-   ❌ **No Dynamic Types**: Use strict types in Models and Repositories.
