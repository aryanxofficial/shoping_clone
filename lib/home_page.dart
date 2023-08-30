import 'package:flutter/material.dart';
import 'package:shop_app/cart_page.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/product_card.dart';
import 'package:shop_app/product_detail_page.dart';
import 'package:shop_app/product_list.dart';

//I am changing this stateless widget to a stateful widget because I want to know the filter that has been clicked on and that will change the state of the selectedFilter variable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //In flutter I cannot use an initialized value to initialize another value,
  //thats why I use late keyword and then initialize that variable inside the init method
  // String selectedFilter = filters[0];
  int currentPage = 0;

  List<Widget> pages = const [ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentPage = value;
              //No need of navigator since in body only I can pass variable as hrr bar bottom navigation wla dabane pr widget to waise bhi poora rebuild ho hi raha hai
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //   return pages[value];
              // }));
            });
          },
          currentIndex: currentPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: '')
          ]),
    );
  }
}
