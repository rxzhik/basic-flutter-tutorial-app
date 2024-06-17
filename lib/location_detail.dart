import "package:flutter/material.dart";
import "package:test_drive/mocks/mock_location.dart";
import "package:test_drive/models/location.dart";
import "package:test_drive/styles.dart";

class LocationDetail extends StatefulWidget {
  final int locationID;
  LocationDetail(this.locationID);

  @override
  createState() => _LocationDetailState(locationID);
}

class _LocationDetailState extends State<LocationDetail> {
  final int locationID;
  // We need to create a variable in which we'll store the location object
  // we'll fetch. Since we need it to be available in the whole class we declare
  // it here.
  // So we implemented the Location.bank() so we don't have to check for nulls
  // later.
  Location location = Location.blank();

  _LocationDetailState(this.locationID);

  @override
  void initState() {
    super.initState();
    getLocationDetail(locationID);
  }

  getLocationDetail(int locaitonID) async {
    final Location location = await Location.fetchByID(this.locationID);
    // Hover over it to know what mounted is and why do we need to keep check
    // here. Here is a link to the lifecycle of a widget in flutter:
    // https://www.dhiwise.com/post/unveiling-the-flutter-widget-lifecycle
    if (mounted) {
      setState(() {
        this.location = location;
      });
    }
  }

  // Remember the build method can be called many times so be careful what you
  // load in here, cause if it is something intense it can slow down your app.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // To display any text in futter we use the Text widget.
        title: Text(location.name, style: Styles.headerLarge),
        backgroundColor: Colors.grey[600],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, location),
        ),
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

    if (location.facts != null) {
      for (int i = 0; i < location.facts!.length; i++) {
        result.add(_sectionTitle(location.facts![i].title));
        result.add(_sectionText(location.facts![i].text));
      }
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
    Image? image; // by default its null
    // we gotta do this here cuz, as in Location.blank() url is initialized with
    // '', hence if we try to load an image using blank url it could crash. But
    // on this condition if we keep the image null, the widget can still render
    // null gracefully.
    try {
      if (url.isNotEmpty) {
        image = Image.network(url, fit: BoxFit.fitWidth);
      }
    } catch (e) {
      print("IMAGE LOADING ERROR: could not load image $url");
    }

    return Container(
      // Here we are using a named constructor from the Image class, just as we
      // learnt earlier.
      constraints: BoxConstraints.tightFor(
        height: height,
      ),
      child: image,
    );
  }
}
