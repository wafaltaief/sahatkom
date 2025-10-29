import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_page.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
  apiKey: "AIzaSyDD1Bt9FkrmlLu3xVdHQlKDQNbzTZCVTVQ",
  authDomain: "tbibna-323f9.firebaseapp.com",
  projectId: "tbibna-323f9",
  storageBucket: "tbibna-323f9.firebasestorage.app",
  messagingSenderId: "134534919080",
  appId: "1:134534919080:web:c1e47d7828eca4d9eca39d",
  measurementId: "G-E4RRDX7VW3"

    ),
  );
  runApp(const SahatkomApp());
}

class SahatkomApp extends StatelessWidget {
  const SahatkomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sahatkom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(), 
    );
  }
}
