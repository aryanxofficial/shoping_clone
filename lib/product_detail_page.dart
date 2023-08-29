import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late int selectedSize;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedSize = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //it picks up the primary color defined in the main.dart by default
        backgroundColor: null,
        title: const Center(child: Text('Details')),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
                height: 250,
                child: Image(
                    image: AssetImage(widget.product['imageURL'] as String))),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            height: 150,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Color.fromARGB(255, 241, 239, 239),
            ),
            child: Column(
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final sizeList = widget.product['sizes'] as List<int>;
                        final size = (sizeList)[index];
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = size;
                                  print(selectedSize);
                                });
                              },
                              child: Chip(
                                  side: const BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 104, 103, 103)),
                                  backgroundColor: selectedSize == size
                                      ? Color.fromARGB(255, 135, 195, 245)
                                      : null,
                                  label: Text(size.toString()))),
                        );
                      }),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {},
                    child: const Align(
                      alignment: Alignment.bottomRight,
                      child: ListTile(
                        title: Text('Add to cart',
                            style: TextStyle(color: Colors.black)),
                        leading: Icon(Icons.shopping_cart),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
