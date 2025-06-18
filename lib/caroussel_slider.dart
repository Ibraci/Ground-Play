import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      title: 'Carousel Slider Example',
      home: Scaffold(
        body: CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            autoPlayInterval: Duration(seconds: 3),
          ),
          items:
              [
                {
                  'name': 'Image 1',
                  'image':
                      'https://images.pexels.com/photos/32541889/pexels-photo-32541889.jpeg',
                },
                {
                  'name': 'Image 2',
                  'image':
                      'https://images.pexels.com/photos/32541889/pexels-photo-32541889.jpeg',
                },
                {
                  'name': 'Image 3',
                  'image':
                      'https://images.pexels.com/photos/32541889/pexels-photo-32541889.jpeg',
                },
                {
                  'name': 'Image 4',
                  'image':
                      'https://images.pexels.com/photos/32541889/pexels-photo-32541889.jpeg',
                },
              ].map((produit) {
                return Builder(
                  builder: (context) {
                    return Container(
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 170,
                            width: double.infinity,
                            child: Image.network(
                              produit['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            // color: Colors.green,
                            width: double.infinity,
                            height: double.infinity,
                            child: Center(
                              child: Text(
                                produit['name']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
        ),
      ),
    );
    // return GridView(gridDelegate: gridDelegate);
  }
}
