import 'package:flutter/material.dart';
import 'package:ground_play/data/notifiers.dart';
import 'pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkNotif,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: isDarkMode ? ThemeData.dark(
            primarySwatch: Color: 
          ) : ThemeData.light(),
          home: Scaffold(
            appBar: AppBar(
              title: Text('Playground'),
              actions: [
                IconButton(
                  onPressed: () => {isDarkNotif.value = !isDarkNotif.value},
                  icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                ),
              ],
            ),
            body: HomePage(),
          ),
        );
      },
    );
  }
}
