import 'dart:convert';

import 'package:test_drive/endpoint.dart';
import 'package:test_drive/mocks/mock_location.dart';
import './location_fact.dart';
import 'package:json_annotation/json_annotation.dart';
// the http class is just a collection of methods and hence to refer to it easily
// we use as here.
import 'package:http/http.dart' as http;

// Read about what part does!. Here we are basically using what the generated
// file will produce. So its gonna take the code what is in the generated file
// and let us use it.
/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'location.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.

@JsonSerializable()
class Location {
  // No-parameter constructor using named constructor syntax
  Location.defaultConstructor()
      : id = 10000,
        name = '',
        url = '',
        facts = [];
  final int id;
  final String name;
  final String url;
  final List<LocationFact>? facts;
  Location(
      {required this.id, required this.name, required this.url, this.facts});
  Location.blank()
      : id = 0,
        name = '',
        url = '',
        facts = [];

  /// A necessary factory constructor for creating a new User instance
  /// from a map. We'll create a special constructor that'll take
  /// Map<String, dynamic> as input and creates the Location Object.
  ///
  /// Pass the map to the generated `_$LocationFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Location
  ///
  /// We get this constructor from the generated file which we included using
  /// the part keyword.
  ///
  // Have a look at what factory keyword is for?
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  static Future<List<Location>> fetchAll() async {
    // var uri = Endpoint.uri('/locations');

    // final resp = await http.get(uri);
    // if (resp.statusCode != 200) {
    //   throw (resp.body);
    // }

    List<Location> list = [];

    // for (var jsonItem in json.decode(resp.body)) {
    //   list.add(Location.fromJson(jsonItem));
    // }
    await Future.delayed(Duration(seconds: 1));
    list = MockLocation.items;
    return list;
  }

  static Future<Location> fetchByID(int id) async {
    // var uri = Endpoint.uri('/locations/$id');

    // final resp = await http.get(uri);
    // if (resp.statusCode != 200) {
    //   throw (resp.body);
    // }

    // final Map<String, dynamic> itemMap = json.decode(resp.body);
    await Future.delayed(Duration(seconds: 1));
    Location itemMap = MockLocation.items[id];
    return itemMap;
  }
}
