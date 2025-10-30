import 'package:coffeeshop/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemTile extends StatelessWidget {
  const ItemTile(this.menuItem, {required this.onTap, super.key});
  final MenuItem menuItem;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(menuItem.imagePath, width: 160),
            Text(menuItem.name, style: GoogleFonts.dmSerifDisplay(fontSize: 20)),
            SizedBox(
              width: 160,
              child: Row(
                children: [
                  Text(menuItem.price),
                  Spacer(),
                  Icon(Icons.star, color: Colors.amber),
                  Text(menuItem.rating),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
