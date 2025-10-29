import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:sahatkom/login_page.dart';

void main() {
  runApp(const SahatkomApp());
}

class SahatkomApp extends StatelessWidget {
  const SahatkomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sahatkom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Roboto'),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sahatkom'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Accueil', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Docteurs',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Rendez-vous',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Contact', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Section Hero
            Container(
              width: double.infinity,
              height: 500,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://i.ibb.co/3CkD3n9/medical-banner.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(0.5),
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
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                        ),
                        child: const Text('Réserver un rendez-vous'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Section Services
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  const Text(
                    'Nos Services',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      ServiceCard(
                        icon: Icons.medical_services,
                        title: 'Consultations',
                        description:
                            'Consultez des spécialistes en quelques clics.',
                      ),
                      ServiceCard(
                        icon: Icons.schedule,
                        title: 'Rendez-vous rapides',
                        description: 'Planifiez votre rendez-vous facilement.',
                      ),
                      ServiceCard(
                        icon: Icons.local_hospital,
                        title: 'Hôpitaux partenaires',
                        description:
                            'Accès aux meilleurs établissements de santé.',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Section Footer
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
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(icon, size: 60, color: Colors.teal),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
