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
    apiKey: 'AIzaSyBq12ktnhmSXhPi8AQj4W2Md4VPN8jMS6k',
    appId: '1:566759961726:web:672ea4968a2ba2245e942f',
    messagingSenderId: '566759961726',
    projectId: 'trivial-pursuit-flutter',
    authDomain: 'trivial-pursuit-flutter.firebaseapp.com',
    storageBucket: 'trivial-pursuit-flutter.appspot.com',
    measurementId: 'G-DLRW8026JE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_3o7jmvt0NMfiXLVEf97PVbQ01sIg7v8',
    appId: '1:566759961726:android:e5a259a555a5a8ce5e942f',
    messagingSenderId: '566759961726',
    projectId: 'trivial-pursuit-flutter',
    storageBucket: 'trivial-pursuit-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDl-aTCDhN8A_HNFWC2V4G4HmeXpX7ZFY0',
    appId: '1:566759961726:ios:538cb4011ebab73f5e942f',
    messagingSenderId: '566759961726',
    projectId: 'trivial-pursuit-flutter',
    storageBucket: 'trivial-pursuit-flutter.appspot.com',
    iosClientId: '566759961726-2k80ooat9uoqjl9tohqo97c21kt6n39l.apps.googleusercontent.com',
    iosBundleId: 'com.example.myApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDl-aTCDhN8A_HNFWC2V4G4HmeXpX7ZFY0',
    appId: '1:566759961726:ios:538cb4011ebab73f5e942f',
    messagingSenderId: '566759961726',
    projectId: 'trivial-pursuit-flutter',
    storageBucket: 'trivial-pursuit-flutter.appspot.com',
    iosClientId: '566759961726-2k80ooat9uoqjl9tohqo97c21kt6n39l.apps.googleusercontent.com',
    iosBundleId: 'com.example.myApp',
  );
}
