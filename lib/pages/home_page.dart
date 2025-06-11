import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/grocery_item_tile.dart';
import '../models/cart_model.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ),
        ),
        child: Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // Greeting
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text("Good morning", style: TextStyle(fontSize: 17)),
            ),

            const SizedBox(height: 5),

            // Let's Order
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text("Let's order something fresh for you",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 32,
                      fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 20),

            const Padding(padding: EdgeInsets.symmetric(horizontal: 25), child: Divider()),

            const SizedBox(height: 20),

            // Fresh items + grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text("Fresh items", style: TextStyle(fontSize: 17)),
            ),

            const SizedBox(height: 20),

            Consumer<CartModel>(
              builder: (context, value, child) {
                return Expanded(
                  child: GridView.builder(
                    itemCount: value.shopItems.length,
                    padding: const EdgeInsets.all(12),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false).addItemToCart(index);
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
