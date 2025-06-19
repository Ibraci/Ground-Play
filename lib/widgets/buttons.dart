import 'package:flutter/material.dart';

class ButtonsExample extends StatelessWidget {
  const ButtonsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlayGround',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.teal, brightness: Brightness.light),
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Action à exécuter
                },
                child: Text('Soumettre'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Action à exécuter
                },
                child: Text('Mot de passe oublié ?'),
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  // Action à exécuter
                },
                child: Text('Annuler'),
              ),
              SizedBox(height: 20),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  // Action à exécuter
                },
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: 'Français',
                items: <String>['Français', 'Anglais', 'Espagnol'].map((
                  String value,
                ) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  print(newValue);
                },
              ),
              SizedBox(height: 20),
              BackButton(
                onPressed: () {
                  // Action à exécuter
                },
              ),
              SizedBox(height: 20),
              CloseButton(
                onPressed: () {
                  // Action à exécuter
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
