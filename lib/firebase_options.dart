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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD1992-hmCUM1lMsXLm0cfxKAqYmFxk1uE',
    appId: '1:594657829814:web:c753c0e1bf2758660b9717',
    messagingSenderId: '594657829814',
    projectId: 'fir-auth-bug-reproduction',
    authDomain: 'fir-auth-bug-reproduction.firebaseapp.com',
    storageBucket: 'fir-auth-bug-reproduction.appspot.com',
    measurementId: 'G-D64TBM98VN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXRtG3gySxCx2ggNTf15-YvjK_SlhJ5xc',
    appId: '1:594657829814:android:baa597dc471e35b40b9717',
    messagingSenderId: '594657829814',
    projectId: 'fir-auth-bug-reproduction',
    storageBucket: 'fir-auth-bug-reproduction.appspot.com',
  );
}
