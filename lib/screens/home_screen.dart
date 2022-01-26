import 'package:flutter/material.dart';
import 'package:landmarks2_app/models/landmark.dart';
import 'landmark_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, required this.landmarks})
      : super(key: key);

  final String title;
  final List<Landmark> landmarks;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(child: LandmarkList(landmarks: widget.landmarks)),
    );
  }
}
