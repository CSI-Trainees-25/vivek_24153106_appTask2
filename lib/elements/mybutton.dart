import 'package:flutter/material.dart';
import 'package:coffeeshop/home_page.dart';

class MyButton extends StatelessWidget {
  const MyButton(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
      child: Container(
        width: 151,
        height: 62.68,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
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
