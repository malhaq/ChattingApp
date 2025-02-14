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
    apiKey: 'AIzaSyDv1nN215Yv_a9g7atL1nzNBAXlAAx5ViE',
    appId: '1:25447086515:web:c2d3c3bd5d0203913fb3c6',
    messagingSenderId: '25447086515',
    projectId: 'flutter-chatting-applica-b58fe',
    authDomain: 'flutter-chatting-applica-b58fe.firebaseapp.com',
    storageBucket: 'flutter-chatting-applica-b58fe.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxthEt7DeQ8xOxfbwqEd9D-8br1RGIBNw',
    appId: '1:25447086515:android:3f983d7ba2e7dc1e3fb3c6',
    messagingSenderId: '25447086515',
    projectId: 'flutter-chatting-applica-b58fe',
    storageBucket: 'flutter-chatting-applica-b58fe.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB90UaDfaC9ncyShAqLFJJHTKcmL-NfTg0',
    appId: '1:25447086515:ios:d93c185e359c3d3d3fb3c6',
    messagingSenderId: '25447086515',
    projectId: 'flutter-chatting-applica-b58fe',
    storageBucket: 'flutter-chatting-applica-b58fe.firebasestorage.app',
    iosBundleId: 'com.example.chatingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB90UaDfaC9ncyShAqLFJJHTKcmL-NfTg0',
    appId: '1:25447086515:ios:d93c185e359c3d3d3fb3c6',
    messagingSenderId: '25447086515',
    projectId: 'flutter-chatting-applica-b58fe',
    storageBucket: 'flutter-chatting-applica-b58fe.firebasestorage.app',
    iosBundleId: 'com.example.chatingApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDv1nN215Yv_a9g7atL1nzNBAXlAAx5ViE',
    appId: '1:25447086515:web:ba10bd8edbd9653b3fb3c6',
    messagingSenderId: '25447086515',
    projectId: 'flutter-chatting-applica-b58fe',
    authDomain: 'flutter-chatting-applica-b58fe.firebaseapp.com',
    storageBucket: 'flutter-chatting-applica-b58fe.firebasestorage.app',
  );

}