import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class KosonganPage extends StatefulWidget {
  const KosonganPage({Key? key}) : super(key: key);

  @override
  State<KosonganPage> createState() => _KosonganPageState();
}

class _KosonganPageState extends State<KosonganPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(204, 244, 205, 1),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color.fromRGBO(204, 244, 205, 1),
        items: [
          Icon(Icons.home),
          Icon(Icons.bar_chart),
          Icon(Icons.add),
          Icon(Icons.category),
          Icon(Icons.notification_add),
        ],
        index: 2,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "images/kosongan.png",
                width: 300,
              ),
              SizedBox(height: 15),
              card(context),
            ],
          ),
        ),
      )),
    );
  }

  Widget card(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      width: 430,
      height: 712,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
