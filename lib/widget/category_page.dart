import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:moneymate/widget/kosongan.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
        index: 3,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\nHey, Daffa Aditya",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "See Your Categories\nExpenses Here",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                card(context),
              ],
            ),
          ),
        ),
      ),
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
      child: Column(
        children: [
          SizedBox(height: 20),
          _buildOption(
            "Food",
            "images/Food.png",
            "20%",
            "-Rp. 150.000",
            KosonganPage(),
          ),
          _buildOption(
            "Daily Use",
            "images/dailyuse.png",
            "35%",
            "-Rp. 300.000",
            KosonganPage(),
          ),
          _buildOption(
            "Saving",
            "images/saving.png",
            "10%",
            "-Rp. 50.000",
            KosonganPage(),
          ),
          _buildOption(
            "Transport",
            "images/transport.png",
            "15%",
            "-Rp. 50.000",
            KosonganPage(),
          ),
          _buildOption(
            "Education",
            "images/education.png",
            "20%",
            "-Rp. 50.000",
            KosonganPage(),
          ),
          _buildOption(
            "Pet",
            "images/pet.png",
            "0%",
            "-Rp. 0",
            KosonganPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(String title, String imagePath, String subtitle,
      String amount, Widget nextPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Container(
        height: 80,
        width: 300,
        padding: EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color.fromRGBO(204, 244, 205, 1),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Image.asset(
                    imagePath,
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              amount,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
