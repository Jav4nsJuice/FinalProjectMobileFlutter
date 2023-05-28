import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  final Function(Color)? onColorSelected;

  ItemPage({required this.onColorSelected});
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  Color? selectedColor;

  void selectColor(Color color) {
    setState(() {
      selectedColor = color;
    });
    if (widget.onColorSelected != null) {
      widget.onColorSelected!(color);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Color'),
        backgroundColor: selectedColor,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ColorBox(
              color: Colors.red,
              isSelected: selectedColor == Colors.red,
              onTap: () => selectColor(Colors.red),
            ),
            SizedBox(height: 10.0),
            ColorBox(
              color: Colors.green,
              isSelected: selectedColor == Colors.green,
              onTap: () => selectColor(Colors.green),
            ),
            SizedBox(height: 10.0),
            ColorBox(
              color: Colors.grey,
              isSelected: selectedColor == Colors.grey,
              onTap: () => selectColor(Colors.grey),
            ),
            SizedBox(height: 10.0),
            ColorBox(
              color: Colors.blue,
              isSelected: selectedColor == Colors.blue,
              onTap: () => selectColor(Colors.blue),
            ),
            SizedBox(height: 10.0),
            ColorBox(
              color: Colors.deepPurple,
              isSelected: selectedColor == Colors.deepPurple,
              onTap: () => selectColor(Colors.deepPurple),
            ),
            SizedBox(height: 10.0),
            ColorBox(
              color: Colors.black,
              isSelected: selectedColor == Colors.black,
              onTap: () => selectColor(Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const ColorBox({
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
