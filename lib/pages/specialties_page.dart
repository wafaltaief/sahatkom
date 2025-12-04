import 'package:flutter/material.dart';
import 'doctors_page.dart';

class SpecialtiesPage extends StatelessWidget {
  const SpecialtiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة جميع التخصصات
    List<Map<String, dynamic>> specialties = [
      {"icon": Icons.favorite, "name": "Cardiologie", "color": Colors.red},
      {"icon": Icons.visibility, "name": "Ophtalmologie", "color": Colors.blue},
      {"icon": Icons.child_care, "name": "Pédiatrie", "color": Colors.pink},
      {"icon": Icons.spa, "name": "Dermatologie", "color": Colors.green},
      {"icon": Icons.psychology, "name": "Psychiatrie", "color": Colors.purple},
      {"icon": Icons.woman, "name": "Gynécologie", "color": Colors.orange},
      {"icon": Icons.monitor_heart, "name": "Endocrinologie", "color": Colors.teal},
      {"icon": Icons.local_hospital, "name": "Médecine Générale", "color": Colors.blueGrey},
      {"icon": Icons.accessible, "name": "Orthopédie", "color": Colors.brown},
      {"icon": Icons.memory, "name": "Neurologie", "color": Colors.indigo},
      {"icon": Icons.man, "name": "Urologie", "color": Colors.cyan},
      {"icon": Icons.hearing, "name": "ORL", "color": Colors.amber},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Toutes les Spécialités",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal.shade700,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE0F2F1), Color(0xFFB2DFDB)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.9,
            ),
            itemCount: specialties.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorsPage(specialty: specialties[index]["name"]),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white,
                          specialties[index]["color"]!.withOpacity(0.1),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: specialties[index]["color"]!.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            specialties[index]["icon"],
                            size: 40,
                            color: specialties[index]["color"],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            specialties[index]["name"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Voir médecins",
                          style: TextStyle(
                            fontSize: 12,
                            color: specialties[index]["color"],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}