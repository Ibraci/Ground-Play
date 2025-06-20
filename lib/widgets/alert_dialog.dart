import 'package:flutter/material.dart';

// class AlertDialogExample extends StatelessWidget {
//   const AlertDialogExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Exemple de Dialogue d’Alerte',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const AlertDialogExample(),
//     );
//   }
// }

class AlertDialogExample extends StatelessWidget {
  const AlertDialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemple de Dialogue d’Alerte'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _afficherDialogueAlerte(context),
          child: const Text('Afficher le Dialogue d’Alerte'),
        ),
      ),
    );
  }

  void _afficherDialogueAlerte(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Titre du Dialogue d’Alerte'),
          content: const Text('Ceci est le contenu du dialogue d’alerte.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
