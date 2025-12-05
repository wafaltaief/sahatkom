import 'package:flutter/material.dart';
// import 'screens/rendezvous_validation.dart';

class DoctorPage extends StatefulWidget {
  final String name;
  final String lastname;
  final String speciality;
  final String location;
  final String image;

  const DoctorPage({
    Key? key,
    required this.name,
    required this.lastname,
    required this.speciality,
    required this.location,
    required this.image,
  }) : super(key: key);

  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  List<DateTime> _availableDates = [];
  List<TimeOfDay> _availableTimes = [];

  @override
  void initState() {
    super.initState();
    _generateAvailableDates();
  }

  void _generateAvailableDates() {
    final now = DateTime.now();
    _availableDates = [];
    
    // Générer les 7 prochains jours (exclure weekends)
    for (int i = 1; i <= 14; i++) {
      final date = now.add(Duration(days: i));
      if (date.weekday != DateTime.saturday && date.weekday != DateTime.sunday) {
        _availableDates.add(date);
      }
    }
  }

  void _generateAvailableTimes(DateTime date) {
    _availableTimes = [];
    
    // Générer les créneaux horaires selon le jour
    if (date.weekday == DateTime.monday || 
        date.weekday == DateTime.wednesday || 
        date.weekday == DateTime.friday) {
      // Lundi, Mercredi, Vendredi: 8h-12h, 14h-18h
      _availableTimes.addAll([
        TimeOfDay(hour: 8, minute: 0),
        TimeOfDay(hour: 9, minute: 0),
        TimeOfDay(hour: 10, minute: 0),
        TimeOfDay(hour: 11, minute: 0),
        TimeOfDay(hour: 14, minute: 0),
        TimeOfDay(hour: 15, minute: 0),
        TimeOfDay(hour: 16, minute: 0),
        TimeOfDay(hour: 17, minute: 0),
      ]);
    } else {
      // Mardi, Jeudi: 9h-13h, 15h-19h
      _availableTimes.addAll([
        TimeOfDay(hour: 9, minute: 0),
        TimeOfDay(hour: 10, minute: 0),
        TimeOfDay(hour: 11, minute: 0),
        TimeOfDay(hour: 12, minute: 0),
        TimeOfDay(hour: 15, minute: 0),
        TimeOfDay(hour: 16, minute: 0),
        TimeOfDay(hour: 17, minute: 0),
        TimeOfDay(hour: 18, minute: 0),
      ]);
    }
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
      _selectedTime = null;
      _generateAvailableTimes(date);
    });
  }

  void _onTimeSelected(TimeOfDay time) {
    setState(() {
      _selectedTime = time;
    });
  }

  void _validerRendezVous() {
    if (_selectedDate == null || _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez sélectionner une date et une heure')),
      );
      return;
    }

    // Vérifier si l'utilisateur a un compte valide
    // Pour la démo, on suppose qu'il n'a pas de compte
    bool hasValidAccount = false; // Changez à true pour tester la validation directe

    if (hasValidAccount) {
      // Si compte valide, confirmer le rendez-vous
      _showConfirmationDialog();
    } else {
      // Si pas de compte, rediriger vers la création de compte
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => RendezVousValidationScreen(),
      //   ),
      // );
    }
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Rendez-vous Confirmé'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Votre rendez-vous a été confirmé avec:'),
            SizedBox(height: 10),
            Text('Dr. ${widget.name} ${widget.lastname}'),
            Text('Le ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'),
            Text('À ${_selectedTime!.hour}h${_selectedTime!.minute == 0 ? '' : '${_selectedTime!.minute}'}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Fermer le dialog
              Navigator.pop(context); // Retour à l'accueil
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final days = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];
    final months = ['Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Jun', 'Jul', 'Aoû', 'Sep', 'Oct', 'Nov', 'Déc'];
    
    return '${days[date.weekday - 1]} ${date.day} ${months[date.month - 1]}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dr. ${widget.name} ${widget.lastname}'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------------------- INFO DOCTEUR AVEC IMAGE ----------------------
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Image du docteur
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.teal, width: 2),
                        image: widget.image.isNotEmpty 
                          ? widget.image.startsWith('http')
                            ? DecorationImage(
                                image: NetworkImage(widget.image),
                                fit: BoxFit.cover,
                              )
                            : DecorationImage(
                                image: AssetImage(widget.image),
                                fit: BoxFit.cover,
                              )
                          : null,
                      ),
                      child: widget.image.isEmpty 
                          ? Icon(Icons.person, size: 40, color: Colors.teal)
                          : null,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. ${widget.name} ${widget.lastname}',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            widget.speciality,
                            style: TextStyle(fontSize: 16, color: Colors.teal),
                          ),
                          SizedBox(height: 4),
                          Text(
                            widget.location,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Icon(Icons.star_half, color: Colors.amber, size: 16),
                              SizedBox(width: 8),
                              Text('4.5', style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24),

            // ---------------------- DATES DISPONIBLES ----------------------
            Text(
              'Dates disponibles:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _availableDates.length,
                itemBuilder: (context, index) {
                  final date = _availableDates[index];
                  final isSelected = _selectedDate == date;
                  
                  return GestureDetector(
                    onTap: () => _onDateSelected(date),
                    child: Container(
                      width: 80,
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.teal : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? Colors.teal : Colors.grey.shade300,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _formatDate(date),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${date.day}/${date.month}',
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 24),

            // ---------------------- HEURES DISPONIBLES ----------------------
            if (_selectedDate != null) ...[
              Text(
                'Heures disponibles:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.5,
                ),
                itemCount: _availableTimes.length,
                itemBuilder: (context, index) {
                  final time = _availableTimes[index];
                  final isSelected = _selectedTime == time;
                  
                  return GestureDetector(
                    onTap: () => _onTimeSelected(time),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.teal : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected ? Colors.teal : Colors.grey.shade300,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${time.hour}h${time.minute == 0 ? '' : time.minute}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 24),

              // ---------------------- RÉSUMÉ ET VALIDATION ----------------------
              if (_selectedDate != null && _selectedTime != null) ...[
                Card(
                  color: Colors.teal.shade50,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Résumé de votre rendez-vous:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text('Date: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'),
                        Text('Heure: ${_selectedTime!.hour}h${_selectedTime!.minute == 0 ? '' : '${_selectedTime!.minute}'}'),
                        Text('Docteur: Dr. ${widget.name} ${widget.lastname}'),
                        Text('Spécialité: ${widget.speciality}'),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 16),

                ElevatedButton(
                  onPressed: _validerRendezVous,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    'Valider le Rendez-vous',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ],

            SizedBox(height: 16),

            // ---------------------- MESSAGE D'INFORMATION ----------------------
            if (_selectedDate == null)
              Card(
                color: Colors.blue.shade50,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.info, color: Colors.blue),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Veuillez sélectionner une date pour voir les heures disponibles',
                          style: TextStyle(color: Colors.blue.shade800),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}