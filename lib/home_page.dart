import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/product_card.dart';

//I am changing this stateless widget to a stateful widget because I want to know the filter that has been clicked on and that will change the state of the selectedFilter variable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const [
    'All',
    'Adidas',
    'Reebok',
    'Nike',
    'Puma',
    'Onitsuka Tiger',
    'Jordan',
    'Gucci'
  ];

  //In flutter I cannot use an initialized value to initialize another value,
  //thats why I use late keyword and then initialize that variable inside the init method
  // String selectedFilter = filters[0];
  late String selectedFilter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Shoes \nCollection',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        // hoverColor: Colors.red,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search',
                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                    itemCount: filters.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final filter = filters[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {});
                            selectedFilter = filter;
                            print(selectedFilter);
                          },
                          child: Chip(
                            backgroundColor: selectedFilter == filter
                                // ? Color.fromARGB(255, 252, 228, 12)
                                ? Theme.of(context)
                                    .colorScheme
                                    .primary // from this line I can basically inherit the properties of the parent widget. I am using the colorscheme that is defined inside the colorscheme of the themeData inside my material App.
                                : const Color.fromARGB(255, 241, 239, 239),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            label: Text(filter),
                            labelStyle: const TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    }),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return productCard(
                        title: product['title'] as String,
                        price: product['price'] as String,
                        image: product['imageURL'] as String,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
