#!/bin/bash

# Change directory to lib
cd ../lib || exit

# Run flutter build with delete-conflicting-outputs
flutter clean && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

# Find and format files excluding specific patterns
find . -name "*.dart" \
    ! -path "./bin/cache/*" \
    ! -name "*.chopper.dart" \
    ! -path "*/gen/**" \
    ! -name "*.g.dart" \
    ! -name "*l10n.dart" \
    ! -name "*.mocks.dart" \
    ! -name "*.freezed.dart" \
    -exec dart format --line-length 100 --indent 0 {} +

# Apply fixes
dart fix --apply

# Find and format files excluding specific patterns
find . -name "*.dart" \
    ! -path "./bin/cache/*" \
    ! -name "*.chopper.dart" \
    ! -path "*/gen/**" \
    ! -name "*.g.dart" \
    ! -name "*l10n.dart" \
    ! -name "*.mocks.dart" \
    ! -name "*.freezed.dart" \
    -exec dart format --line-length 100 --indent 0 {} +

echo "Formatting completed!"

# Change directory to test
cd ../test || exit

# Find and format files excluding specific patterns
find . -name "*.dart" \
    ! -path "./bin/cache/*" \
    ! -name "*.chopper.dart" \
    ! -path "*/gen/**" \
    ! -name "*.g.dart" \
    ! -name "*l10n.dart" \
    ! -name "*.mocks.dart" \
    ! -name "*.freezed.dart" \
    -exec dart format --line-length 100 --indent 0 {} +

# Apply fixes
dart fix --apply

# Find and format files excluding specific patterns
find . -name "*.dart" \
    ! -path "./bin/cache/*" \
    ! -name "*.chopper.dart" \
    ! -path "*/gen/**" \
    ! -name "*.g.dart" \
    ! -name "*l10n.dart" \
    ! -name "*.mocks.dart" \
    ! -name "*.freezed.dart" \
    -exec dart format --line-length 100 --indent 0 {} +

echo "Formatting completed!"
