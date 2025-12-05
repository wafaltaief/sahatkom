import 'package:flutter/material.dart';

class CheckAccountPage extends StatelessWidget {
  const CheckAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool userHasAccount = false; // taw bch tbedelha b Firebase bel futur

    return Scaffold(
      appBar: AppBar(title: const Text("Vérification")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (userHasAccount) {
              Navigator.pushNamed(context, "/confirm_appointment");
            } else {
              Navigator.pushNamed(context, "/signup");
            }
          },
          child: const Text("Continuer"),
          // Ajoutez cette route dans votre MaterialApp
MaterialApp(
  // ...
  routes: {
    '/check_account': (context) => CheckAccountPage(), // Créez cette page
  },
)
        ),
      ),
    );
  }
}
