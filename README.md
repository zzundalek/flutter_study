# flutter_study

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Setup

1. Install [rps](#pubspec-scripts)
1. To run code generator run: `rps gen`

## Pubspec scripts

> In order to run pubspec scripts first install [Run Pubspec Script](https://pub.dev/packages/rps) by running `dart pub global activate rps`

- Run flutter analyzer
  
  ```shell
  rps lint
  ```

- Run build_runner in watch mode (auto generate scripts for freezed, riverpod etc.)
  
  ```shell
  rps gen
  ```

## Riverpod

To debug Riverpod [Riverpod observer](./lib/utils/riverpod_observer.dart) is used.
See debug console for more info:

![Riverpod observer debug console](./readme_assets/riverpod_observer.png)
