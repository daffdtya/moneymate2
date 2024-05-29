import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:moneymate/widget/bills.dart';
import 'package:moneymate/widget/category_page.dart';
import 'package:moneymate/widget/cobaplanning.dart';
import 'package:moneymate/widget/expense.dart';
import 'package:moneymate/widget/income.dart';
import 'package:moneymate/widget/receipt.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CobaHomePage(),
    );
  }
}

class CobaHomePage extends StatefulWidget {
  const CobaHomePage({Key? key}) : super(key: key);

  @override
  _CobaHomePageState createState() => _CobaHomePageState();
}

class _CobaHomePageState extends State<CobaHomePage> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(204, 244, 205, 1),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color.fromRGBO(204, 244, 205, 1),
        items: <Widget>[
          Icon(Icons.home),
          Icon(Icons.bar_chart),
          Icon(Icons.add),
          Icon(Icons.category),
          Icon(Icons.notification_add),
        ],
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              // Navigate to home page or refresh
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
              break;
            case 1:
              // Handle bar chart tap here
              break;
            case 2:
              // Refresh CobaHomePage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CobaHomePage()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryPage()),
              );
              break;
            case 4:
              // Handle notification tap here
              break;
          }
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "\nHey, Daffa Aditya\nAdd Your Tracking Budget Here",
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
    );
  }

  Widget card(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      width: 430,
      height: 714,
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
          Image.asset(
            "images/addbudget.png",
            width: 300,
          ),
          SizedBox(height: 20),
          _buildOption(
              "Set Your Planning",
              "images/planning.png",
              "Easily organize your financial categories with\npercentages",
              CobaPlanningPage()),
          _buildOption("Scan Your Receipt", "images/scan.png",
              "Scan your receipts for easy expense tracking", ReceiptPage()),
          _buildOption(
              "Note Your Bills",
              "images/note.png",
              "Easily record your monthly bills and set your\nown reminders",
              BillsPage()),
          _buildOption("Add Your Income", "images/income.png",
              "Keep track of your income here", IncomePage()),
          _buildOption("Track Your Expenses", "images/expense.png",
              "Manually record your expenses by category", ExpensePage())
        ],
      ),
    );
  }

  Widget _buildOption(
      String title, String imagePath, String subtitle, Widget nextPage) {
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
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(61, 124, 64, 1),
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
