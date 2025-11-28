import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login_page.dart';
import 'firebase_options.dart';
import 'specialties_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
<<<<<<< HEAD
        primarySwatch: Colors.teal,
=======
        primarySwatch: Colors.blue, // default MaterialColor
>>>>>>> aad127cc411c082caac8623e9fbc0755fba02770
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

// ------------------------------------------------------
// SERVICE CARD
// ------------------------------------------------------
class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: 250,
          child: Column(
            children: [
              Icon(icon, size: 60, color: Colors.teal),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style:
                    const TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------
// SPECIALTY CARD (CLIC ACTIVE)
// ------------------------------------------------------
class SpecialtyCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final VoidCallback? onTap;

  const SpecialtyCard({
    super.key,
    required this.icon,
    required this.name,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: 180,
            child: Column(
              children: [
                Icon(icon, size: 50, color: Colors.teal),
                const SizedBox(height: 15),
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------
// HOME PAGE
// ------------------------------------------------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sahatkom'),
        actions: [
          Container(
            width: 200,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Recherche...',
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.teal.shade700,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 10),

          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            },
            child: const Text('Login', style: TextStyle(color: Colors.black)),
          ),

          const SizedBox(width: 20),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // HERO
            Container(
              width: double.infinity,
              height: 500,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/hero_image.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black54,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Bienvenue à Sahatkom',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Prenez rendez-vous avec vos docteurs facilement',
                        style: TextStyle(color: Colors.white70, fontSize: 24),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Réserver un rendez-vous'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // SERVICES
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  const Text(
                    'Nos Services',
                    style: TextStyle(
                        fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: const [
                      ServiceCard(
                        icon: Icons.calendar_today,
                        title: 'Prise de Rendez-vous',
                        description: 'Réservez des rendez-vous.',
                      ),
                      ServiceCard(
                        icon: Icons.local_hospital,
                        title: 'Consultations en Ligne',
                        description: 'Consultez des médecins.',
                      ),
                      ServiceCard(
                        icon: Icons.medical_services,
                        title: 'Dossiers Médicaux',
                        description: 'Accédez à vos dossiers.',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // SPECIALTIES
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  const Text(
                    'Spécialités Médicales',
                    style: TextStyle(
                        fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
 
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SpecialtiesPage()),
                      );
                    },
                    child: const Text("Voir toutes les spécialités"),
                  ),

                  const SizedBox(height: 30),

                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      SpecialtyCard(
                        icon: Icons.favorite,
                        name: "Cardiologie",
                        onTap: () {},
                      ),
                      SpecialtyCard(
                        icon: Icons.visibility,
                        name: "Ophtalmologie",
                        onTap: () {},
                      ),
                      SpecialtyCard(
                        icon: Icons.child_care,
                        name: "Pédiatrie",
                        onTap: () {},
                      ),
                      SpecialtyCard(
                        icon: Icons.spa,
                        name: "Dermatologie",
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // FOOTER
            Container(
              color: Colors.teal,
              padding: const EdgeInsets.all(20),
              child: const Center(
                child: Text(
                  '© 2025 Sahatkom. Tous droits réservés.',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
