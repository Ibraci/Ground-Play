import 'package:flutter/material.dart';
import 'package:ground_play/data/notifiers.dart';
import 'package:ground_play/pages/posts_page.dart';
import 'package:ground_play/widgets/alert_dialog.dart';
import 'package:ground_play/widgets/forms.dart';
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
          theme: ThemeData(
            primarySwatch: Colors.teal,
            brightness: isDarkMode ? Brightness.dark : Brightness.light,
          ),
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
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: Colors.teal),
                    child: Text(
                      'Playground Menu',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  Builder(
                    builder: (context) => Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.data_array),
                          title: Text('Formulaires'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FormExample(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.home),
                          title: Text('Alerte Dialog'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AlertDialogExample(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.newspaper),
                          title: Text('Articles'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostsPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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
