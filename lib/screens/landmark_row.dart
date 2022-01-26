import 'package:flutter/material.dart';
import 'package:landmarks2_app/models/landmark.dart';
import 'package:landmarks2_app/screens/landmark_detail.dart';

class LandmarkRow extends StatelessWidget {
  const LandmarkRow({Key? key, required this.landmark}) : super(key: key);
  final Landmark landmark;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'assets/Images/${landmark.imageName}@2x.jpg',
        width: 50,
        height: 50,
      ),
      title: Text(landmark.name),
      trailing: Icon(Icons.navigate_next),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LandmarkDetail(landmark: landmark),
        ),
      ),
    );
  }
}
