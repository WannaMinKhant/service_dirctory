// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_mapbox_navigation/library.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:service_directory/components/map_view_design.dart';
//
//
// class MapBoxMapStatus extends StatefulWidget {
//   const MapBoxMapStatus({Key? key}) : super(key: key);
//
//   @override
//   _MapBoxMapStatusState createState() => _MapBoxMapStatusState();
// }
//
// class _MapBoxMapStatusState extends State<MapBoxMapStatus> {
//
//   late MapBoxNavigation _direction;
//   late bool _arrived;
//   late String _instruction;
//   late bool _routeBuilt;
//   late bool _isNavigating;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _direction = MapBoxNavigation(onRouteEvent: _onRouteEvent);
//   }
//
//   MapBoxOptions _options = MapBoxOptions(
//       initialLatitude: 36.1175275,
//       initialLongitude: -115.1839524,
//       zoom: 13.0,
//       tilt: 0.0,
//       bearing: 0.0,
//       enableRefresh: false,
//       alternatives: true,
//       voiceInstructionsEnabled: true,
//       bannerInstructionsEnabled: true,
//       allowsUTurnAtWayPoints: true,
//       mode: MapBoxNavigationMode.drivingWithTraffic,
//       mapStyleUrlDay: "https://url_to_day_style",
//       mapStyleUrlNight: "https://url_to_night_style",
//       units: VoiceUnits.imperial,
//       simulateRoute: true,
//       language: "en");
//
//   Future<void> _onRouteEvent(e) async{
//     var _distanceRemaining = await _direction.distanceRemaining;
//     var _durationRemaining = await _direction.durationRemaining;
//
//     switch(e.evetType){
//       case MapBoxEvent.progress_change:
//         var progressEvent = e.data as RouteProgressEvent;
//            _arrived = progressEvent.arrived!;
//         if (progressEvent.currentStepInstruction != null)
//            _instruction = progressEvent.currentStepInstruction!;
//         break;
//       case MapBoxEvent.route_building:
//       case MapBoxEvent.route_built:
//         _routeBuilt = true;
//         break;
//       case MapBoxEvent.route_build_failed:
//         _routeBuilt = false;
//         break;
//       case MapBoxEvent.navigation_running:
//         _isNavigating = true;
//         break;
//       case MapBoxEvent.on_arrival:
//         _arrived = true;
//         if (!_isMultipleStop) {
//           await Future.delayed(Duration(seconds: 3));
//           await _controller.finishNavigation();
//         } else {}
//         break;
//       case MapBoxEvent.navigation_finished:
//       case MapBoxEvent.navigation_cancelled:
//         _routeBuilt = false;
//         _isNavigating = false;
//         break;
//       default:
//         break;
//     }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter MapBox"),
//         centerTitle: true,
//       ),
//       // body: MapViewDesign(),
//       body: Container(
//         child: MapBoxNavigationView(
//
//         ),
//       ),
//     );
//   }
// }
//
//
