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
    apiKey: 'AIzaSyC3KnZfEw82T_mcKxYPUoIJBPoxZVboxAU',
    appId: '1:210338164285:web:263213d510b38b1ac68454',
    messagingSenderId: '210338164285',
    projectId: 'learningdart-flutter-pro-67d9d',
    authDomain: 'learningdart-flutter-pro-67d9d.firebaseapp.com',
    storageBucket: 'learningdart-flutter-pro-67d9d.appspot.com',
    measurementId: 'G-CRXTM0MBQY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDyMvMJehZgmmEpjxOSrQRTenkVEi3yn4',
    appId: '1:210338164285:android:eab76b8ddb716076c68454',
    messagingSenderId: '210338164285',
    projectId: 'learningdart-flutter-pro-67d9d',
    storageBucket: 'learningdart-flutter-pro-67d9d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD7Y16TAN4-QqhjPtE5KdjlJFxLAHBQAUo',
    appId: '1:210338164285:ios:d457485992714e30c68454',
    messagingSenderId: '210338164285',
    projectId: 'learningdart-flutter-pro-67d9d',
    storageBucket: 'learningdart-flutter-pro-67d9d.appspot.com',
    iosClientId: '210338164285-tc3httu587foequ2r05qfbbd87vf1sca.apps.googleusercontent.com',
    iosBundleId: 'com.example.learningdart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD7Y16TAN4-QqhjPtE5KdjlJFxLAHBQAUo',
    appId: '1:210338164285:ios:d457485992714e30c68454',
    messagingSenderId: '210338164285',
    projectId: 'learningdart-flutter-pro-67d9d',
    storageBucket: 'learningdart-flutter-pro-67d9d.appspot.com',
    iosClientId: '210338164285-tc3httu587foequ2r05qfbbd87vf1sca.apps.googleusercontent.com',
    iosBundleId: 'com.example.learningdart',
  );
}