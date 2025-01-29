cd ..
flutter clean
flutter pub get
cd ios || exit
rm Podfile.lock
pod repo update
pod install
