import 'package:flutter/material.dart';

class AlertDialogExample extends StatelessWidget {
  const AlertDialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alert Dialog Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AlertDialogHomePage(),
    );
  }
}

class AlertDialogHomePage extends StatelessWidget {
  const AlertDialogHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alert Dialog Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showAlertDialog(context),
          child: const Text('Show Alert Dialog'),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert Dialog Title'),
          content: const Text('This is the content of the alert dialog.'),
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
