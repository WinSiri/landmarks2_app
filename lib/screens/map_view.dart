import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatelessWidget {
  MapView({Key? key, required this.latitude, required this.longitude})
      : centerCoord = LatLng(latitude, longitude),
        super(key: key);
  final double latitude;
  final double longitude;
  final LatLng centerCoord;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: centerCoord,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
          attributionBuilder: (_) {
            return Text("©OpenStreetMap");
          },
        ),
      ],
    );
  }
}
// class MapView extends StatelessWidget {
//   MapView({Key? key}) : super(key: key);
//   final position = LatLng(13.850814879272919, 100.52816996683069);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FlutterMap(
//         options: MapOptions(
//           center: position,
//           // zoom: 15.0,
//         ),
//         layers: [
//           TileLayerOptions(
//             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//             subdomains: ['a', 'b', 'c'],
//             attributionBuilder: (_) {
//               return Text("© OpenStreetMap contributors");
//             },
//           ),
//           MarkerLayerOptions(
//             markers: [
//               Marker(
//                 point: position,
//                 builder: (_) => Icon(Icons.place, color: Colors.red),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
