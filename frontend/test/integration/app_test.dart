import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:test_drive/app.dart';
import 'package:test_drive/mocks/mock_location.dart';

void main() {
  // Since this time we are testing the widgets we'll use flutter_test package.
  testWidgets(
    'test app startup',
    (WidgetTester tester) async {
      // float over pumpWidget to see what it does
      // Here we renrdered the widget
      await mockNetworkImagesFor(() => tester.pumpWidget(App()));

      final mockLocation = MockLocation.fetchAny();
      // Here we are checking a few things with predefined matchers.
      expect(find.text(mockLocation.name), findsOneWidget);
      expect(find.text('${mockLocation.name}blah'), findsNothing);
    },
  );
}
