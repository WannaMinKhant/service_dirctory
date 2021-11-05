import 'package:flutter/material.dart';
import 'package:location/location.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({Key? key}) : super(key: key);

  @override
  _MyLocationState createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {

  late final LocationData _currentPosition;
  late String _address,_dateTime;
  Location location = Location();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Container(
            color: Colors.blueGrey.withOpacity(0.8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _currentPosition.latitude == null ? _currentPosition.latitude.toString() : "0.0",
                ),
                SizedBox(height: 30,),
                Text(
                  _currentPosition.longitude == null ? _currentPosition.longitude.toString() : "0.0",
                ),
                SizedBox(height: 30,),
                Text(
                  _currentPosition.accuracy == null ? _currentPosition.accuracy.toString() : "0.0",
                ),
                SizedBox(height: 30,),
                Text(
                  _currentPosition.altitude == null ? _currentPosition.altitude.toString() : "0.0",
                ),
                SizedBox(height: 30,),
                Text(
                  _currentPosition.heading == null ? _currentPosition.heading.toString() : "0.0",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getLoc() async{
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if(!_serviceEnabled){
      _serviceEnabled = await location.requestService();
      if(!_serviceEnabled)
        return;
    }

    _permissionGranted = await location.hasPermission();
    if(_permissionGranted == PermissionStatus.denied){
      _permissionGranted = await location.requestPermission();
      if(_permissionGranted != PermissionStatus.granted)
        return;
    }
    _currentPosition = await location.getLocation();
    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _currentPosition = currentLocation;
        print(_currentPosition.longitude);
      });
    });
  }
}
