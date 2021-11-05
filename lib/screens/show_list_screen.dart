import 'package:flutter/material.dart';

class ShowListScreen extends StatelessWidget {
  const ShowListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Services Directories"),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.blueGrey,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              icon: Icon(
                Icons.search,
                size: 25,
              ),
              onPressed: () {

              },
            ),
          ),
        ],
      ),
      body: ListView(),
    ),);
  }
}
