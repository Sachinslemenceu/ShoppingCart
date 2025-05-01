import 'package:flutter/material.dart';

class GroceryItemTitle extends StatelessWidget {
  final String itemname;
  final String itemprice;
  final String itemimage;
  final color;
  final Function()? onPressed;

  const GroceryItemTitle({
    super.key,
    required this.itemname,
    required this.itemprice,
    required this.itemimage,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(itemimage, height: 60, width: 60),
            Text(itemname),
            OutlinedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text("\$ $itemprice"),
            ),
          ],
        ),
      ),
    );
  }
}
