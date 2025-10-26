import 'package:flutter/material.dart';
import 'package:coffeeshop/elements/mybutton.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 224, 209, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/introImage.png'),
          Text(
            'Stay Focused',
            style: TextStyle(
              color: Color.fromRGBO(56, 34, 15, 1),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 300,
            child: Text(
              'Get the cup filled of your choice to stay focused and awake. Diffrent type of coffee menu, hot lottee cappucino',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(68, 68, 68, 0.6),
              ),
            ),
          ),
          SizedBox(height: 20),
          MyButton('Dive In'),
        ],
      ),
    );
  }
}
