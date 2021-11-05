import 'package:flutter/material.dart';
import 'package:service_directory/screens/mapbox_map.dart';
import 'package:service_directory/screens/my_geolocation.dart';
import 'package:service_directory/screens/realtime_locatoin.dart';

class SlideDrawer extends StatelessWidget {
  const SlideDrawer({
    Key? key,
    required bool account,
  }) : _account = account, super(key: key);

  final bool _account;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Username"),
            currentAccountPicture: CircleAvatar(
              radius: 20,
              child: Image.asset("assets/images/profile.png"),
            ), accountEmail: Text("admin@polarstar.com"),
          ),
          if(_account)
            ListTile(
              title: Text("Register"),
              leading: Icon(Icons.assignment_ind),
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> EditProfile()));
              },
            ),
          if(_account)
          Divider(height: 5,thickness: 2,),
          ListTile(
            title: Text("Dashboard"),
            leading: Icon(Icons.airplay_sharp),
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> EditProfile()));
            },
          ),
          Divider(height: 5,thickness: 2,),
          ListTile(
            title: Text("My Favorite"),
            leading: Icon(Icons.favorite_border_outlined),
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> EditProfile()));
            },
          ),
          Divider(height: 5,thickness: 2,),
          ListTile(
            title: Text("My Location"),
            leading: Icon(Icons.book),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> MyGoeLocation()));
            },
          ),
          Divider(height: 5,thickness: 2,),
          ListTile(
            title: Text("Help"),
            leading: Icon(Icons.view_list_outlined),
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> MapBoxMapStatus()));
            },
          ),
          Divider(height: 5,thickness: 2,),
          if(_account)
            ListTile(
              title: Text("LogOut"),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                 // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> EditProfile()));
              },
            ),
          if(_account)
          Divider(height: 5,thickness: 2,),
        ],
      ),
    );
  }
}
