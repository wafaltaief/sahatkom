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
      ],
      "Dermatologie": [
        "Dr. Sami Chouchène",
        "Dr. Rania Ben Youssef",
        "Dr. Maha Oueslati",
      ],
      "Pédiatrie": [
        "Dr. Mohamed Jlassi",
        "Dr. Farah Gharbi",
        "Dr. Manel Chikhaoui",
      ],
      "Ophtalmologie": [
        "Dr. Sofien Khemiri",
        "Dr. Amina Hajri",
        "Dr. Zied Fkiri",
      ],
      "Psychiatrie": [
        "Dr. Walid Zoghlami",
        "Dr. Mouna Fathallah",
        "Dr. Yassin Ben Hassine",
      ],
      "Gynécologie": [
        "Dr. Henda Mabrouk",
        "Dr. Yosra Ferchichi",
        "Dr. Sana Ayari",
      ],
      "Endocrinologie": [
        "Dr. Nizar Zouari",
        "Dr. Imen Hachicha",
      ],
      "Médecine Générale": [
        "Dr. Nour Ben Ali",
        "Dr. Adel Jarray",
        "Dr. Sirine Toumi",
        "Dr. Khaled Gharbi",
      ],
      "Orthopédie": [
        "Dr. Mahdi Jemli",
        "Dr. Ons Mseddi",
      ],
      "Neurologie": [
        "Dr. Kamel Ghanmi",
        "Dr. Sarra Miled",
      ],
      "Urologie": [
        "Dr. Wael Hachicha",
        "Dr. Hichem Mabrouk",
      ],
      "ORL": [
        "Dr. Rim Ben Ammar",
        "Dr. Moez Amara",
      ],
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
                childAspectRatio: 0.85,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: doctors.map((doctorName) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(
                              'assets/images/doctor_avatar.png',
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            doctorName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            specialty,
                            style: const TextStyle(
                              color: Colors.teal,
                              fontSize: 15,
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
