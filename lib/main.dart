import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
// import 'package:shop_app/global_variables.dart';
import 'package:shop_app/pages/home_page.dart';
// import 'package:shop_app/product_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // useMaterial3: true, //this line somwhow is able to remove the yellow background from the appBar
          fontFamily:
              'Lato', //by mentioning the font family here I dont have to include my custom font everytime in the TextStyle property of a text
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.yellow,
            primary: const Color.fromARGB(255, 247, 225,
                29), //here I am basically over riding primary color, since seed color se ek primary color generate hua hoga But I don't like that and I want my own primary color
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        title: 'Shopping App',
        // home: ProductDetailPage(
        //   product: products[0],
        // ),
        home: const HomePage(),
      ),
    );
  }
}
