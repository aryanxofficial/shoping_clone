import 'package:flutter/material.dart';
import 'package:shop_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      fontFamily: 'Lato',
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow)),//by mentioning the font family here I dont have to include my custom font everytime in the TextStyle property of a text
      title: 'Shopping App',
      home: const HomePage(),
    );
  }
}
