# Finlot

Finlot is a Flutter mobile app prototype for creating and managing shared savings pools. The current app demonstrates the splash screen, onboarding flow, and a sample home dashboard.

## Features

- Branded splash screen with a gradient background.
- Three onboarding slides introducing pool creation, tracking, and ease of use.
- Home dashboard mockup with upcoming draw information, pool cards, contribution statistics, and bottom navigation.
- Uses local image assets and the Outfit font through Google Fonts.

> The current home screen is a UI prototype. Pool data and actions are not connected to a backend.

## Requirements

- Flutter SDK with Dart 3.9.2 or later.

## Getting started

Fetch dependencies and run the app from the project root:

```sh
flutter pub get
flutter run
```

To run the test suite:

```sh
flutter test
```

## Project structure

```text
lib/
  main.dart       App entry point, splash screen, and onboarding flow
  home.dart       Home dashboard UI
assets/images/    Splash, onboarding, and dashboard artwork
test/             Flutter widget tests
```

Image assets are declared in `pubspec.yaml` under `assets/images/`.
