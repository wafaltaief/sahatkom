import 'package:flutter/material.dart';

// ---------------------- SERVICE CARD ----------------------
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

// ---------------------- SPECIALTY CARD ----------------------
class SpecialtyCard extends StatelessWidget {
  final IconData icon;
  final String name;

  const SpecialtyCard({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(icon, size: 50, color: Colors.teal),
            const SizedBox(height: 15),
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------- HOME PAGE ----------------------
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
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text('Login', style: TextStyle(color: Colors.black)),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: const _HomeBody(),
    );
  }
}

// ---------------------- BODY ----------------------
class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bienvenue à Sahatkom',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Prenez rendez-vous avec vos docteurs facilement',
                      style: TextStyle(color: Colors.white70, fontSize: 24),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: null,
                      child: Text('Réserver un rendez-vous'),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 50),

          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: const [
                Text(
                  'Nos Services',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    ServiceCard(
                      icon: Icons.calendar_today,
                      title: 'Prise de Rendez-vous',
                      description:
                          'Réservez des rendez-vous avec des spécialistes en quelques clics.',
                    ),
                    ServiceCard(
                      icon: Icons.local_hospital,
                      title: 'Consultations en Ligne',
                      description:
                          'Consultez des médecins depuis le confort de votre maison.',
                    ),
                    ServiceCard(
                      icon: Icons.medical_services,
                      title: 'Dossiers Médicaux',
                      description:
                          'Accédez et gérez vos dossiers médicaux en toute sécurité.',
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: const [
                Text(
                  'Spécialités Médicales',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    SpecialtyCard(icon: Icons.favorite, name: "Cardiologie"),
                    SpecialtyCard(
                      icon: Icons.visibility,
                      name: "Ophtalmologie",
                    ),
                    SpecialtyCard(icon: Icons.child_care, name: "Pédiatrie"),
                    SpecialtyCard(icon: Icons.spa, name: "Dermatologie"),
                    SpecialtyCard(icon: Icons.psychology, name: "Psychiatrie"),
                    SpecialtyCard(icon: Icons.woman, name: "Gynécologie"),
                  ],
                ),
              ],
            ),
          ),

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
    );
  }
}
