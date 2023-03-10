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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXFgNkfoKyru6jivSZVW6LhJ8sBj9O0Zk',
    appId: '1:210949688729:android:37fe04a03cd31052efd708',
    messagingSenderId: '210949688729',
    projectId: 'anaaj-e5948',
    databaseURL: 'https://anaaj-e5948-default-rtdb.firebaseio.com',
    storageBucket: 'anaaj-e5948.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDSJUg5hKpn6WNVFc0H-4Nvf-gMfrTTMCw',
    appId: '1:210949688729:ios:0af67b0986ef6f78efd708',
    messagingSenderId: '210949688729',
    projectId: 'anaaj-e5948',
    databaseURL: 'https://anaaj-e5948-default-rtdb.firebaseio.com',
    storageBucket: 'anaaj-e5948.appspot.com',
    androidClientId: '210949688729-g0d8v8eqh4pci49ud1j89httv5e398jm.apps.googleusercontent.com',
    iosClientId: '210949688729-t2n88m484ebrjnk2lp1b2eq1r5ffd8ca.apps.googleusercontent.com',
    iosBundleId: 'com.example.anaaj',
  );
}
