import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class MyGoeLocation extends StatefulWidget {
  const MyGoeLocation({Key? key}) : super(key: key);

  @override
  _MyGoeLocationState createState() => _MyGoeLocationState();
}

class _MyGoeLocationState extends State<MyGoeLocation> {
  String location = "Null, press bottom";
  String address = "search";


  Future<Position> _getGeoLoacationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print("serviceEnabled $serviceEnabled");

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error("Location Services is Disable");
    }

    print("After Location setting $serviceEnabled");
    permission = await Geolocator.checkPermission();
    print(permission.index.toString());
    if (permission == LocationPermission.denied) {
      return Future.error("Location Services is denied");
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              location,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                Position position = await _getGeoLoacationPosition();
                location =
                    'Lat: ${position.latitude} , Long: ${position.longitude}';
              },
              child: Text("Get Location"),
            ),
          ],
        ),
      ),
    );
  }
}
