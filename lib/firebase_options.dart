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
        return macos;
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
    apiKey: 'AIzaSyCbnnKWlHUtQWHqDl0hY8boaKQc3Rw-o50',
    appId: '1:360430963641:web:486531787d10b22b7a4468',
    messagingSenderId: '360430963641',
    projectId: 'flutter-trivia-b0463',
    authDomain: 'flutter-trivia-b0463.firebaseapp.com',
    storageBucket: 'flutter-trivia-b0463.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcgMZt7-t3Z3WRdAnXhWvSdplWncUQ110',
    appId: '1:360430963641:android:85a001b4b0ac0d5b7a4468',
    messagingSenderId: '360430963641',
    projectId: 'flutter-trivia-b0463',
    storageBucket: 'flutter-trivia-b0463.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1yRkCZqdyY-gloAP8R0ih6F2etwvrjM0',
    appId: '1:360430963641:ios:f57d6be4262b0bc67a4468',
    messagingSenderId: '360430963641',
    projectId: 'flutter-trivia-b0463',
    storageBucket: 'flutter-trivia-b0463.appspot.com',
    iosClientId:
        '360430963641-qr99jiddph0sljmdg6qsmesppt1e4k9p.apps.googleusercontent.com',
    iosBundleId: 'com.example.myApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC1yRkCZqdyY-gloAP8R0ih6F2etwvrjM0',
    appId: '1:360430963641:ios:f57d6be4262b0bc67a4468',
    messagingSenderId: '360430963641',
    projectId: 'flutter-trivia-b0463',
    storageBucket: 'flutter-trivia-b0463.appspot.com',
    iosClientId:
        '360430963641-qr99jiddph0sljmdg6qsmesppt1e4k9p.apps.googleusercontent.com',
    iosBundleId: 'com.example.myApp',
  );
}