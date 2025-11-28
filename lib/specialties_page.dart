import 'package:flutter/material.dart';
import 'doctors_page.dart';

class SpecialtiesPage extends StatelessWidget {
  const SpecialtiesPage({super.key});

  final List<Map<String, dynamic>> specialties = const [
    {"name": "Cardiologie", "icon": Icons.favorite},
    {"name": "Dermatologie", "icon": Icons.spa},
    {"name": "Pédiatrie", "icon": Icons.child_care},
    {"name": "Ophtalmologie", "icon": Icons.visibility},
    {"name": "Psychiatrie", "icon": Icons.psychology},
    {"name": "Gynécologie", "icon": Icons.woman},
    {"name": "Endocrinologie", "icon": Icons.medication},
    {"name": "Médecine Générale", "icon": Icons.local_hospital},

    // specials
    {"name": "Orthopédie", "icon": Icons.accessibility},
    {"name": "Neurologie", "icon": Icons.memory},
    {"name": "Urologie", "icon": Icons.personal_injury},
    {"name": "ORL", "icon": Icons.hearing},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spécialités"),
        backgroundColor: Colors.teal,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,

          // ⬇️ تصغير حجم الكروت
          childAspectRatio: 1.4,

          children: specialties.map((item) {
            return SpecialtyCard(
              icon: item["icon"],
              name: item["name"],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        DoctorsPage(specialty: item["name"] as String),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class SpecialtyCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final VoidCallback onTap;

  const SpecialtyCard({
    super.key,
    required this.icon,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        color: const Color(0xFFF7F2FA),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.teal),
            const SizedBox(height: 10),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
