import 'package:flutter/material.dart';

class DoctorsPage extends StatelessWidget {
  final String specialty;

  const DoctorsPage({super.key, required this.specialty});

  @override
  Widget build(BuildContext context) {
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
      "Endocrinologie": [
        "Dr. Nizar Zouari",
        "Dr. Imen Hachicha",
        "Dr. Faten Ben Ali",
      ],
      "Médecine Générale": [
        "Dr. Nour Ben Ali",
        "Dr. Adel Jarray",
        "Dr. Sirine Toumi",
        "Dr. Khaled Gharbi",
      ],
      "Orthopédie": ["Dr. Mahdi Jemli", "Dr. Ons Mseddi", "Dr. Skander Chatti"],
      "Neurologie": [
        "Dr. Kamel Ghanmi",
        "Dr. Sarra Miled",
        "Dr. Alaeddine Trigui",
      ],
      "Urologie": [
        "Dr. Wael Hachicha",
        "Dr. Hichem Mabrouk",
        "Dr. Mourad Jarraya",
      ],
      "ORL": ["Dr. Rim Ben Ammar", "Dr. Moez Amara", "Dr. Nader Khemiri"],
    };

    final doctors = doctorsBySpecialty[specialty] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text("Docteurs en $specialty"),
        backgroundColor: Colors.teal,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: doctors.isEmpty
            ? const Center(
                child: Text(
                  "Aucun docteur disponible.",
                  style: TextStyle(fontSize: 18),
                ),
              )
            : GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 2.2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: doctors.map((doctorName) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Avatar SMALLER
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(
                              'assets/images/doctor_avatar.png',
                            ),
                          ),

                          const SizedBox(height: 15),

                          // Name
                          Text(
                            doctorName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Specialty
                          Text(
                            specialty,
                            style: const TextStyle(
                              color: Colors.teal,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
      ),
    );
  }
}
