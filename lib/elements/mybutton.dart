import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(this.text, {super.key, required this.onTap});
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 151,
        height: 62.68,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(96, 115, 67, 12),
              spreadRadius: 2,
              blurRadius: 16,
            ),
          ],
          color: Color.fromRGBO(150, 114, 89, 1),
          borderRadius: BorderRadiusGeometry.all(Radius.circular(100)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: TextStyle(color: Colors.white)),
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
