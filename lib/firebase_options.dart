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
    apiKey: 'AIzaSyC5sTTM3cx9pwRgs-SN9snlMct3wUlit5A',
    appId: '1:52015186380:web:c2f4fea19e5264f9bbdd69',
    messagingSenderId: '52015186380',
    projectId: 'task-app-be047',
    authDomain: 'task-app-be047.firebaseapp.com',
    storageBucket: 'task-app-be047.firebasestorage.app',
    measurementId: 'G-J5Y8J1XF8V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpt5DHTDsWTotb6eHcffG-cTS1mTj2sio',
    appId: '1:52015186380:android:08c8b36bbbc6076abbdd69',
    messagingSenderId: '52015186380',
    projectId: 'task-app-be047',
    storageBucket: 'task-app-be047.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAd2Zf_LuQOrOYdfdHa_YFF2JqDlDL6eKw',
    appId: '1:52015186380:ios:2d05f2589f9bc6dcbbdd69',
    messagingSenderId: '52015186380',
    projectId: 'task-app-be047',
    storageBucket: 'task-app-be047.firebasestorage.app',
    iosBundleId: 'com.example.cw6',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAd2Zf_LuQOrOYdfdHa_YFF2JqDlDL6eKw',
    appId: '1:52015186380:ios:2d05f2589f9bc6dcbbdd69',
    messagingSenderId: '52015186380',
    projectId: 'task-app-be047',
    storageBucket: 'task-app-be047.firebasestorage.app',
    iosBundleId: 'com.example.cw6',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC5sTTM3cx9pwRgs-SN9snlMct3wUlit5A',
    appId: '1:52015186380:web:5096f3303f7d655abbdd69',
    messagingSenderId: '52015186380',
    projectId: 'task-app-be047',
    authDomain: 'task-app-be047.firebaseapp.com',
    storageBucket: 'task-app-be047.firebasestorage.app',
    measurementId: 'G-XBWVBG37ZB',
  );
}
