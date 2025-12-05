<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/home_page.dart'; // your HomePage
import 'auth/login_page.dart';
import 'auth/signup_page.dart';
=======
// lib/main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/home_page.dart';
import 'auth/login_page.dart';
import 'auth/signup_page.dart';
import 'pages/doctors_page.dart';
import 'pages/specialties_page.dart';
import 'pages/appointment_page.dart';
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
<<<<<<< HEAD
  runApp(const SahatkomApp());
}

class SahatkomApp extends StatelessWidget {
  const SahatkomApp({super.key});
=======
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sahatkom',
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
      },
    );
  }
}
=======
      
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      
      home: const HomePage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/specialties': (context) => const SpecialtiesPage(),
      },
      
      onGenerateRoute: (settings) {
        if (settings.name == '/doctors') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => DoctorsPage(specialty: args['specialty']),
          );
        }
        if (settings.name == '/appointment') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => AppointmentPage(
              doctorName: args['doctorName'],
              specialty: args['specialty'],
            ),
          );
        }
        return null;
      },
    );
  }
}
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a
