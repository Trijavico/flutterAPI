import 'package:couteau/pages/about_page.dart';
import 'package:couteau/pages/age_page.dart';
import 'package:couteau/pages/college_page.dart';
import 'package:couteau/pages/genre_page.dart';
import 'package:couteau/pages/home_page.dart';
import 'package:couteau/pages/intro_page.dart';
import 'package:couteau/pages/weather_page.dart';
import 'package:couteau/pages/wordpres_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Couteau',
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/homepage' : (context) => HomePage(),
        '/genrepage' :(context) => GenrePage(),
        '/agepage' : (context) => AgePage(),
        '/collegepage' :(context) => CollegePage(),
        '/weatherpage' :(context) => WeatherPage(),
        '/wordprespage' :(context) => NasaNewsScaffold(),
        '/aboutpage' :(context) => ProfilePage(),
      },
    );
  }
}
