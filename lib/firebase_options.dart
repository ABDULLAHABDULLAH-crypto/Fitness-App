// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyD6YNENhAFKQHBZBKISC4gXYB7Yhu9PA8Q',
    appId: '1:1053151853616:web:e1a3dca19e504421f041f5',
    messagingSenderId: '1053151853616',
    projectId: 'fitness-app-fe7f3',
    authDomain: 'fitness-app-fe7f3.firebaseapp.com',
    storageBucket: 'fitness-app-fe7f3.firebasestorage.app',
    measurementId: 'G-Q50SVCGMY9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEnJuXNATfit4jdrCF9_RbTR67tiJc3KU',
    appId: '1:1053151853616:android:4e0ba63cee73d36af041f5',
    messagingSenderId: '1053151853616',
    projectId: 'fitness-app-fe7f3',
    storageBucket: 'fitness-app-fe7f3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDERSiZcDHUFN3hfg5BwyOUA-Fo8lOdxe0',
    appId: '1:1053151853616:ios:322581a2abcedd9ef041f5',
    messagingSenderId: '1053151853616',
    projectId: 'fitness-app-fe7f3',
    storageBucket: 'fitness-app-fe7f3.firebasestorage.app',
    iosBundleId: 'com.example.fitnessApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDERSiZcDHUFN3hfg5BwyOUA-Fo8lOdxe0',
    appId: '1:1053151853616:ios:322581a2abcedd9ef041f5',
    messagingSenderId: '1053151853616',
    projectId: 'fitness-app-fe7f3',
    storageBucket: 'fitness-app-fe7f3.firebasestorage.app',
    iosBundleId: 'com.example.fitnessApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD6YNENhAFKQHBZBKISC4gXYB7Yhu9PA8Q',
    appId: '1:1053151853616:web:53d44813ad05c371f041f5',
    messagingSenderId: '1053151853616',
    projectId: 'fitness-app-fe7f3',
    authDomain: 'fitness-app-fe7f3.firebaseapp.com',
    storageBucket: 'fitness-app-fe7f3.firebasestorage.app',
    measurementId: 'G-QPBXNW8RCV',
  );

}