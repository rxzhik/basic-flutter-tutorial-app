// Here are a few things to keep in mind:
// 1. The name of the test file should end with _test.
// 2. There are 3 kinds of tests unit, widget & integration.
// 3. Usually we do unit tests for each of the models we create, but since
//    our models don't have any logic in them we'll just test out the mock_locaiton
//    helper functions.

// Since here we aren't testing anything flutter related, we are testing just a
// class in dart hence we aren't going to use flutter's test package, rather we
// are going to use dart's test package, we'll use flutter's test package later
// on.
import 'package:flutter_test/flutter_test.dart';
import '../../lib/mocks/mock_location.dart';

// Every test has a main fucntion, cause you can run this file as is not through
// main.dart

void main() {
  test('test fetchAny', () {
    final mockLocation = MockLocation.fetchAny();
    // Here the first argument is dynamic and the second argument could be a
    // pre-defined matcher here we are using isNotNull, we get these matchers
    // from the test package. Check the difference between dynamic and var.
    expect(mockLocation, isNotNull);
    expect(mockLocation.name, isNotEmpty);
  });

  test('test fetchAll', () {
    final mockLocations = MockLocation.fetchAll();
    expect(mockLocations.length, greaterThan(0));
    expect(mockLocations[0].name, isNotEmpty);
  });

  test('test fetch', () {
    final mockLocation = MockLocation.fetch(0);
    expect(mockLocation, isNotNull);
    expect(mockLocation.name, isNotEmpty);
  });
}
