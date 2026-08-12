# Implementation Plan: Flutter Clean Architecture Refactor

Refactor the existing "DivinePets" Flutter project to follow the Clean Architecture pattern. This will organize the code into `core` and `features` layers, providing better scalability, testability, and maintainability.

## User Review Required

> [!IMPORTANT]
> This refactor will significantly change the project structure. I will be adding several industry-standard libraries to support this architecture.

- **State Management**: I will use **BLoC (flutter_bloc)** as the standard state management for this architecture.
- **Dependency Injection**: I will use **GetIt** for service location.
- **Functional Error Handling**: I will use **dartz** (specifically the `Either` type) for error handling in the domain layer.

## Proposed Changes

### Dependencies (pubspec.yaml)

I will add the following dependencies:
- `flutter_bloc`: State management.
- `get_it`: Dependency injection.
- `dartz`: Functional programming for error handling.
- `equatable`: Simplified equality checks.
- `fluttertoast`: Toaster notifications as requested.
- `logger`: Global logging utility.

---

### Core Layer (lib/core)

This layer contains code shared across all features.

#### [NEW] [failure.dart](file:///D:/StudioProjects/divinepets/lib/core/error/failure.dart)
Base class for handling errors in the domain layer.

#### [NEW] [exception.dart](file:///D:/StudioProjects/divinepets/lib/core/error/exception.dart)
Base class for handling exceptions in the data layer.

#### [NEW] [error_handler.dart](file:///D:/StudioProjects/divinepets/lib/core/error/error_handler.dart)
Utility to map failures to user-friendly messages.

#### [NEW] [constants.dart](file:///D:/StudioProjects/divinepets/lib/core/constants/constants.dart)
Global constants (App names, API keys, etc.).

#### [NEW] [toaster_utils.dart](file:///D:/StudioProjects/divinepets/lib/core/utils/toaster_utils.dart)
Global wrapper for toaster notifications.

#### [NEW] [usecase.dart](file:///D:/StudioProjects/divinepets/lib/core/usecases/usecase.dart)
Base interface for all use cases.

---

### Feature Layer (lib/features/counter)

I will migrate the default counter logic into a structured feature.

#### [NEW] [Domain Layer](file:///D:/StudioProjects/divinepets/lib/features/counter/domain)
- `entities/`: Pure business objects.
- `repositories/`: Abstract repository definitions.
- `usecases/`: Application-specific business rules.

#### [NEW] [Data Layer](file:///D:/StudioProjects/divinepets/lib/features/counter/data)
- `models/`: Data Transfer Objects (DTOs) with JSON serialization.
- `repositories/`: Concrete implementations of domain repositories.
- `data_sources/`: Remote and local data source interfaces/impls.

#### [NEW] [Presentation Layer](file:///D:/StudioProjects/divinepets/lib/features/counter/presentation)
- `bloc/`: State management logic.
- `pages/`: Full-screen widgets.
- `widgets/`: Reusable UI components.

---

### Orchestration

#### [NEW] [injection_container.dart](file:///D:/StudioProjects/divinepets/lib/injection_container.dart)
Manual dependency injection setup using GetIt.

#### [MODIFY] [main.dart](file:///D:/StudioProjects/divinepets/lib/main.dart)
Update entry point to initialize DI and set up the BlocProvider.

## Verification Plan

### Automated Tests
- I will verify the build by running `flutter pub get`.
- (Optional) I can add a simple unit test for the counter use case.

### Manual Verification
- The app should run and function exactly like the current counter app, but with the new architecture under the hood.
- Test the "Toaster" by showing a toast when the counter is incremented.
