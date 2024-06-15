import './location_fact.dart';

class Location {
  Location({required this.name, required this.url, required this.facts});

  // No-parameter constructor using named constructor syntax
  Location.defaultConstructor()
      : name = '',
        url = '',
        facts = [];

  final String name;
  final String url;
  final List<LocationFact> facts;
}
