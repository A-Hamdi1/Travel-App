// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDhNPpJGQwHt4jnL8RUetB4_Lxvwa2Sv-Y',
    appId: '1:218943093503:web:7a903ea5ffc690ea32aaca',
    messagingSenderId: '218943093503',
    projectId: 'thinking-mesh-405023',
    authDomain: 'thinking-mesh-405023.firebaseapp.com',
    storageBucket: 'thinking-mesh-405023.appspot.com',
    measurementId: 'G-DKDWJYRHGD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDM-96fBIAC9v5owfOmUkUl-CggX3AMRCM',
    appId: '1:218943093503:android:7ef803dc6a6686e232aaca',
    messagingSenderId: '218943093503',
    projectId: 'thinking-mesh-405023',
    storageBucket: 'thinking-mesh-405023.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcpiG63U9Cjf1E9iIcfMNZgGfFf6XebE0',
    appId: '1:218943093503:ios:7700322893268ee632aaca',
    messagingSenderId: '218943093503',
    projectId: 'thinking-mesh-405023',
    storageBucket: 'thinking-mesh-405023.appspot.com',
    iosBundleId: 'com.example.voyage',
  );
}