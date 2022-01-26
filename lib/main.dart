import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'models/landmark.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landmarks App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<List<Landmark>>(
        future: loadLandmarksData(context),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return HomeScreen(title: 'Landmarks', landmarks: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<Landmark>> loadLandmarksData(BuildContext context) async {
    try {
      List<Landmark> landmarks = await DefaultAssetBundle.of(context)
          .loadStructuredData('assets/landmarkData.json', parseLandmarks);
      return landmarks;
    } catch (error) {
      print(error.toString());
      return List<Landmark>.empty();
    }
  }
}
