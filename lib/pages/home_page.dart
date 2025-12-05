import 'package:flutter/material.dart';
import '../auth/login_page.dart';
<<<<<<< HEAD
=======
import 'doctors_page.dart';
import 'specialties_page.dart';
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a

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

// ------------------------------------------------------
// SPECIALTY CARD
// ------------------------------------------------------
class SpecialtyCard extends StatelessWidget {
  final IconData icon;
  final String name;

<<<<<<< HEAD
  const SpecialtyCard({super.key, required this.icon, required this.name});
=======
  const SpecialtyCard({
    super.key,
    required this.icon,
    required this.name,
  });
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a

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
<<<<<<< HEAD
            Icon(icon, size: 50, color: Colors.teal),
            const SizedBox(height: 15),
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
=======
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: Colors.teal),
            ),
            const SizedBox(height: 15),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a
              textAlign: TextAlign.center,
            ),
          ],
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
<<<<<<< HEAD
        title: const Text('Sahatkom'),
=======
        title: const Text('Sahatkom', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal.shade700,
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a
        actions: [
          // Search bar
          Container(
            width: 200,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: TextField(
              decoration: InputDecoration(
<<<<<<< HEAD
                hintText: 'Recherche...',
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.teal.shade700,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 10,
=======
                hintText: 'Rechercher un médecin...',
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.teal.shade800,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 15,
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a
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
<<<<<<< HEAD
          TextButton(
=======
          IconButton(
            icon: const Icon(Icons.medical_services, color: Colors.white),
            tooltip: 'Toutes les spécialités',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SpecialtiesPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            tooltip: 'Se connecter',
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            },
<<<<<<< HEAD
            child: const Text('Login', style: TextStyle(color: Colors.black)),
          ),
          const SizedBox(width: 20),
=======
          ),
          const SizedBox(width: 10),
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a
        ],
      ),

      body: const _HomeBody(),
    );
  }
}

// ------------------------------------------------------
// BODY CONTENT
// ------------------------------------------------------
class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
<<<<<<< HEAD
          // ----------------------------------------------------
          // HERO SECTION
          // ----------------------------------------------------
          Container(
            width: double.infinity,
            height: 500,
=======
          // HERO SECTION
          Container(
            width: double.infinity,
            height: 400,
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/hero_image.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
<<<<<<< HEAD
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

          // ----------------------------------------------------
          // SERVICES SECTION
          // ----------------------------------------------------
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: const [
                Text(
                  'Nos Services',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
=======
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.3),
                  ],
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Bienvenue à Sahatkom',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Votre santé, notre priorité',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // SERVICES SECTION
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                const Text(
                  'Nos Services',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Services médicaux de qualité à votre portée',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 30),
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
<<<<<<< HEAD
                  children: [
=======
                  children: const [
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a
                    ServiceCard(
                      icon: Icons.calendar_today,
                      title: 'Prise de Rendez-vous',
                      description:
<<<<<<< HEAD
                          'Réservez des rendez-vous avec des spécialistes en quelques clics.',
=======
                          'Réservez facilement avec nos spécialistes.',
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a
                    ),
                    ServiceCard(
                      icon: Icons.local_hospital,
                      title: 'Consultations en Ligne',
                      description:
<<<<<<< HEAD
                          'Consultez des médecins depuis le confort de votre maison.',
=======
                          'Consultez depuis chez vous en toute sécurité.',
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a
                    ),
                    ServiceCard(
                      icon: Icons.medical_services,
                      title: 'Dossiers Médicaux',
                      description:
<<<<<<< HEAD
                          'Accédez et gérez vos dossiers médicaux en toute sécurité.',
=======
                          'Gérez vos documents médicaux numériquement.',
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a
                    ),
                  ],
                ),
              ],
            ),
          ),

<<<<<<< HEAD
          // ----------------------------------------------------
          // SPECIALTIES SECTION
          // ----------------------------------------------------
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: const [
                Text(
                  'Spécialités Médicales',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
=======
          // SPECIALTIES SECTION
          Container(
            color: Colors.grey.shade50,
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                const Text(
                  'Spécialités Médicales',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Trouvez le spécialiste dont vous avez besoin',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 30),
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
<<<<<<< HEAD
                    SpecialtyCard(icon: Icons.favorite, name: "Cardiologie"),
                    SpecialtyCard(
                      icon: Icons.visibility,
                      name: "Ophtalmologie",
                    ),
                    SpecialtyCard(icon: Icons.child_care, name: "Pédiatrie"),
                    SpecialtyCard(icon: Icons.spa, name: "Dermatologie"),
                    SpecialtyCard(icon: Icons.psychology, name: "Psychiatrie"),
                    SpecialtyCard(icon: Icons.woman, name: "Gynécologie"),
=======
                    // كل كارت تخصص قابل للنقر
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorsPage(specialty: "Cardiologie"),
                          ),
                        );
                      },
                      child: const SpecialtyCard(
                        icon: Icons.favorite,
                        name: "Cardiologie",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorsPage(specialty: "Ophtalmologie"),
                          ),
                        );
                      },
                      child: const SpecialtyCard(
                        icon: Icons.visibility,
                        name: "Ophtalmologie",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorsPage(specialty: "Pédiatrie"),
                          ),
                        );
                      },
                      child: const SpecialtyCard(
                        icon: Icons.child_care,
                        name: "Pédiatrie",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorsPage(specialty: "Dermatologie"),
                          ),
                        );
                      },
                      child: const SpecialtyCard(
                        icon: Icons.spa,
                        name: "Dermatologie",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorsPage(specialty: "Psychiatrie"),
                          ),
                        );
                      },
                      child: const SpecialtyCard(
                        icon: Icons.psychology,
                        name: "Psychiatrie",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorsPage(specialty: "Gynécologie"),
                          ),
                        );
                      },
                      child: const SpecialtyCard(
                        icon: Icons.woman,
                        name: "Gynécologie",
                      ),
                    ),
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a
                  ],
                ),
              ],
            ),
          ),

<<<<<<< HEAD
          // ----------------------------------------------------
          // FOOTER
          // ----------------------------------------------------
          Container(
            color: Colors.teal,
            padding: const EdgeInsets.all(20),
            child: const Center(
              child: Text(
                '© 2025 Sahatkom. Tous droits réservés.',
                style: TextStyle(color: Colors.white),
              ),
=======
          // FOOTER
          Container(
            color: Colors.teal.shade800,
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone, color: Colors.white, size: 20),
                    const SizedBox(width: 10),
                    const Text(
                      '+216 70 000 000',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 30),
                    Icon(Icons.email, color: Colors.white, size: 20),
                    const SizedBox(width: 10),
                    const Text(
                      'contact@sahatkom.tn',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  '© 2025 Sahatkom. Tous droits réservés.',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a
            ),
          ),
        ],
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 34958d6a263ce2f6eded32dd2ad865b7bfab3b8a
