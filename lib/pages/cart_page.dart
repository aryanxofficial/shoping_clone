import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
// import 'package:shop_app/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartItem['imageURL'] as String),
                radius: 50,
              ),
              title: Text(cartItem['title'].toString()),
              subtitle: Text('size:${cartItem['size'].toString()}'),
              trailing: IconButton(
                  color: Colors.red,
                  onPressed: () {
                    showDialog(
                        barrierDismissible:
                            false, //due to this user wont be able to exit the dialog box when they click somewhere out on the screen they will have to choose either yes or no.
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Delete Product'),
                            content: const Text(
                                'Are you sure you want to delete the item from your cart??'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('No',style: TextStyle(color: Colors.red),)),
                              TextButton(
                                  onPressed: () {
                                    Provider.of<CartProvider>(context,listen: false)
                                        .removeProduct(cartItem);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Yes',style: TextStyle(color: Colors.blue),))
                            ],
                          );
                        });
                  },
                  icon: const Icon(Icons.delete)),
            );
          }),
    );
  }
}
