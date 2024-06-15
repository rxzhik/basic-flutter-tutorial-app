import "package:flutter/material.dart";
import "package:test_drive/models/location.dart";
import "package:test_drive/styles.dart";

class LocationDetail extends StatelessWidget {
  final Location location;
  LocationDetail(this.location);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // To display any text in futter we use the Text widget.
        title: Text(location.name, style: Styles.headerLarge),
        backgroundColor: Colors.grey[600],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _renderBody(context, location),
      ),
    );
  }

//   // To define a private function in a flutter app jsut prepend the function
//   // with an underscore like this: _section, so if the method is not going
//   // to be used outside the class this is the best practice.
//   Widget _section(String title, Color color) {
//     return Container(
//       //Here we are basically passing parameters to the constructors
//       decoration: BoxDecoration(
//         color: color,
//       ),
//       child: Text(title),
//     );
//   }
// }
  // This function is going to render the entire body of the page.
  List<Widget> _renderBody(BuildContext context, Location location) {
    List<Widget> result = [];
    result.add(_bannerImage(location.url, 170.0));
    result.addAll(_renderFacts(context, location));
    return result;
  }

  List<Widget> _renderFacts(BuildContext context, Location location) {
    List<Widget> result = [];

    for (int i = 0; i < location.facts.length; i++) {
      result.add(_sectionTitle(location.facts[i].title));
      result.add(_sectionText(location.facts[i].text));
    }
    return result;
  }

  Widget _sectionTitle(String text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: Styles.headerLarge,
      ),
    );
  }

  Widget _sectionText(String text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 15.0),
      child: Text(
        text,
        style: Styles.textDefault,
      ),
    );
  }

  Widget _bannerImage(String url, double height) {
    return Container(
      // Here we are using a named constructor from the Image class, just as we
      // learnt earlier.
      constraints: BoxConstraints.tightFor(
        height: height,
      ),
      child: Image.network(url, fit: BoxFit.fitWidth),
    );
  }
}
