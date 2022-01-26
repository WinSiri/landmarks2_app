import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage(this.imageName, {Key? key}) : super(key: key);
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10.0)],
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/Images/$imageName'),
        radius: 130.0,
      ),
    );
  }
}
