import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:moneymate/cobahomepage.dart';
import 'package:moneymate/widget/AddNewCategoryPlan.dart';
import 'package:moneymate/widget/kosongan.dart';

class CobaPlanningPage extends StatefulWidget {
  const CobaPlanningPage({super.key});

  @override
  State<CobaPlanningPage> createState() => _CobaPlanningPageState();
}

class _CobaPlanningPageState extends State<CobaPlanningPage> {
  List<Map<String, String>> categories = [
    {"title": "Food", "imagePath": "images/Food.png", "subtitle": "20%"},
    {
      "title": "Daily Use",
      "imagePath": "images/dailyuse.png",
      "subtitle": "35%"
    },
    {"title": "Saving", "imagePath": "images/saving.png", "subtitle": "10%"},
    {
      "title": "Transport",
      "imagePath": "images/transport.png",
      "subtitle": "15%"
    },
    {
      "title": "Education",
      "imagePath": "images/education.png",
      "subtitle": "20%"
    },
    {"title": "Pet", "imagePath": "images/pet.png", "subtitle": "0%"},
  ];

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
                        "Setting Your Plan Here",
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
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
      Colors.cyan,
    ];

    return Container(
      padding: EdgeInsets.all(20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CobaHomePage()),
                  );
                },
                icon: Icon(Icons.arrow_back_ios_outlined),
              ),
            ],
          ),
          Image.asset(
            "images/plan_chart.png",
            width: 300,
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Your Monthly Income',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(217, 217, 217, 1),
                      hintText: 'Rp.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddNewCategoryPlan()),
                    );
                  },
                  child: Container(
                    height: 25,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Color.fromRGBO(13, 129, 18, 1),
                    ),
                    child: Center(
                      child: Text(
                        'Add New Category',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(categories.length, (index) {
              return _buildOption(
                categories[index]["title"]!,
                categories[index]["imagePath"]!,
                categories[index]["subtitle"]!,
                KosonganPage(),
                colors[index % colors.length],
                index,
              );
            }),
          ),
        ],
      ),
    );
  }

  void _editCategory(int index) {
    TextEditingController titleController =
        TextEditingController(text: categories[index]["title"]);
    TextEditingController subtitleController =
        TextEditingController(text: categories[index]["subtitle"]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Edit Category',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Name of Category',
                ),
              ),
              TextField(
                controller: subtitleController,
                decoration: InputDecoration(
                  labelText: 'Category fund allocation as a percentage',
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
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  categories[index]["title"] = titleController.text;
                  categories[index]["subtitle"] = subtitleController.text;
                });
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Discard',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildOption(
    String title,
    String imagePath,
    String subtitle,
    Widget nextPage,
    Color color,
    int index,
  ) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => nextPage),
            );
          },
          child: Container(
            height: 80,
            width: 150,
            padding: EdgeInsets.all(8),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
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
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 1,
          child: IconButton(
            icon: Icon(Icons.edit, size: 16),
            onPressed: () {
              _editCategory(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildColorOption(Color color) {
    return GestureDetector(
      onTap: () {
        // Define action on color selection
      },
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
