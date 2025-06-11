import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_shop/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Text("My Cart",
                      style: TextStyle(
                          fontSize:35,
                          fontWeight: FontWeight.bold
                      ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: SvgPicture.asset(value.cartItems[index][2], height: 30),
                            title: Text(value.cartItems[index][0]),
                            subtitle: Text('\$ ' + value.cartItems[index][1]),
                            trailing: IconButton(
                              onPressed: () => Provider.of<CartModel>(context, listen: false).removeItemFromCart(index),
                              icon: Icon(
                                  Icons.cancel, 
                                  color: Colors.teal.shade400),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: SafeArea(
                    child: Container(
                      height: 110,
                      decoration: BoxDecoration(
                          color: Colors.teal.shade300,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total Price",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,)),
                    
                                const SizedBox(height: 5),
                    
                                Text('\$ ' + value.calculateTotal(), style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)
                                ),
                              ],
                            ),

                            const Spacer(),

                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Text("Pay Now",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),

                                  const SizedBox(width: 5),

                                  SvgPicture.asset("lib/images/arrow_right.svg",
                                    colorFilter: ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      )
    );
  }
}
