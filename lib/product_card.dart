import 'package:flutter/material.dart';

class productCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  const productCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      color: const Color.fromARGB(255, 70, 186, 240),
      child: Column(
        children: [
          Text(title),
          const SizedBox(
            height: 10,
          ),
          Text(price),
          const SizedBox(
            height: 10,
          ),
          Image(image: AssetImage(image))
        ],
      ),
    );
  }
}
