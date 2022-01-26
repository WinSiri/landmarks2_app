import 'dart:convert';

class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates(this.latitude, this.longitude);
  factory Coordinates.fromJson(Map jsonData) {
    // final latitude = jsonData["latitude"] as double;
    // final longitude = jsonData["longitude"] as double;

    // return Coordinates(latitude, longitude);
    return Coordinates(
      jsonData['latitude'] as double,
      jsonData['longitude'] as double,
    );
  }
}

class Landmark {
  int id;
  String name;
  String park;
  String state;
  String description;
  String imageName;
  Coordinates coordinates;

  Landmark(
      {required this.id,
      required this.name,
      required this.park,
      required this.state,
      required this.description,
      required this.imageName,
      required this.coordinates});

  factory Landmark.fromJson(Map<String, dynamic> jsonData) {
    // final name = jsonData['name'] as String;
    // final category = jsonData['category'] as String;
    // final coordinates = Coordinates.fromJson(jsonData['coordinates']);

    // return Landmark(name: name, category: category, coordinates: coordinates);
    return Landmark(
      id: jsonData['id'] as int,
      name: jsonData['name'] as String,
      park: jsonData['park'] as String,
      state: jsonData['state'] as String,
      description: jsonData['description'] as String,
      imageName: jsonData['imageName'] as String,
      coordinates: Coordinates.fromJson(jsonData['coordinates']),
    );
  }
}

Future<List<Landmark>> parseLandmarks(String assetString) async {
  final jsons = jsonDecode(assetString).cast<Map<String, dynamic>>();

  return [
    for (var json in jsons) Landmark.fromJson(json)
  ]; // parsed.map<Landmark>((json) => Landmark.fromJson(json)).toList();
}
