#!/bin/bash
set -e

echo "🔧 Preparing iOS environment..."

# Find Flutter project root (go up until pubspec.yaml found)
PROJECT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || echo "../../")
cd "$PROJECT_ROOT"

if [ ! -f "pubspec.yaml" ]; then
  echo "❌ pubspec.yaml not found! Please check your Flutter project root path."
  exit 1
fi

# Clean and get dependencies
flutter clean
flutter pub get
flutter precache --ios
flutter build ios --no-codesign

cd ios

# CocoaPods setup
pod repo update
pod install

echo "✅ iOS environment setup complete!"
