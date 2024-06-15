import "package:flutter/material.dart";
import "package:test_drive/location_detail.dart";
import "package:test_drive/models/location.dart";
import "styles.dart";

class LocationList extends StatelessWidget {
  final List<Location> locations;
  LocationList(this.locations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // To display any text in futter we use the Text widget.
        title: Text("Locations", style: Styles.headerLarge),
        backgroundColor: Colors.grey[600],
      ),
      body: ListView.builder(
        // This is for when you know the count already of the list.
        itemCount: this.locations.length,
        itemBuilder: _listViewItemBuilder,
      ),
    );
  }

  // IMP NOTE: always remember to make your code look simple, hence break it
  // down into helper methods like we have done here, first create the application
  // normally in monolithic style and then break it down into helper methods
  // and make sure to give the detail names to these helper methods.

  Widget _listViewItemBuilder(BuildContext context, int index) {
    {
      var location = this.locations[index];
      return ListTile(
        contentPadding: EdgeInsets.all(10.0),
        leading: _itemThumbnail(location),
        title: _itemTitle(location),
        // there should be no parameters and void return type
        // Here technically the onTap function is a closure as we are
        // accessing the locations variable. Have a look!
        onTap: () => _navigateToLocationDetail(context, location),
      );
    }
  }

  void _navigateToLocationDetail(BuildContext context, Location location) {
    Navigator.push(
      context,
      MaterialPageRoute(
        // Here builder is used to build that route
        builder: (context) => LocationDetail(location),
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
}
