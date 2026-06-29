# 🛠️ Project & Developer Skills

This document lists all the skills available in this project's environment and workspace. These skills define best practices, templates, and automation guidelines for the development team.

---

## 📁 1. Project-Specific Skills (`.agents/skills/`)

These skills are checked into the repository and tailor the development workflow to this project's architecture.

### 🔹 [create-feature](file:///.agents/skills/create-feature/SKILL.md)
* **Description**: Create a new Flutter feature following the 3-Layer Clean Architecture structure.
* **Usage**: Use this skill when adding new modules (e.g., `lib/feature/<name>`) to ensure consistent data, domain, and presentation layering.

### 🔹 [create-bloc](file:///.agents/skills/create-bloc/SKILL.md)
* **Description**: Create a new Bloc or Cubit for state management following the project's SafeBloc pattern.
* **Usage**: Use this skill when creating state managers that extend `SafeBloc` or `SafeCubit` with emission safety and auto-cancellation.

### 🔹 [create-widget-with-bloc](file:///.agents/skills/create-widget-with-bloc/SKILL.md)
* **Description**: Create or modify a UI widget that consumes a Bloc or Cubit, using `BlocSelector` to optimize performance and prevent unnecessary rebuilds.
* **Usage**: Use this to ensure widgets are highly performant and only rebuild when their specific slice of state changes.

### 🔹 [create-api-call](file:///.agents/skills/create-api-call/SKILL.md)
* **Description**: Implement a new API or network request in DataSources, Repositories, UseCases, and Blocs.
* **Usage**: Outlines the exact steps for adding endpoints using `DioClient` and wrapping them in the clean architecture flow.

### 🔹 [track-network](file:///.agents/skills/track-network/SKILL.md)
* **Description**: Implement and test real-time network tracking and auto-retry in Blocs/Cubits.
* **Usage**: Guide for subscribing to internet connection status and automatically retrying failed requests.

### 🔹 [test-bloc](file:///.agents/skills/test-bloc/SKILL.md)
* **Description**: Write unit tests for Blocs and Cubits using `bloc_test` and `mocktail`.
* **Usage**: Templates and examples for writing unit tests for your state managers.

### 🔹 [test-network](file:///.agents/skills/test-network/SKILL.md)
* **Description**: Write unit tests for Remote DataSources that use `DioService` and the core network pattern.
* **Usage**: Guidelines for mocking network requests and verifying error/success responses.

### 🔹 [test-repo](file:///.agents/skills/test-repo/SKILL.md)
* **Description**: Write unit tests for Repository implementations, mocking data sources and verifying `Either` results.
* **Usage**: Ensures repositories are fully covered by verifying they catch exceptions and map them to `Failure` types.

### 🔹 [test-widget](file:///.agents/skills/test-widget/SKILL.md)
* **Description**: Write widget and UI tests in Flutter, handling `ScreenUtil`, localization, and mocked Blocs.
* **Usage**: Guidelines for rendering and testing UI components.

---

## 🌐 2. Global & Tooling Skills

These skills are provided by the global environment and IDE plugins to optimize compilation, performance, and code quality.

### 🔹 [android-kotlin-settings](file:///C:/Users/longl/.gemini/config/skills/android-kotlin-settings/SKILL.md)
* **Description**: Provides standard, modern Android and Kotlin configuration settings, Gradle options, and compiler flags for project setups.
* **Applied to**: `android/gradle.properties` and `android/app/proguard-rules.pro`.

### 🔹 [android-cli](file:///C:/Users/longl/.gemini/config/plugins/android-cli-plugin/skills/SKILL.md)
* **Description**: Orchestrates Android development tasks including project creation, deployment, SDK management, and environment diagnostics using the `android` command-line tool.

### 🔹 [antigravity-guide](file:///C:/Users/longl/.gemini/antigravity-cli/builtin/skills/antigravity_guide/SKILL.md)
* **Description**: Comprehensive guide, quick reference, and sitemap for Google Antigravity (AGY) tools and slash commands.

### 🔹 [ponytail](file:///C:/Users/longl/.gemini/config/plugins/ponytail/skills/ponytail/SKILL.md)
* **Description**: Switch ponytail intensity level (`lite`/`full`/`ultra`/`off`) to enforce lazy senior developer principles (YAGNI, minimal boilerplate).

### 🔹 [ponytail-audit](file:///C:/Users/longl/.gemini/config/plugins/ponytail/skills/ponytail-audit/SKILL.md)
* **Description**: Audit the whole repo for over-engineering and identify code or dependencies that can be deleted.

### 🔹 [ponytail-gain](file:///C:/Users/longl/.gemini/config/plugins/ponytail/skills/ponytail-gain/SKILL.md)
* **Description**: Show ponytail's measured impact scoreboard (less code, cost, time).

### 🔹 [ponytail-review](file:///C:/Users/longl/.gemini/config/plugins/ponytail/skills/ponytail-review/SKILL.md)
* **Description**: Review changes for over-engineering and code simplicity.

### 🔹 [ponytail-help](file:///C:/Users/longl/.gemini/config/plugins/ponytail/skills/ponytail-help/SKILL.md)
* **Description**: Quick reference for ponytail levels, skills, and commands.
