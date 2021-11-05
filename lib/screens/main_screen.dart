import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_directory/components/category_row.dart';
import 'package:service_directory/components/select_location.dart';
import 'package:service_directory/components/slide_drawer.dart';
import 'package:service_directory/components/top_services.dart';
import 'package:service_directory/screens/search_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  final bool _account = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SearchScreen()));
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                // SelectLocation(),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.redAccent,
                  child: Image.asset(
                    "assets/images/kmm.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10.0,),
                CategoryRow(),
                SizedBox(height: 10.0,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10.0),
                      width: double.infinity,
                      child: Text(
                        "Top Services",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    TopServices(),
                  ],
                ),
              ],
            ),
          ),
        ),
        drawer:
            _account ? SlideDrawer(account: true) : SlideDrawer(account: false),
      ),
    );
  }
}


