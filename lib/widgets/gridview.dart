import 'package:flutter/material.dart';

class GridViewExamples extends StatelessWidget {
  const GridViewExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const GridViewExample(),
    );
  }
}

class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  // A list of colors to use for the grid items
  final List<Color> _gridColors = const [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.brown,
    Colors.indigo,
    Colors.lime,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView Widget Demo')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          // 1. Grid Delegate: Define the layout of the grid
          // Here, we use a fixed number of columns (crossAxisCount: 3)
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 items per row
            crossAxisSpacing: 10.0, // Spacing between columns
            mainAxisSpacing: 10.0, // Spacing between rows
            childAspectRatio: 1.0, // Make items square (width:height ratio)
          ),
          // 2. Item Builder: How to build each individual item
          itemBuilder: (BuildContext context, int index) {
            // Ensure index doesn't go out of bounds for _gridColors
            final color = _gridColors[index % _gridColors.length];
            return Card(
              color: color,
              elevation: 4.0,
              child: Center(
                child: Text(
                  'Item ${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
          // 3. Item Count: Total number of items in the grid
          itemCount: 50, // Let's create 50 items to demonstrate scrolling
        ),
      ),
    );
  }
}
