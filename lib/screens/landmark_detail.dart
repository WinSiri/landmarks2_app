import 'package:flutter/material.dart';
import 'package:landmarks2_app/models/landmark.dart';
import 'map_view.dart';
import 'circle_image.dart';

class LandmarkDetail extends StatelessWidget {
  const LandmarkDetail({Key? key, required this.landmark}) : super(key: key);
  final Landmark landmark;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(landmark.name),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: MapView(
                      latitude: landmark.coordinates.latitude,
                      longitude: landmark.coordinates.longitude,
                    ),
                    height: 300.0,
                    margin: EdgeInsets.only(bottom: 130.0),
                  ),
                  CircleImage('${landmark.imageName}@2x.jpg'),
                ],
                alignment: Alignment.bottomCenter,
              ),
              Padding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      landmark.name,
                      style: textTheme.headline5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          landmark.park,
                          style: textTheme.subtitle1,
                        ),
                        Text(
                          landmark.state,
                          style: textTheme.subtitle1,
                        ),
                      ],
                    ),
                    Divider(),
                    Text(
                      'About ${landmark.name}',
                      style: textTheme.headline6,
                    ),
                    Text(
                      landmark.description,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(8.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
