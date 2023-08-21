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
    apiKey: 'AIzaSyD-NDykNSOO2PbTQeHS4sh1Y0Ty8nBaSFI',
    appId: '1:662500750655:web:41a8044960896cde4e0f8a',
    messagingSenderId: '662500750655',
    projectId: 'team999',
    authDomain: 'team999.firebaseapp.com',
    storageBucket: 'team999.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZDLjLY0FlDPnOhTide0o98FEtYFoLnW4',
    appId: '1:662500750655:android:165f58fc12d803624e0f8a',
    messagingSenderId: '662500750655',
    projectId: 'team999',
    storageBucket: 'team999.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCU7R-NN9hiWPwqEE919CK830o6XO8Ahh8',
    appId: '1:662500750655:ios:1f7f2537f502b5c44e0f8a',
    messagingSenderId: '662500750655',
    projectId: 'team999',
    storageBucket: 'team999.appspot.com',
    iosClientId: '662500750655-on3vq74dc10qqoc1r73q7o5949m2jcuu.apps.googleusercontent.com',
    iosBundleId: 'com.example.team9',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCU7R-NN9hiWPwqEE919CK830o6XO8Ahh8',
    appId: '1:662500750655:ios:a81068195c9c98ca4e0f8a',
    messagingSenderId: '662500750655',
    projectId: 'team999',
    storageBucket: 'team999.appspot.com',
    iosClientId: '662500750655-vorfb8e8vmjcvqphkpst0ubck2g4esu5.apps.googleusercontent.com',
    iosBundleId: 'com.example.team9.RunnerTests',
  );
}
