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
    apiKey: 'AIzaSyABewLt8RrcF2GsG1HdekJ7mFJgtzvB1-M',
    appId: '1:305163291166:web:1ac653751f71c86dcebc0f',
    messagingSenderId: '305163291166',
    projectId: 'hotels-connect-e8464',
    authDomain: 'hotels-connect-e8464.firebaseapp.com',
    storageBucket: 'hotels-connect-e8464.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVZvvtriqZ94vzwr6M9syYXVDPLJBysCQ',
    appId: '1:305163291166:android:586e690d12b2b8eecebc0f',
    messagingSenderId: '305163291166',
    projectId: 'hotels-connect-e8464',
    storageBucket: 'hotels-connect-e8464.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCkCGQICrh02dcnkQUHgl_RgqFRKT3CQ3I',
    appId: '1:305163291166:ios:e023ad438e10cf71cebc0f',
    messagingSenderId: '305163291166',
    projectId: 'hotels-connect-e8464',
    storageBucket: 'hotels-connect-e8464.appspot.com',
    iosClientId: '305163291166-v6velmch4ip1pmefclng8eejj0ia9tl4.apps.googleusercontent.com',
    iosBundleId: 'com.example.hotelsConnect',
  );
}