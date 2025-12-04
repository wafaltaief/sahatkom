// lib/pages/appointment_page.dart
import 'package:flutter/material.dart';
import '../auth/login_page.dart';
import '../auth/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utils/doctor_images.dart';

class AppointmentPage extends StatefulWidget {
  final String doctorName;
  final String specialty;

  const AppointmentPage({
    super.key,
    required this.doctorName,
    required this.specialty,
  });

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  String? _selectedDate;
  String? _selectedTime;
  final _auth = FirebaseAuth.instance;

  // التواريخ المتاحة
  final List<String> _availableDates = [
    'Lundi 20 Janvier',
    'Mardi 21 Janvier',
    'Mercredi 22 Janvier',
    'Jeudi 23 Janvier',
    'Vendredi 24 Janvier',
    'Samedi 25 Janvier',
    'Dimanche 26 Janvier',
  ];

  // الأوقات المتاحة
  final List<String> _availableTimes = [
    '08:00', '09:00', '10:00', '11:00',
    '14:00', '15:00', '16:00', '17:00'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Rendez-vous avec ${widget.doctorName}',
          style: const TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.teal.shade700,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // معلومات الطبيب
            _buildDoctorInfo(),
            const SizedBox(height: 30),

            // اختيار التاريخ
            const Text(
              '1. Choisir une date',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            const SizedBox(height: 10),
            const Text(
              'Sélectionnez une date disponible',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 15),
            
            // قائمة التواريخ
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: _availableDates.length,
                itemBuilder: (context, index) {
                  final date = _availableDates[index];
                  final isSelected = _selectedDate == date;
                  
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    color: isSelected ? Colors.teal.withOpacity(0.1) : Colors.white,
                    child: ListTile(
                      leading: Icon(
                        Icons.calendar_today,
                        color: isSelected ? Colors.teal : Colors.grey,
                      ),
                      title: Text(date),
                      trailing: isSelected ? const Icon(Icons.check, color: Colors.teal) : null,
                      onTap: () {
                        setState(() {
                          _selectedDate = date;
                          _selectedTime = null;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),

            // اختيار الوقت
            if (_selectedDate != null) ...[
              const Text(
                '2. Choisir un horaire',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              const SizedBox(height: 10),
              const Text(
                'Sélectionnez un horaire disponible',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 15),
              
              // شبكة الأوقات
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _availableTimes.length,
                itemBuilder: (context, index) {
                  final time = _availableTimes[index];
                  final isSelected = _selectedTime == time;
                  
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTime = time;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.teal : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected ? Colors.teal : Colors.grey.shade300,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          time,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
            ],

            // زر الحجز
            if (_selectedDate != null && _selectedTime != null) ...[
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _bookAppointment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Confirmer le rendez-vous',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // دالة لبناء معلومات الطبيب
  Widget _buildDoctorInfo() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(DoctorImages.getImage(widget.doctorName)),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.doctorName,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.specialty,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.teal.shade700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.calendar_month, size: 16, color: Colors.grey.shade600),
                      const SizedBox(width: 5),
                      Text('Durée: 30 min', style: TextStyle(color: Colors.grey.shade600)),
                      const SizedBox(width: 15),
                      Icon(Icons.euro, size: 16, color: Colors.grey.shade600),
                      const SizedBox(width: 5),
                      Text('Prix: 50 DT', style: TextStyle(color: Colors.grey.shade600)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _bookAppointment() {
    final currentUser = _auth.currentUser;
    
    if (currentUser == null) {
      // عرض خيارات التسجيل
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'Connexion requise',
            style: TextStyle(color: Colors.teal),
          ),
          content: const Text(
            'Pour réserver un rendez-vous, vous devez avoir un compte.\n\n'
            'Voulez-vous vous connecter ou créer un nouveau compte?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              child: const Text(
                'Se connecter',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupPage()));
              },
              child: const Text('Créer un compte'),
            ),
          ],
        ),
      );
    } else {
      // تأكيد الحجز
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'Rendez-vous confirmé!',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.check_circle, size: 60, color: Colors.teal),
              const SizedBox(height: 20),
              Text('Médecin: ${widget.doctorName}'),
              Text('Spécialité: ${widget.specialty}'),
              Text('Date: $_selectedDate'),
              Text('Heure: $_selectedTime'),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Un email de confirmation vous a été envoyé.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Terminer'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              child: const Text(
                'Voir mes rendez-vous',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    }
  }
}