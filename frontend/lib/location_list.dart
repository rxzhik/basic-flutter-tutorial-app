import "dart:async";

import "package:flutter/material.dart";
import "package:test_drive/location_detail.dart";
import "package:test_drive/models/location.dart";
import "styles.dart";

// I mean have a look at gpt, its prety much same as react, but in a crude and
// different format.
class LocationList extends StatefulWidget {
  // We'll need to override the special method called create state.
  // This creates an instance of the state of the widget.
  @override
  createState() => _LocationListState();
}

// It has an underscore because this class won't be available anywhere outside
// the file.
// So basically for the stateful widget, when the state is loaded it calls
// the createState() method to create the state of the widget, when the state
// object is first instantiated using the constructor in the statefulWidget
// class we initialize the attributes of this then the lifecycle method initState()
// is called, after which the build method is called to create the widget tree(UI)
// FOR THE STATEFULWIDGET, so everything done here is for the statefulWidget.
class _LocationListState extends State<LocationList> {
  List<Location> locations = [];
  bool loading = false;
  // We remove the constructor, we don't need it anymore.

  // We'd like to invoke the loadData function when the widget instantiates,
  // there is a special method for that.
  /// It is a lifecycle method called when a state object is first created.
  /// This is typically where you initialize data, set up listeners, or start
  /// initial asynchronous operations.
  /// It is used to perform any initialization logic for the state object.
  /// This includes setting up any state variables or starting any necessary
  /// services or network requests.
  ///  It is only called once during the lifecycle of the state object
  @override
  void initState() {
    /// We use the Superclass here called State from which we extends.
    /// This call to the superclass's initState method is crucial because
    /// it ensures that any initialization logic in the State class is also
    /// executed. The State class might perform some essential setup that your
    /// subclass relies on.

    super.initState();
    loadData();
  }

  // So in dart if you don't give the return type it returns dynamic.
  // To load data
  Future<void> loadData() async {
    // Since we need to trigger a rebuild we'll have to use the setState() method.
    if (this.mounted) {
      setState(() => this.loading = true);
      // To see its effect you need to manually stop the app and start it over
      // again as otherwise it'll just use the cache data.
      Timer(Duration(milliseconds: 5000), () async {
        final locations = await Location.fetchAll();
        setState(() {
          this.locations = locations;
          this.loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // To display any text in futter we use the Text widget.
        title: Text("Locations", style: Styles.headerLarge),
        backgroundColor: Colors.grey[600],
      ),
      body: RefreshIndicator(
        onRefresh: loadData,
        child: Column(
          children: [
            renderProgressbar(context),
            Expanded(
              child: renderListView(context),
            ),
          ],
        ),
      ),
    );
  }

  // IMP NOTE: always remember to make your code look simple, hence break it
  // down into helper methods like we have done here, first create the application
  // normally in monolithic style and then break it down into helper methods
  // and make sure to give the detail names to these helper methods.

  Widget _listViewItemBuilder(BuildContext context, int index) {
    {
      final location = this.locations[index];
      return ListTile(
        contentPadding: EdgeInsets.all(10.0),
        leading: _itemThumbnail(location),
        title: _itemTitle(location),
        // there should be no parameters and void return type
        // Here technically the onTap function is a closure as we are
        // accessing the locations variable. Have a look!
        onTap: () => _navigateToLocationDetail(context, location.id),
      );
    }
  }

  void _navigateToLocationDetail(BuildContext context, int locationID) {
    Navigator.push(
      context,
      MaterialPageRoute(
        // Here builder is used to build that route
        builder: (context) => LocationDetail(locationID),
      ),
    );
  }

  Widget _itemThumbnail(Location location) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 100.0),
      child: Image.network(location.url, fit: BoxFit.fitWidth),
    );
  }

  Widget _itemTitle(Location location) {
    // Here we have usd string interpolation i.e we have put variables inside
    // the string. If we are not using the . notation we coudld've done this
    //  '$location' straight up.
    return Text(
      '${location.name}',
      style: Styles.textDefault,
    );
  }

  Widget renderProgressbar(BuildContext context) {
    return (this.loading
        ? LinearProgressIndicator(
            value: null,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
          )
        : Container());
  }

  Widget renderListView(BuildContext context) {
    return ListView.builder(
      // This is for when you know the count already of the list.
      itemCount: this.locations.length,
      itemBuilder: _listViewItemBuilder,
    );
  }
}
