import 'package:flutter/material.dart';
import 'package:flutter_app_mobile_final/api_manager.dart';
import 'package:flutter_app_mobile_final/libertadores_page.dart';
import 'package:flutter_app_mobile_final/main.dart';
import 'package:flutter_app_mobile_final/page_body.dart';

import 'item_page.dart';

enum MenuItem {
  item1,
  item2,
  item3,
  item4,
}

class MyAppLigue extends StatelessWidget {
  const MyAppLigue({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoccerApp(),
    );
  }
}

class SoccerApp extends StatefulWidget {
  const SoccerApp({super.key});

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
    String option = "Liga Profesional";
    
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: selectedColor,
        elevation: 0.0,
        title: const Text(
          "SOCCERBOARD LIG",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == MenuItem.item1) {
              } else if (value == MenuItem.item2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
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
                child: Text('Home'),
              ),
              PopupMenuItem(
                value: MenuItem.item2,
                child: Text('Libertadores'),
              ),
              PopupMenuItem(
                value: MenuItem.item3,
                child: Text('Liga Profesional'),
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
        future: SoccerApi().getAllMatches(option),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("Punto antes del error.");
            print(snapshot.data?.length);
            return LiberPageBody(snapshot.data!, selectedColor ?? Colors.blue);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
