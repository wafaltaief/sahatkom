import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return const FirebaseOptions(
        apiKey: "AIzaSyDD1Bt9FkrmlLu3xVdHQlKDQNbzTZCVTVQ",
        authDomain: "tbibna-323f9.firebaseapp.com",
        projectId: "tbibna-323f9",
        storageBucket: "tbibna-323f9.firebasestorage.app",
        messagingSenderId: "134534919080",
        appId: "1:134534919080:web:c1e47d7828eca4d9eca39d",
        measurementId: "G-E4RRDX7VW3",
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return const FirebaseOptions(
          apiKey: "AIzaSyDD1Bt9FkrmlLu3xVdHQlKDQNbzTZCVTVQ",
          appId: "1:134534919080:android:<your-android-app-id>",
          messagingSenderId: "134534919080",
          projectId: "tbibna-323f9",
          storageBucket: "tbibna-323f9.firebasestorage.app",
        );
      case TargetPlatform.iOS:
        return const FirebaseOptions(
          apiKey: "AIzaSyDD1Bt9FkrmlLu3xVdHQlKDQNbzTZCVTVQ",
          appId: "1:134534919080:ios:<your-ios-app-id>",
          messagingSenderId: "134534919080",
          projectId: "tbibna-323f9",
          storageBucket: "tbibna-323f9.firebasestorage.app",
          iosBundleId: "<your-ios-bundle-id>",
        );
      default:
        throw UnsupportedError('Platform not supported');
    }
  }
}
