import 'package:flutter/material.dart';
import 'appointment_page.dart';
import '../utils/doctor_images.dart';

class DoctorsPage extends StatelessWidget {
  final String specialty;
  final String? searchQuery; // nouveau paramètre optionnel

  const DoctorsPage({super.key, required this.specialty, this.searchQuery});

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

    // Si searchQuery est fourni -> filtrer la liste pour n'afficher que les correspondances
    final List<String> filteredDoctors;
    if (searchQuery != null && searchQuery!.isNotEmpty) {
      final q = searchQuery!.toLowerCase();
      filteredDoctors = doctors
          .where((d) => d.toLowerCase().contains(q))
          .toList();
    } else {
      filteredDoctors = doctors;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          searchQuery == null || searchQuery!.isEmpty
              ? "Docteurs en $specialty"
              : "Résultats pour \"${searchQuery!}\"",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.teal.shade700,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {
              _showFilterOptions(context);
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE0F2F1), Color(0xFFB2DFDB), Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: filteredDoctors.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.medical_services,
                        size: 80,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Aucun docteur trouvé pour cette recherche.",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Retour',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: filteredDoctors.length,
                  itemBuilder: (context, index) {
                    final doctorName = filteredDoctors[index];

                    return Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        onTap: () {
                          _showDoctorDetails(context, doctorName, specialty);
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.white, Color(0xFFE0F2F1)],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Avatar
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.teal,
                                    width: 3,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.teal.withOpacity(0.3),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage(
                                    DoctorImages.getImage(doctorName),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              // Doctor Name
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Text(
                                  doctorName,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              const SizedBox(height: 10),

                              // Specialty Badge
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.teal.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.teal.withOpacity(0.3),
                                  ),
                                ),
                                child: Text(
                                  specialty,
                                  style: const TextStyle(
                                    color: Colors.teal,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 15),

                              // Book Button
                              Container(
                                width: 120,
                                height: 35,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.teal.shade600,
                                      Colors.teal.shade800,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    _bookAppointment(
                                      context,
                                      doctorName,
                                      specialty,
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Text(
                                    'Réserver',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
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

  // Doctor details bottom sheet (unchanged)
  void _showDoctorDetails(
    BuildContext context,
    String doctorName,
    String specialty,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 60,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        DoctorImages.getImage(doctorName),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctorName,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            specialty,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.teal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber.shade700,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                '4.8/5',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 15),
                              Icon(
                                Icons.access_time,
                                color: Colors.grey.shade600,
                                size: 18,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                '10 ans exp.',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  'À propos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  'Dr. $doctorName est un spécialiste reconnu en $specialty avec plus de 10 ans d\'expérience. Diplômé de la faculté de médecine de Tunis, il/elle est connu(e) pour son professionnalisme et son écoute attentive des patients.',
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Disponibilités',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: [
                    Chip(
                      label: const Text('Lun-Ven: 8h-17h'),
                      backgroundColor: Colors.teal.shade50,
                    ),
                    Chip(
                      label: const Text('Sam: 8h-13h'),
                      backgroundColor: Colors.teal.shade50,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _bookAppointment(context, doctorName, specialty);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Prendre Rendez-vous',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Book appointment (unchanged)
  void _bookAppointment(
    BuildContext context,
    String doctorName,
    String specialty,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AppointmentPage(doctorName: doctorName, specialty: specialty),
      ),
    );
  }

  // Filter options (unchanged)
  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filtrer les médecins',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.star, color: Colors.amber),
                title: const Text('Meilleures notes'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Filtre appliqué: Meilleures notes'),
                      backgroundColor: Colors.teal,
                    ),
                  );
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.access_time, color: Colors.blue),
                title: const Text('Disponible aujourd\'hui'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Filtre appliqué: Disponible aujourd\'hui'),
                      backgroundColor: Colors.teal,
                    ),
                  );
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.euro, color: Colors.green),
                title: const Text('Prix croissant'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Filtre appliqué: Prix croissant'),
                      backgroundColor: Colors.teal,
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text('Réinitialiser les filtres'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
