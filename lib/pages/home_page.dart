import 'package:flutter/material.dart';
import '../auth/login_page.dart';
import 'doctors_page.dart';
import 'specialties_page.dart';

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
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  // Liste complète (même contenu que dans DoctorsPage)
  final Map<String, List<String>> doctorsBySpecialty = {
    "Cardiologie": [
      "Dr. Ahmed Ben Salah",
      "Dr. Leila Trabelsi",
      "Dr. Rached Kefi",
      "Dr. Fethi Ben Miled",
    ],
    "Dermatologie": [
      "Dr. Sami Chouchène",
      "Dr. Rania Ben Youssef",
      "Dr. Maha Oueslati",
      "Dr. Aymen Ben Fraj",
    ],
    "Pédiatrie": [
      "Dr. Mohamed Jlassi",
      "Dr. Farah Gharbi",
      "Dr. Manel Chikhaoui",
      "Dr. Sana Zribi",
    ],
    "Ophtalmologie": [
      "Dr. Sofien Khemiri",
      "Dr. Amina Hajri",
      "Dr. Zied Fkiri",
      "Dr. Rim Jebali",
    ],
    "Psychiatrie": [
      "Dr. Walid Zoghlami",
      "Dr. Mouna Fathallah",
      "Dr. Yassin Ben Hassine",
      "Dr. Houssem Zouari",
    ],
    "Gynécologie": [
      "Dr. Henda Mabrouk",
      "Dr. Yosra Ferchichi",
      "Dr. Sana Ayari",
      "Dr. Nebiha Saidi",
    ],
  };

  void searchDoctor() {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) return;

    // on cherche le docteur dans toutes les spécialités
    for (var entry in doctorsBySpecialty.entries) {
      for (var doctor in entry.value) {
        if (doctor.toLowerCase().contains(query)) {
          // on envoie la specialty ET la query à DoctorsPage
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  DoctorsPage(specialty: entry.key, searchQuery: query),
            ),
          );
          return;
        }
      }
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Aucun médecin trouvé.")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sahatkom',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal.shade700,
        actions: [
          // Search bar
          Container(
            width: 200,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: TextField(
              controller: _searchController,
              onSubmitted: (_) => searchDoctor(),
              decoration: InputDecoration(
                hintText: 'Rechercher un médecin...',
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: searchDoctor,
                ),
                filled: true,
                fillColor: Colors.teal.shade800,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 15,
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),

      body: const _HomeBody(),
    );
  }
}

// ------------------------------------------------------
// BODY CONTENT (unchanged)
// ------------------------------------------------------
class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // HERO SECTION
          Container(
            width: double.infinity,
            height: 400,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/hero_image.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
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
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: const [
                    ServiceCard(
                      icon: Icons.calendar_today,
                      title: 'Prise de Rendez-vous',
                      description: 'Réservez facilement avec nos spécialistes.',
                    ),
                    ServiceCard(
                      icon: Icons.local_hospital,
                      title: 'Consultations en Ligne',
                      description:
                          'Consultez depuis chez vous en toute sécurité.',
                    ),
                    ServiceCard(
                      icon: Icons.medical_services,
                      title: 'Dossiers Médicaux',
                      description:
                          'Gérez vos documents médicaux numériquement.',
                    ),
                  ],
                ),
              ],
            ),
          ),

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
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    // كل كارت تخصص قابل للنقر
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DoctorsPage(specialty: "Cardiologie"),
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
                            builder: (context) =>
                                DoctorsPage(specialty: "Ophtalmologie"),
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
                            builder: (context) =>
                                DoctorsPage(specialty: "Pédiatrie"),
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
                            builder: (context) =>
                                DoctorsPage(specialty: "Dermatologie"),
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
                            builder: (context) =>
                                DoctorsPage(specialty: "Psychiatrie"),
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
                            builder: (context) =>
                                DoctorsPage(specialty: "Gynécologie"),
                          ),
                        );
                      },
                      child: const SpecialtyCard(
                        icon: Icons.woman,
                        name: "Gynécologie",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

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
            ),
          ),
        ],
      ),
    );
  }
}
