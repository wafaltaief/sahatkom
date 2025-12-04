// lib/utils/doctor_images.dart
class DoctorImages {
  static const Map<String, String> images = {
    // Cardiologie
    "Dr. Ahmed Ben Salah": "assets/images/doctors/doctor1.png",
    "Dr. Leila Trabelsi": "assets/images/doctors/doctor2.png",
    "Dr. Rached Kefi": "assets/images/doctors/doctor3.png",
    "Dr. Fethi Ben Miled": "assets/images/doctors/doctor4.png",
    
    // Dermatologie
    "Dr. Sami Chouchène": "assets/images/doctors/doctor5.png",
    "Dr. Rania Ben Youssef": "assets/images/doctors/doctor6.png",
    "Dr. Maha Oueslati": "assets/images/doctors/doctor7.png",
    "Dr. Aymen Ben Fraj": "assets/images/doctors/doctor8.png",
    
    // Pédiatrie
    "Dr. Mohamed Jlassi": "assets/images/doctors/doctor9.png",
    "Dr. Farah Gharbi": "assets/images/doctors/doctor10.png",
    "Dr. Manel Chikhaoui": "assets/images/doctors/doctor11.png",
    "Dr. Sana Zribi": "assets/images/doctors/doctor12.png",
    
    // Ophtalmologie
    "Dr. Sofien Khemiri": "assets/images/doctors/doctor13.png",
    "Dr. Amina Hajri": "assets/images/doctors/doctor14.png",
    "Dr. Zied Fkiri": "assets/images/doctors/doctor15.png",
    "Dr. Rim Jebali": "assets/images/doctors/doctor16.png",
    
    // Psychiatrie
    "Dr. Walid Zoghlami": "assets/images/doctors/doctor17.png",
    "Dr. Mouna Fathallah": "assets/images/doctors/doctor18.png",
    "Dr. Yassin Ben Hassine": "assets/images/doctors/doctor19.png",
    "Dr. Houssem Zouari": "assets/images/doctors/doctor20.png",
    
    // Gynécologie
    "Dr. Henda Mabrouk": "assets/images/doctors/doctor21.png",
    "Dr. Yosra Ferchichi": "assets/images/doctors/doctor22.png",
    "Dr. Sana Ayari": "assets/images/doctors/doctor23.png",
    "Dr. Nebiha Saidi": "assets/images/doctors/doctor24.png",
    
    // Endocrinologie
    "Dr. Nizar Zouari": "assets/images/doctors/doctor25.png",
    "Dr. Imen Hachicha": "assets/images/doctors/doctor26.png",
    "Dr. Faten Ben Ali": "assets/images/doctors/doctor27.png",
    
    // Médecine Générale
    "Dr. Nour Ben Ali": "assets/images/doctors/doctor28.png",
    "Dr. Adel Jarray": "assets/images/doctors/doctor29.png",
    "Dr. Sirine Toumi": "assets/images/doctors/doctor30.png",
    "Dr. Khaled Gharbi": "assets/images/doctors/doctor31.png",
    
    // Orthopédie
    "Dr. Mahdi Jemli": "assets/images/doctors/doctor32.png",
    "Dr. Ons Mseddi": "assets/images/doctors/doctor33.png",
    "Dr. Skander Chatti": "assets/images/doctors/doctor34.png",
    
    // Neurologie
    "Dr. Kamel Ghanmi": "assets/images/doctors/doctor35.png",
    "Dr. Sarra Miled": "assets/images/doctors/doctor36.png",
    "Dr. Alaeddine Trigui": "assets/images/doctors/doctor37.png",
    
    // Urologie
    "Dr. Wael Hachicha": "assets/images/doctors/doctor38.png",
    "Dr. Hichem Mabrouk": "assets/images/doctors/doctor39.png",
    "Dr. Mourad Jarraya": "assets/images/doctors/doctor40.png",
    
    // ORL
    "Dr. Rim Ben Ammar": "assets/images/doctors/doctor41.png",
    "Dr. Moez Amara": "assets/images/doctors/doctor42.png",
    "Dr. Nader Khemiri": "assets/images/doctors/doctor43.png",
  };

  static String getImage(String doctorName) {
    // إذا لم يكن الطبيب في القائمة، نستخدم صورة افتراضية
    return images[doctorName] ?? "assets/images/doctor_avatar.png";
  }
}  // هذه القوسة الناقصة