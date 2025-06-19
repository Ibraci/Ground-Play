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
          title: 'Form Example',
          theme: ThemeData(
            primarySwatch: Colors.teal,
            brightness: isDarkMode ? Brightness.dark : Brightness.light,
          ),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Form Widget Demo'),
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
                    print('Dark mode toggled: ${isDarkNotif.value}');
                  },
                ),
              ],
            ),
            body: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                    TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                      }
                      return null;
                    },
                    ),
                    TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter your phone number',
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                      }
                      return null;
                    },
                    ),
                    DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Gender',
                    ),
                    items: const [
                      DropdownMenuItem(value: 'male', child: Text('Male')),
                      DropdownMenuItem(value: 'female', child: Text('Female')),
                      DropdownMenuItem(value: 'other', child: Text('Other')),
                    ],
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                      return 'Please select your gender';
                      }
                      return null;
                    },
                    ),
                    CheckboxListTile(
                    title: const Text('Accept Terms'),
                    value: false,
                    onChanged: (value) {},
                    controlAffinity: ListTileControlAffinity.leading,
                    ),
                    SwitchListTile(
                    title: const Text('Subscribe to newsletter'),
                    value: false,
                    onChanged: (value) {},
                    ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
