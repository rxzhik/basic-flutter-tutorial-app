import "package:flutter/material.dart";

class LocationDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // To display any text in futter we use the Text widget.
        title: Text("Hello, Kawish!"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Since ALL THESE functions are pretty repetitive we'll create a
          // function to write these instead
          _section("One !", Colors.red),
          _section("Two !", Colors.blue),
          _section("Three !", Colors.green),
        ],
      ),
    );
  }

  // To define a private function in a flutter app jsut prepend the function
  // with an underscore like this: _section, so if the method is not going
  // to be used outside the class this is the best practice.
  Widget _section(String title, Color color) {
    return Container(
      //Here we are basically passing parameters to the constructors
      decoration: BoxDecoration(
        color: color,
      ),
      child: Text(title),
    );
  }
}
