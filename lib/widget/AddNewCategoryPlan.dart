import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class AddNewCategoryPlan extends StatefulWidget {
  const AddNewCategoryPlan({Key? key}) : super(key: key);

  @override
  State<AddNewCategoryPlan> createState() => _AddNewCategoryPlanState();
}

class _AddNewCategoryPlanState extends State<AddNewCategoryPlan> {
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
                Stack(
                  children: [
                    Positioned(
                      top: 20,
                      left: 40,
                      right: 40,
                      child: Image.asset(
                        "images/AddNewCategoryPlan.png",
                        width: 300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120.0),
                      child: card(context),
                    ),
                  ],
                ),
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
      margin: EdgeInsets.only(top: 150.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "Add your new category",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Name Of Category",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Icon(Icons.edit, size: 50, color: Colors.grey),
              SizedBox(width: 15),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Color.fromRGBO(217, 217, 217, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Text(
            "Category fund allocation as a percentage",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    suffixText: "%",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Color.fromRGBO(217, 217, 217, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Text(
            "Set your category color",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: [
              _buildColorOption(Colors.pink),
              _buildColorOption(Colors.red),
              _buildColorOption(Colors.orange),
              _buildColorOption(Colors.yellow),
              _buildColorOption(Colors.green),
              _buildColorOption(Colors.blue),
              _buildColorOption(Colors.indigo),
              _buildColorOption(Colors.purple),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 165, 165, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Discard",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(204, 244, 205, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    " Save ",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}
