import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shopping_cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              "Items in Cart",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: Provider.of<CartModel>(context).cartItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      leading: Image.asset(
                        Provider.of<CartModel>(context).cartItems[index][2],
                        height: 50,
                        width: 50,
                      ),
                      title: Text(
                        Provider.of<CartModel>(context).cartItems[index][0],
                      ),
                      subtitle: Text(
                        "\$ ${Provider.of<CartModel>(context).cartItems[index][1]}",
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Provider.of<CartModel>(
                            context,
                            listen: false,
                          ).removeItemCart(index);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text("Total"),
                subtitle: Text(
                  "\$ ${Provider.of<CartModel>(context).calculatePrice()}",
                ),
                trailing: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Success"),
                          content: Text("Your order has been placed"),
                        );
                      },
                    );
                  },
                  child: Text("Pay Now"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
