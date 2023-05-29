import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  final Function(Color)? onColorSelected;

  const ItemPage({super.key, required this.onColorSelected});
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
        title: const Text('Select a Color'),
        backgroundColor: selectedColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ColorBox(
              color: Colors.red,
              isSelected: selectedColor == Colors.red,
              onTap: () => selectColor(Colors.red),
            ),
            const SizedBox(height: 10.0),
            ColorBox(
              color: Colors.green,
              isSelected: selectedColor == Colors.green,
              onTap: () => selectColor(Colors.green),
            ),
            const SizedBox(height: 10.0),
            ColorBox(
              color: Colors.grey,
              isSelected: selectedColor == Colors.grey,
              onTap: () => selectColor(Colors.grey),
            ),
            const SizedBox(height: 10.0),
            ColorBox(
              color: Colors.blue,
              isSelected: selectedColor == Colors.blue,
              onTap: () => selectColor(Colors.blue),
            ),
            const SizedBox(height: 10.0),
            ColorBox(
              color: Colors.deepPurple,
              isSelected: selectedColor == Colors.deepPurple,
              onTap: () => selectColor(Colors.deepPurple),
            ),
            const SizedBox(height: 10.0),
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

  const ColorBox({super.key, 
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
