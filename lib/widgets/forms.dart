import 'package:flutter/material.dart';
import 'package:ground_play/data/notifiers.dart';

class FormExample extends StatelessWidget {
  FormExample({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkNotif,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          title: 'Exemple de Formulaire',
          theme: ThemeData(
            primarySwatch: Colors.teal,
            brightness: isDarkMode ? Brightness.dark : Brightness.light,
          ),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Widget Formulaire'),
              actions: [
                IconButton(
                  icon: ValueListenableBuilder(
                    valueListenable: isDarkNotif,
                    builder: (context, isDarkMode, child) {
                      print('isDarkMode: $isDarkMode');
                      return Icon(
                        isDarkMode ? Icons.dark_mode : Icons.light_mode,
                      );
                    },
                  ),
                  onPressed: () {
                    isDarkNotif.value = !isDarkNotif.value;
                    print('Mode sombre activé: ${isDarkNotif.value}');
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Nom',
                        hintText: 'Entrez votre nom',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre nom';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Entrez votre email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Mot de passe',
                        hintText: 'Entrez votre mot de passe',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre mot de passe';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Numéro de téléphone',
                        hintText: 'Entrez votre numéro de téléphone',
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre numéro de téléphone';
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Genre'),
                      items: const [
                        DropdownMenuItem(value: 'male', child: Text('Homme')),
                        DropdownMenuItem(value: 'female', child: Text('Femme')),
                        DropdownMenuItem(value: 'other', child: Text('Autre')),
                      ],
                      onChanged: (value) {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez sélectionner votre genre';
                        }
                        return null;
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Accepter les conditions'),
                      value: false,
                      onChanged: (value) {},
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    SwitchListTile(
                      title: const Text('S’abonner à la newsletter'),
                      value: false,
                      onChanged: (value) {},
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Traitement des données'),
                            ),
                          );
                        }
                      },
                      child: const Text('Soumettre'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
