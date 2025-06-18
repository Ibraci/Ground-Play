import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RichText Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RichTextExample(),
    );
  }
}

class RichTextExample extends StatelessWidget {
  const RichTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RichText Widget Demo')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Example 1: Simple RichText with different styles
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'This is a ',
                  style: DefaultTextStyle.of(
                    context,
                  ).style.copyWith(fontSize: 20), // Inherit default and modify
                  children: <TextSpan>[
                    TextSpan(
                      text: 'beautiful ',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    TextSpan(
                      text: 'example of ',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.blueAccent.shade700,
                      ),
                    ),
                    TextSpan(
                      text: 'RichText ',
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.green,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.green,
                      ),
                    ),
                    const TextSpan(text: 'in Flutter!'),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Example 2: RichText with a clickable portion (link)
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Visit our ',
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'website here',
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      // Make this part clickable
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // In a real app, you'd launch a URL here, e.g., using url_launcher package
                          // launchUrl(Uri.parse('https://example.com'));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Website link clicked!'),
                            ),
                          );
                        },
                    ),
                    const TextSpan(text: ' for more info.'),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Example 3: Combining with different default text styles
              DefaultTextStyle.merge(
                // Applying a default text style for this subtree
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily:
                      'Montserrat', // Assuming 'Montserrat' is in your pubspec.yaml
                  color: Colors.grey,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'This text inherits a ',
                    children: <TextSpan>[
                      TextSpan(
                        text: 'default style ',
                        style: DefaultTextStyle.of(context).style.copyWith(
                          fontWeight: FontWeight.w900,
                          color: Colors.orange,
                        ),
                      ),
                      const TextSpan(text: 'but specific parts are '),
                      TextSpan(
                        text: 'overridden.',
                        style: DefaultTextStyle.of(context).style.copyWith(
                          fontStyle: FontStyle.italic,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
