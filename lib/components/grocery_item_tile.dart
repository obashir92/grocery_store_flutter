import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GroceryItemTile extends StatelessWidget {

  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            // Image
            SvgPicture.asset(
                imagePath,
                height: 65
            ),

            // Name
            Text(itemName),

            // Price + Button
            MaterialButton(
                onPressed: onPressed,
              color: color[800],
              child: Text('\$ $itemPrice',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
