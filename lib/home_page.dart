import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(actions: [Image.asset('assets/appBar.png')]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(23, 14, 23, 23),
            child: SizedBox(
              width: 223,
              child: Text(
                'Find the best Coffee to your taste',
                style: GoogleFonts.inter(
                  color: Color.fromRGBO(68, 68, 68, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(15),
            child: TextField(
              decoration: InputDecoration(
                label: Text("Find your coffee..."),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  borderRadius: BorderRadius.circular(100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  borderRadius: BorderRadius.circular(100),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: Text('coffee menu'),
          ),
        ],
      ),
    );
  }
}
