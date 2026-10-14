# STRICT FLUTTER ARCHITECTURE MIGRATION — CLEAN ARCHITECTURE + BLoC + FREEZED

## ROLE

You are a senior Flutter/Dart architect and codebase migration engineer.

You must refactor the existing Flutter project from its current architecture into a **production-grade Clean Architecture + BLoC architecture**, while preserving all existing functionality and business behavior.

You have access to and MUST use these skills:

* `/flutter-app-architecture`
* `/flutter-best-practices`
* `/bloc`
* `/find-skills`
* `//testing`

Before making architectural decisions, inspect and use the relevant skill guidance.

---

# PRIMARY OBJECTIVE

The current project is structured approximately as:

```text
lib/
├── core/
└── feature/
    ├── feature_a/
    │   ├── models/
    │   ├── repositories/
    │   ├── services/
    │   ├── viewmodels/
    │   └── views/
    │
    ├── feature_b/
    └── ...
```

Current state:

* Feature-based organization
* ViewModels are implemented using `Cubit`
* `Equatable` is used for state equality
* Repository and service responsibilities may be mixed
* Domain/business logic may not be properly isolated
* Clean Architecture boundaries are not consistently enforced

The target architecture must be:

```text
Feature
│
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
│
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
│
└── presentation/
    ├── bloc/
    │   ├── feature_bloc.dart
    │   ├── feature_event.dart
    │   └── feature_state.dart
    │
    ├── pages/
    └── widgets/
```

And:

```text
core/
├── ...
```

The final architecture must follow:

**Clean Architecture + Feature-First organization + BLoC + Events + Freezed**

---

# NON-NEGOTIABLE RULES

## 1. DO NOT blindly rewrite the entire project

Do NOT perform a global uncontrolled refactor.

The migration MUST happen feature-by-feature.

The required workflow is:

```text
AUDIT
↓
ARCHITECTURE PLAN
↓
CORE MIGRATION
↓
FEATURE 1
↓
VERIFY FEATURE 1
↓
FEATURE 2
↓
VERIFY FEATURE 2
↓
FEATURE 3
↓
VERIFY FEATURE 3
↓
...
↓
GLOBAL CLEANUP
↓
FINAL VERIFICATION
```

Never move to the next feature while the current feature has unresolved architectural, compilation, generation, or behavioral issues.

---

# 2. PRESERVE BEHAVIOR

This is an architectural migration, NOT a business-logic rewrite.

You MUST preserve:

* Existing business rules
* API behavior
* Authentication behavior
* Navigation behavior
* Validation
* Error handling semantics
* Caching behavior
* Local storage behavior
* Database behavior
* User flows
* UI behavior
* Loading states
* Empty states
* Error states
* Success states
* Pagination
* Search
* Filtering
* Sorting
* Refresh behavior
* Dependency injection
* Existing integrations

Do not change application behavior unless a real bug is discovered.

If you discover a bug, document it before changing it.

---

# 3. NEVER MIX ARCHITECTURE LAYERS

Enforce strict dependency direction:

```text
Presentation
    ↓
Domain
    ↓
Data
```

Allowed:

```text
presentation → domain
data → domain
```

Not allowed:

```text
domain → data
domain → presentation
data → presentation
```

The domain layer MUST NOT depend on:

* Flutter UI
* Bloc
* Dio
* HTTP clients
* JSON serialization
* SharedPreferences
* Hive
* database packages
* platform APIs
* UI widgets
* BuildContext
* Flutter-specific infrastructure

---

# 4. BLoC MIGRATION

Every existing feature `Cubit` must be evaluated and migrated to:

```text
Bloc<Event, State>
```

Do NOT simply rename Cubit methods.

Analyze the existing state transitions and convert user/system actions into explicit Events.

Example:

CURRENT:

```dart
class LoginCubit extends Cubit<LoginState> {
  Future<void> login(String email, String password) async {
    ...
  }
}
```

TARGET:

```dart
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(...) : super(const LoginState.initial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }
}
```

Events should represent meaningful actions:

```text
LoginStarted
LoginSubmitted
LoginRetried
LogoutRequested
ProfileRequested
DataRefreshed
ItemSelected
ItemDeleted
```

Do NOT create meaningless events simply to increase the number of events.

Follow the BLoC skill guidance.

---

# 5. FREEZED MIGRATION

Remove `Equatable` from the architecture.

Replace state/event/entity/model equality with `Freezed` where appropriate.

Target:

```text
freezed
freezed_annotation
```

Use generated:

```text
copyWith
==
hashCode
pattern matching
sealed/unions
```

States should preferably use Freezed unions/sealed states where appropriate.

Example:

```dart
@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading() = LoginLoading;
  const factory LoginState.success(User user) = LoginSuccess;
  const factory LoginState.failure(Failure failure) = LoginFailure;
}
```

Events should also use Freezed when beneficial:

```dart
@freezed
sealed class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = LoginStarted;
  const factory LoginEvent.submitted({
    required String email,
    required String password,
  }) = LoginSubmitted;
}
```

Do not use Freezed mechanically for every class.

Use it where it provides real value.

---

# 6. ENTITY VS MODEL

Strictly separate Domain Entities from Data Models.

Example:

```text
domain/
└── entities/
    └── user.dart

data/
└── models/
    └── user_model.dart
```

Domain Entity:

```dart
class User {
  ...
}
```

Data Model:

```dart
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    ...
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
```

Models are responsible for:

* JSON serialization
* API representation
* database representation
* DTO mapping

Entities are responsible for:

* business/domain representation

Do not expose API DTOs directly to the presentation layer when a domain entity is appropriate.

---

# 7. REPOSITORIES

Repositories must be interfaces/contracts in Domain:

```text
domain/
└── repositories/
    └── user_repository.dart
```

Example:

```dart
abstract interface class UserRepository {
  Future<Either<Failure, User>> getUser();
}
```

Implementations belong in Data:

```text
data/
└── repositories/
    └── user_repository_impl.dart
```

Example:

```dart
class UserRepositoryImpl implements UserRepository {
  ...
}
```

The Domain layer must depend only on the repository abstraction.

---

# 8. SERVICES / DATASOURCES

Analyze all existing services.

Do not blindly rename `services` to `datasources`.

Determine whether each service is:

* Remote datasource
* Local datasource
* Repository implementation
* API client
* Infrastructure service
* Utility
* Domain service

Then place it correctly.

Example:

```text
data/
├── datasources/
│   ├── user_remote_datasource.dart
│   └── user_local_datasource.dart
```

Infrastructure-specific code must remain outside Domain.

---

# 9. USE CASES

Introduce Use Cases where they improve separation of responsibilities.

Typical structure:

```text
domain/
└── usecases/
    ├── login.dart
    ├── get_profile.dart
    └── update_profile.dart
```

A Use Case should represent one meaningful business operation.

Example:

```dart
class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
  }) {
    return repository.login(
      email: email,
      password: password,
    );
  }
}
```

Do NOT create useless use cases such as wrappers that provide no architectural value.

Follow YAGNI.

---

# 10. PRESENTATION RESPONSIBILITIES

Presentation must contain:

```text
presentation/
├── bloc/
├── pages/
└── widgets/
```

BLoC is responsible for:

* receiving events
* coordinating use cases
* state transitions
* presentation-level orchestration

Widgets are responsible for:

* rendering UI
* dispatching events
* reacting to states

Widgets must NOT:

* call repositories directly
* call datasources
* execute business logic
* perform API calls directly
* contain complex business rules

---

# 11. CORE

Inspect the current `core` folder carefully.

Do not move everything into Core.

Core should contain genuinely shared infrastructure such as:

```text
core/
├── error/
├── network/
├── constants/
├── extensions/
├── utils/
├── routing/
├── theme/
├── dependency_injection/
├── storage/
└── ...
```

Only place code in Core if it is genuinely shared.

Avoid creating:

```text
core/
└── random/
```

or generic dumping-ground folders.

---

# PHASE 0 — FULL PROJECT AUDIT

Before changing ANY code:

Inspect the entire project.

Analyze:

* `pubspec.yaml`
* `lib/`
* `core/`
* every feature
* every Cubit
* every State
* every Repository
* every Service
* every Model
* every View
* dependency injection
* routing
* API layer
* local storage
* generated files
* tests
* build configuration

Also inspect:

```text
analysis_options.yaml
```

and all relevant configuration files.

Create a complete inventory:

```text
Feature
├── Cubits
├── States
├── Events
├── Models
├── Repositories
├── Services
├── Views
├── Widgets
├── Use Cases
└── Dependencies
```

Identify:

* architecture violations
* duplicated logic
* tightly coupled layers
* unnecessary abstractions
* dead code
* unused dependencies
* duplicated models
* duplicated repositories
* services doing repository work
* Cubits doing business logic
* UI calling infrastructure directly
* domain depending on infrastructure
* incorrect dependency direction
* unnecessary `Equatable`
* opportunities for Freezed
* potential performance problems

DO NOT MODIFY CODE YET.

---

# PHASE 1 — ARCHITECTURE BLUEPRINT

Based on the audit, design the target architecture.

Create a migration table:

```text
Feature | Current Structure | Target Structure | Cubits | Repositories | Models | Use Cases | Risk
```

Then determine the safest migration order.

Prioritize:

1. Core/shared infrastructure
2. Independent/simple features
3. Medium-complexity features
4. Highly interconnected features
5. Authentication/core business features if dependencies require them

Do NOT choose migration order arbitrarily.

Explain dependencies between features.

---

# PHASE 2 — DEPENDENCIES

Analyze `pubspec.yaml`.

Ensure the project has the correct packages for the migration.

Expected architectural dependencies may include:

```yaml
flutter_bloc:
freezed_annotation:
freezed:
json_annotation:
json_serializable:
```

Do not add packages unnecessarily.

Do not upgrade unrelated packages just because newer versions exist.

Do not introduce additional architecture packages unless there is a strong reason.

Keep the dependency footprint minimal.

After dependency changes:

```bash
flutter pub get
```

Then verify the project.

---

# PHASE 3 — CORE MIGRATION

Before migrating individual features, clean and stabilize shared infrastructure.

Review:

* error handling
* Failure classes
* Result/Either handling
* network client
* API exceptions
* storage abstractions
* dependency injection
* routing
* constants
* extensions
* shared utilities

Ensure Core does not become a dumping ground.

If `fpdart` is already used, preserve it.

If introducing functional error handling is necessary, use it consistently rather than partially.

Do not mix multiple error-handling patterns without justification.

---

# PHASE 4 — FEATURE-BY-FEATURE MIGRATION

This is the most important phase.

For EACH feature:

## STEP 1 — Understand the Feature

Inspect:

```text
models
repositories
services
viewmodels
views
widgets
```

Understand:

* feature responsibilities
* data flow
* API flow
* state flow
* dependencies
* navigation
* business logic
* side effects
* error handling

Do NOT modify anything until the feature is understood.

---

## STEP 2 — Create Target Structure

Convert the feature into:

```text
feature/
└── feature_name/
    ├── data/
    │   ├── datasources/
    │   ├── models/
    │   └── repositories/
    │
    ├── domain/
    │   ├── entities/
    │   ├── repositories/
    │   └── usecases/
    │
    └── presentation/
        ├── bloc/
        ├── pages/
        └── widgets/
```

Use naming appropriate to the feature.

Do not create empty folders without purpose.

---

## STEP 3 — Migrate Models

For each existing model:

Determine whether it is:

* Domain Entity
* API DTO
* Database Model
* Request Model
* Response Model

Separate them appropriately.

Use Freezed for DTOs/models where beneficial.

Add JSON serialization where required.

Generate code.

---

## STEP 4 — Migrate Repositories

Move repository contracts to:

```text
domain/repositories/
```

Move implementations to:

```text
data/repositories/
```

Ensure:

```text
Bloc → UseCase → Repository Interface → Repository Implementation → Datasource
```

---

## STEP 5 — Migrate Services

Classify every service.

Move remote API access into Datasources.

Example:

```text
UserRemoteDataSource
```

Move local access into:

```text
UserLocalDataSource
```

Keep infrastructure details outside Domain.

---

## STEP 6 — Introduce Use Cases

Analyze existing Cubit methods and repository methods.

Identify actual business operations.

Create meaningful Use Cases only where justified.

Avoid creating unnecessary wrappers.

---

## STEP 7 — Convert Cubit → Bloc

For every Cubit:

### Before

```text
Cubit
├── State
└── methods
```

### After

```text
Bloc
├── Event
├── State
└── handlers
```

Analyze every Cubit method and map it to an Event.

Example:

```text
fetch()
→ FetchRequested

refresh()
→ RefreshRequested

delete(id)
→ DeleteRequested(id)

retry()
→ RetryRequested
```

Do not create events for internal helper methods.

---

## STEP 8 — Convert States to Freezed

Replace:

```text
Equatable
```

with Freezed-based states.

Prefer sealed unions for mutually exclusive states.

Example:

```dart
@freezed
sealed class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = ProductsInitial;
  const factory ProductsState.loading() = ProductsLoading;
  const factory ProductsState.loaded(
    List<Product> products,
  ) = ProductsLoaded;
  const factory ProductsState.failure(
    Failure failure,
  ) = ProductsFailure;
}
```

Only use a different state structure when the feature genuinely needs independent state fields.

---

## STEP 9 — Convert Events to Freezed

Example:

```dart
@freezed
sealed class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.started() = ProductsStarted;
  const factory ProductsEvent.refreshed() = ProductsRefreshed;
  const factory ProductsEvent.itemDeleted(String id) =
      ProductsItemDeleted;
}
```

Events must describe intentions/actions.

---

## STEP 10 — Update UI

Update all:

```text
BlocProvider
BlocBuilder
BlocListener
BlocConsumer
context.read
context.watch
BlocSelector
```

Replace Cubit usage with Bloc usage.

Prefer:

```dart
BlocSelector
```

where only a subset of state is required.

Avoid unnecessary rebuilds.

Do not put business logic into widgets.

---

# PHASE 5 — FEATURE VERIFICATION

After EACH feature migration:

Run:

```bash
dart format .
flutter analyze
flutter test
```

If the project has additional checks, run them too.

Also inspect generated files.

Verify:

* no compilation errors
* no analyzer errors
* no broken imports
* no missing generated files
* no `Equatable` usage in migrated code
* no Cubit usage in migrated feature
* no repository access from UI
* no datasource access from UI
* no domain → data dependency
* no presentation → data dependency
* no accidental behavior changes

Then manually trace:

```text
UI
↓
Bloc Event
↓
Bloc
↓
UseCase
↓
Repository Interface
↓
Repository Implementation
↓
Datasource
↓
API / Local Storage
```

Only when the feature passes verification may you continue.

---

# PHASE 6 — REGRESSION CHECK

After several features have been migrated, perform cross-feature checks.

Look for:

* shared state dependencies
* circular dependencies
* navigation breakage
* dependency injection issues
* authentication issues
* storage issues
* API regressions
* duplicated infrastructure
* inconsistent error handling
* inconsistent state patterns
* inconsistent naming

Do not allow each feature to evolve into a different architecture.

The final project must feel architecturally consistent.

---

# PHASE 7 — REMOVE EQUATABLE COMPLETELY

After all features are migrated:

Search the entire project for:

```text
Equatable
EquatableMixin
extends Equatable
with EquatableMixin
```

Remove it completely unless there is an exceptionally justified external dependency requiring it.

Then inspect:

```text
pubspec.yaml
pubspec.lock
```

Remove the direct `equatable` dependency if no longer required.

Also search for:

```text
Cubit
```

and identify any remaining Cubits.

Every remaining Cubit must either:

1. be migrated to Bloc, or
2. be explicitly documented as an intentional exception.

No silent leftovers.

---

# PHASE 8 — FREEZED GENERATION

Verify all Freezed-generated code.

Run the project's appropriate generation command, typically:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Then verify:

```bash
flutter analyze
flutter test
```

Ensure generated files are correct.

Do not manually edit generated `.freezed.dart` or `.g.dart` files.

---

# PHASE 9 — PERFORMANCE REVIEW

Architecture migration must NOT introduce unnecessary performance regressions.

Review:

* unnecessary Bloc rebuilds
* excessive BlocListeners
* unnecessary BlocProviders
* large widget rebuild trees
* duplicate API requests
* duplicate repository calls
* unnecessary object creation
* inefficient state copying
* unnecessary serialization
* unnecessary use cases
* unnecessary abstractions
* expensive operations inside Bloc handlers
* blocking synchronous operations
* unnecessary async work

Use:

```text
BlocSelector
buildWhen
listenWhen
const widgets
memoization where appropriate
```

only where justified.

Do not optimize prematurely.

---

# PHASE 10 — CLEANUP

After all features are migrated:

Remove:

* old ViewModels
* old Cubits
* obsolete States
* obsolete Models
* obsolete Services
* obsolete Repository implementations
* duplicate classes
* dead imports
* unused dependencies
* old architecture folders
* compatibility code that is no longer needed

Do NOT delete anything unless you have verified there are no references.

---

# PHASE 11 — FINAL ARCHITECTURE AUDIT

Perform a complete final audit.

Verify that the project follows:

```text
Feature First
+
Clean Architecture
+
BLoC
+
Events
+
Freezed
```

Final dependency flow:

```text
┌──────────────────────────┐
│       Presentation       │
│  Pages / Widgets / Bloc  │
└────────────┬─────────────┘
             ↓
┌──────────────────────────┐
│          Domain          │
│ Entities / UseCases /    │
│ Repository Contracts     │
└────────────┬─────────────┘
             ↓
┌──────────────────────────┐
│           Data           │
│ Models / Repositories /  │
│ Datasources              │
└────────────┬─────────────┘
             ↓
┌──────────────────────────┐
│ External Systems         │
│ API / DB / Storage       │
└──────────────────────────┘
```

Check every feature against this architecture.

---

# STRICT QUALITY RULES

## DO NOT

* rewrite working business logic unnecessarily
* change APIs unnecessarily
* change UI behavior unnecessarily
* introduce unnecessary packages
* introduce unnecessary abstractions
* create meaningless use cases
* create meaningless events
* move everything into Core
* put API calls inside Bloc
* put repositories inside widgets
* put business logic inside widgets
* let Domain import Data
* let Domain import Flutter
* keep Cubits just because migration is inconvenient
* keep Equatable without justification
* edit generated files manually
* migrate multiple features simultaneously
* continue after failed verification

---

# REQUIRED MIGRATION LOOP

For every feature, follow EXACTLY:

```text
1. Inspect feature
2. Document current architecture
3. Identify dependencies
4. Design target architecture
5. Create target folders
6. Separate entities/models
7. Separate repository contracts/implementations
8. Separate datasources
9. Create meaningful use cases
10. Convert Cubit → Bloc
11. Create Freezed Events
12. Create Freezed States
13. Update UI
14. Update dependency injection
15. Update routing if necessary
16. Generate Freezed code
17. Format
18. Analyze
19. Test
20. Verify architecture
21. Verify behavior
22. Fix all issues
23. Only then move to next feature
```

---

# REPORTING REQUIREMENTS

After Phase 0, provide:

```text
PROJECT ARCHITECTURE AUDIT
==========================

Current Architecture:
...

Detected Features:
1.
2.
3.

Cubit Inventory:
...

Repository Inventory:
...

Service Inventory:
...

Model Inventory:
...

Architecture Violations:
...

Dependencies:
...

Risk Assessment:
...

Recommended Migration Order:
1.
2.
3.

Target Architecture:
...

Estimated Complexity:
...
```

After every feature, provide:

```text
FEATURE MIGRATION REPORT
========================

Feature:
Status:

Before:
...

After:
...

Files Created:
...

Files Modified:
...

Files Removed:
...

Cubits Converted:
...

Events Created:
...

States Converted:
...

Use Cases:
...

Entities:
...

Models:
...

Repositories:
...

Datasources:
...

Architecture Validation:
PASS / FAIL

Flutter Analyze:
PASS / FAIL

Tests:
PASS / FAIL

Code Generation:
PASS / FAIL

Remaining Issues:
...
```

---

# IMPORTANT EXECUTION RULE

Do NOT stop after creating a plan.

Once the audit and migration strategy are complete, START IMPLEMENTING.

However:

**DO NOT migrate all features at once.**

Complete:

```text
Feature A
→ Verify
→ Fix
→ Finalize

THEN

Feature B
→ Verify
→ Fix
→ Finalize

THEN

Feature C
→ Verify
→ Fix
→ Finalize
```

Continue until every feature has been migrated.

If a feature is blocked by a dependency on another feature, document the dependency and migrate the prerequisite feature first.

---

# DEFINITION OF DONE

The migration is complete ONLY when:

* [ ] All features follow Clean Architecture
* [ ] Domain layer is framework-independent
* [ ] Repository contracts are in Domain
* [ ] Repository implementations are in Data
* [ ] Datasources are separated
* [ ] Models are separated from Entities
* [ ] Meaningful Use Cases exist where required
* [ ] All Cubits are migrated to Bloc
* [ ] Events are explicitly defined
* [ ] States use Freezed
* [ ] Equatable is removed
* [ ] Freezed generation succeeds
* [ ] No architecture dependency violations remain
* [ ] No unnecessary duplicate abstractions remain
* [ ] UI does not access Data directly
* [ ] Business logic is not inside widgets
* [ ] Dependency injection is correct
* [ ] Navigation still works
* [ ] API behavior is preserved
* [ ] Local storage behavior is preserved
* [ ] Error handling is consistent
* [ ] Performance has been reviewed
* [ ] `dart format` passes
* [ ] `flutter analyze` passes
* [ ] Tests pass
* [ ] No generated-code errors remain
* [ ] Final architecture audit passes

---

# FINAL PRINCIPLE

This migration is not about changing folder names.

It is about enforcing **real architectural boundaries**.

Do not consider the task complete simply because:

```text
Cubit → Bloc
Equatable → Freezed
models → data/models
```

The real goal is:

```text
Clean boundaries
+
Correct dependency direction
+
Explicit events
+
Predictable state management
+
Testable business logic
+
Maintainable features
+
Minimal coupling
+
No unnecessary abstractions
+
Production-grade Flutter architecture
```

Use the installed skills aggressively, especially:

```text
/flutter-app-architecture
/flutter-best-practices
/bloc
/find-skills
/testing 
```

When the skills provide a recommendation that conflicts with an existing project decision, first evaluate the project's actual constraints and choose the solution that provides the strongest long-term architecture without unnecessary rewrites.

**Start with the full audit. Do not modify code until the audit and migration order are established. Then execute the migration feature-by-feature, verifying each feature before proceeding to the next one.**
