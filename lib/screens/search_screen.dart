import 'package:flutter/material.dart';
import 'package:service_directory/components/select_location.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text(
              "Search Location",
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                SelectLocation(),
              ],
            ),
          )),
    );
  }
}
