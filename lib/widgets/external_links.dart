import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalLinkWidget extends StatelessWidget {
  final String url;
  final String text;

  const ExternalLinkWidget({super.key, required this.url, required this.text});

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      // Gérer l'erreur, par exemple afficher une snackbar
      debugPrint('Impossible d\'ouvrir $url');
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Impossible d\'ouvrir le lien')),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchUrl,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Liens externes')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExternalLinkWidget(
              url: 'https://www.google.com',
              text: 'Visiter Google',
            ),
            SizedBox(height: 20),
            ExternalLinkWidget(
              url: 'mailto:support@example.com?subject=Aide',
              text: 'Envoyer un e-mail',
            ),
            SizedBox(height: 20),
            ExternalLinkWidget(url: 'tel:+15550101234', text: 'Nous appeler'),
            SizedBox(height: 20),
            ExternalLinkWidget(
              url: 'sms:+15550101234?body=Bonjour',
              text: 'Envoyer un SMS',
            ),
            SizedBox(height: 20),
            ExternalLinkWidget(
              url:
                  'https://maps.apple.com/?q=Statue%20de%20la%20Liberté', // iOS maps
              // url: 'geo:40.689247,-74.044502', // Android geo URI
              text: 'Ouvrir la carte',
            ),
          ],
        ),
      ),
    );
  }
}
