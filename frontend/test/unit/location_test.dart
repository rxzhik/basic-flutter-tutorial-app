import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_drive/models/location.dart';

void main() {
  // Here we have simply converted the json object to a map, but in  large apps
  // we would like to rather work with objects rather than maps itself, hence later on
  // rather than storing it in map we will use a package to conver the json to an object,
  // like Location here.
  test('test location deserialization', () async {
    // const locationJSON =
    //     '{ "name": "Cape Town", "url": "https://images.unsplash.com/photo-1585061528750-3baca2cb6a10?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","facts": [{"title": "Summary", "text": "This bamboo grove is on the outskirts of kyoto."}]}';
    // // here json.decode() return a dynamic type could be mix of map, array, primitive
    // // but we've done type casting here using as keyword where it tells the compiler to assume
    // // that the dynamic type behaves like a Map. Since we know that it will be like a map here.
    // final locationMap = json.decode(locationJSON) as Map<String, dynamic>;

    // expect('Cape Town', equals(locationMap["name"]));

    // // After creating the constructor for json_serialization automatically we
    // // can use this now.
    // final location = Location.fromJson(locationMap);

    // expect(location.name, equals(locationMap["name"]));
    // expect(location.url, equals(locationMap["url"]));
    // // Test for the facts as well, it is a nested class and we have created
    // // the .fromJson() constructor for it as well.
    // expect(location.facts?[0].title, equals(locationMap["facts"][0]["title"]));
    // expect(location.facts?[0].text, equals(locationMap["facts"][0]["text"]));

    final locations = await Location.fetchAll();

    for (var location in locations) {
      expect(location.name, hasLength(greaterThan(0)));
      expect(location.url, hasLength(greaterThan(0)));

      final fetchedLocation = await Location.fetchByID(location.id);
      expect(fetchedLocation.name, equals(location.name));
      expect(fetchedLocation.url, equals(location.url));
    }
  });
}
