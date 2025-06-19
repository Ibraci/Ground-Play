import 'package:flutter/material.dart';

class ClipRRectExampleApp extends StatelessWidget {
  const ClipRRectExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipRRect Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ClipRRectHomePage(),
    );
  }
}

class ClipRRectHomePage extends StatelessWidget {
  const ClipRRectHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ClipRRect Widget Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Image with Uniform Rounded Corners:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Example 1: Image with uniform rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(
                20.0,
              ), // Apply 20.0 radius to all corners
              child: Image.network(
                'https://picsum.photos/id/237/200/200', // Example image URL
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Container with Different Rounded Corners:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Example 2: Container with different rounded corners
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(10.0),
              ),
              child: Container(
                width: 200,
                height: 100,
                color: Colors.deepPurple,
                alignment: Alignment.center,
                child: const Text(
                  'Hello ClipRRect!',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Profile-like Circle Image:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Example 3: Creating a circular image (using a large radius)
            ClipRRect(
              borderRadius: BorderRadius.circular(
                75.0,
              ), // A large radius makes it circular for a square image
              child: Image.network(
                'https://picsum.photos/id/1005/150/150', // Another example image URL
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
