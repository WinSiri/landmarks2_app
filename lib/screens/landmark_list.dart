import 'package:flutter/material.dart';
import 'package:landmarks2_app/screens/landmark_row.dart';
import 'package:landmarks2_app/models/landmark.dart';

class LandmarkList extends StatelessWidget {
  const LandmarkList({Key? key, required this.landmarks}) : super(key: key);
  final List<Landmark> landmarks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      itemCount: landmarks.length,
      separatorBuilder: (_, __) => Divider(),
      itemBuilder: (_, index) => LandmarkRow(landmark: landmarks[index]),
    );
  }
}
