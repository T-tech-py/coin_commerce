# Tezda_task

Tezda interview task

A social platform mobile app.

## Demo

[![Demo Video](https://drive.google.com/file/d/188mWVKj5Lyvx-WqHnj9DUliu0P2O2Rlq/view?usp=drivesdk)](https://drive.google.com/file/d/1qRWJa7v0LgwKLyprQk6BiqrMHqKc5PRs/view?usp=sharing)

## Login

Login credentials: 
username: mor_2314
password: 83r5^_

## Download apk here

- [Apk](https://drive.google.com/file/d/1qd8R4U_02jHxF1OGYhx7WSrRlzAYYF3G/view?usp=sharing)



## Folder Structure

This project follows the clean architecture design pattern for structuring the folders and packages.
The purpose of clean architecture is to provide a clear separation of concerns and to make the
codebase scalable, testable, and maintainable.

This application uses a feature driven folder structure to separate related functionality into individual features
- (lib/features)
- │
- ├── feature0
- |     ├── data
- │     │     ├── data_sources
- │     │     ├── models
- │     │     └── repositories(implementation)
- │     ├── domain
- │     │     ├── entities
- │     │     ├── repositories(abstract)
- │     │     └── use_cases
- │     └── presentation
- │     │     ├── blocs
- │     │     ├── pages
- │     │     └── widgets
- │     │

## Structure

The project is structured into different layers, each with its own responsibility:

### 1. Presentation Layer

This layer handles the user interface components, including widgets, screens, and UI-related logic. It consists of:

- `page`: Contains the main screens of the application.
- `widgets`: Contains reusable widgets used across screens.
- `blocs`: Implements the BLoC pattern for state management.

### 2. Domain Layer

The domain layer defines the business logic and the application's use cases.
It is independent of any external frameworks or implementations. It consists of:

- `entities`: Contains the domain models/entities.
- `usecases`: Implements the application's use cases.
- `repositories`: Abstract interfaces for data operations.

### 3. Data Layer

The data layer handles data access and persistence. It also communicates with
external services, such as APIs or databases. It consists of:

- `models`: Includes data models used in the data layer.
- `repositories`: Implements the interfaces defined in the domain layer.
- `datasources`: Handles data access and external service communication.

### 4. Core Layer

The core layer includes infrastructure code that is shared across different layers. It consists of:

- `constants`: Contains application-level constants.
- `errors`: Implements custom error handling.
- `utils`: Includes utility functions and helpers.
- `di`: Implements dependency injection for module setup.

## Guidelines

Following guidelines should be considered while using this clean architecture folder structure:

- Each layer should only depend on the layer directly beneath it.
- The domain layer should not have any dependencies on external frameworks or libraries.
- Each layer must have its own set of tests to ensure independence and maintainability.
- Use dependency injection to wire up dependencies between layers.

