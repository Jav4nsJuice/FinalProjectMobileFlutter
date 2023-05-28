import 'package:flutter/material.dart';
import 'package:flutter_app_mobile_final/api_manager.dart';
import 'package:flutter_app_mobile_final/page_body.dart';

import 'item_page.dart';

void main() {
  runApp(MyApp());
}

enum MenuItem {
  item1,
  item2,
  item3,
  item4,
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoccerApp(),
    );
  }
}

class SoccerApp extends StatefulWidget {
  @override
  _SoccerAppState createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {
  Color? selectedColor;

  void onColorSelected(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: selectedColor,
        elevation: 0.0,
        title: Text(
          "SOCCERBOARD",
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == MenuItem.item1) {
              } else if (value == MenuItem.item2) {
              } else if (value == MenuItem.item3) {
              } else if (value == MenuItem.item4) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ItemPage(
                    onColorSelected: onColorSelected,
                  ),
                ));
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem<MenuItem>(
                value: MenuItem.item1,
                child: Text('Item 1'),
              ),
              PopupMenuItem(
                value: MenuItem.item2,
                child: Text('Item 2'),
              ),
              PopupMenuItem(
                value: MenuItem.item3,
                child: Text('Item 3'),
              ),
              PopupMenuItem(
                value: MenuItem.item4,
                child: Text('Personalize'),
              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder(
        future: SoccerApi().getAllMatches(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("Punto antes del error.");
            print(snapshot.data?.length);
            return PageBody(snapshot.data!, selectedColor ?? Colors.blue);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
