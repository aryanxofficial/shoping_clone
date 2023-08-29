import 'package:flutter/material.dart';

class productCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final Color backgroundColor;

  const productCard(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: backgroundColor),
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      // color: const Color.fromARGB(255, 127, 206, 243),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            price,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Image(
              image: AssetImage(image),
              height: 200,
            ),
          )
        ],
      ),
    );
  }
}
