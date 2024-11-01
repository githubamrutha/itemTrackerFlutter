import 'package:flutter/material.dart';

class RenderBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RenderBox renderBox = context.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);
        final size = renderBox.size;
        print("Position: $position, Size: $size");
      },
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: Center(child: Text("Tap me")),
      ),
    );
  }
}
