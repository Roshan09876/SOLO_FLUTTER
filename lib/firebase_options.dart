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
    apiKey: 'AIzaSyBHtx8UetjT1aHYUZshrRc_PARMUBrpx20',
    appId: '1:936009062615:web:c663961a8609a46f867892',
    messagingSenderId: '936009062615',
    projectId: 'online-mobile-a1e30',
    authDomain: 'online-mobile-a1e30.firebaseapp.com',
    storageBucket: 'online-mobile-a1e30.appspot.com',
    measurementId: 'G-D3ZDDM7E74',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAvEJZwgQ6fcEN2vQfW5S6j61Wahr5FkCY',
    appId: '1:936009062615:android:333348d32de817f8867892',
    messagingSenderId: '936009062615',
    projectId: 'online-mobile-a1e30',
    storageBucket: 'online-mobile-a1e30.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzPRU_7z89bz7G_I3DN4J_3WjdGHkOThA',
    appId: '1:936009062615:ios:11857011ffc254c0867892',
    messagingSenderId: '936009062615',
    projectId: 'online-mobile-a1e30',
    storageBucket: 'online-mobile-a1e30.appspot.com',
    androidClientId: '936009062615-2c3o8oc09o24l8ld6vst41ui77jdt9f6.apps.googleusercontent.com',
    iosClientId: '936009062615-kuvphpnl28a4ijhthtvvm9cem446aq2t.apps.googleusercontent.com',
    iosBundleId: 'com.example.onlineMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDzPRU_7z89bz7G_I3DN4J_3WjdGHkOThA',
    appId: '1:936009062615:ios:11857011ffc254c0867892',
    messagingSenderId: '936009062615',
    projectId: 'online-mobile-a1e30',
    storageBucket: 'online-mobile-a1e30.appspot.com',
    androidClientId: '936009062615-2c3o8oc09o24l8ld6vst41ui77jdt9f6.apps.googleusercontent.com',
    iosClientId: '936009062615-kuvphpnl28a4ijhthtvvm9cem446aq2t.apps.googleusercontent.com',
    iosBundleId: 'com.example.onlineMobile',
  );
}
