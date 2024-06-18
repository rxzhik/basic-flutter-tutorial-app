import "package:flutter/material.dart";
import "package:test_drive/components/banner_image.dart";
import "package:test_drive/components/default_app_bar.dart";
import "package:test_drive/components/location_tile.dart";
import "package:test_drive/models/location.dart";
import "package:test_drive/styles.dart";
import "package:url_launcher/url_launcher.dart";

const BannerImageHeight = 300.0;
const BodyVerticalPadding = 20.0;
const FooterHeight = 100.0;

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

    /// If you call setState() on a widget that is not mounted, Flutter will
    /// throw an exception because it is trying to update a state that no longer
    ///  exists. Checking mounted helps prevent this. Because here since this is
    /// an async fucntion there is a chance that the widget might be disposed
    /// off by the time we call setState() hence we need to make sure if it is
    /// still mounted or not.

    // https://www.dhiwise.com/post/unveiling-the-flutter-widget-lifecycle

    /// In Flutter, mounted is a property of the State class that indicates
    /// whether the State object is currently in the widget tree. It's important
    ///  to check if a widget is mounted before calling setState() to avoid
    /// updating a state that is no longer active or part of the widget tree.
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
      appBar: DefaultAppBar(),
      body: Stack(
        children: [
          _renderBody(context, location),
          _renderFooter(context, location),
        ],
      ),
    );
  }

//   // To define a private function in a flutter app jsu_renderBody(context, location) prepend the function
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
  Widget _renderBody(BuildContext context, Location location) {
    List<Widget> result = [];
    result.add(BannerImage(url: location.url, height: BannerImageHeight));
    result.add(_renderHeader());
    result.addAll(_renderFacts(context, location));
    result.add(_renderBottomSpacer());
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: result,
      ),
    );
  }

  Widget _renderHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: BodyVerticalPadding,
        horizontal: Styles.horizontalPaddingDefault,
      ),
      child: LocationTile(
        location: this.location,
        darkTheme: false,
      ),
    );
  }

  Widget _renderFooter(BuildContext context, Location location) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: const Alignment(0.0, 0.0),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
          height: FooterHeight,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            child: _renderBookButton(),
          ),
        )
      ],
    );
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

  Widget _renderBookButton() {
    return TextButton(
      onPressed: () => _handleBookPress(),
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all<Size>(Size.fromWidth(200.0)),
        backgroundColor: WidgetStateProperty.all<Color>(Colors.red.shade400),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      ),
      child: Text('Book'.toUpperCase(), style: Styles.textCTAButton),
    );
  }

  void _handleBookPress() async {
    final url = Uri.parse('mailto:rxzhik@gmail.com?subject=inquiry');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Could not launch $url');
    }
  }

  Widget _renderBottomSpacer() {
    return Container(
      height: FooterHeight,
    );
  }

  // Widget _bannerImage(String url, double height) {
  //   Image? image; // by default its null
  //   // we gotta do this here cuz, as in Location.blank() url is initialized with
  //   // '', hence if we try to load an image using blank url it could crash. But
  //   // on this condition if we keep the image null, the widget can still render
  //   // null gracefully.
  //   try {
  //     if (url.isNotEmpty) {
  //       image = Image.network(url, fit: BoxFit.fitWidth);
  //     }
  //   } catch (e) {
  //     print("IMAGE LOADING ERROR: could not load image $url");
  //   }

  //   return Container(
  //     // Here we are using a named constructor from the Image class, just as we
  //     // learnt earlier.
  //     constraints: BoxConstraints.tightFor(
  //       height: height,
  //     ),
  //     child: image,
  //   );
  // }
}
