import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:service_directory/modules/service_models.dart';

class MapViewDesign extends StatefulWidget {
  MapViewDesign({
    Key? key,
    required this.serviceModels,
  }) : super(key: key);

  final ServiceModels serviceModels;

  @override
  State<MapViewDesign> createState() => _MapViewDesignState();
}

class _MapViewDesignState extends State<MapViewDesign> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.all(Radius.circular(30.0),),
      ),
      child: ClipRRect(
        // borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),topLeft: Radius.circular(30.0),),
        // clipBehavior: Clip.hardEdge,
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(
              widget.serviceModels.lat,
              widget.serviceModels.lon,
            ),
            zoom: 15.0,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/fruitysense/ckv5inxun6ocy15mvbmzml53p/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZnJ1aXR5c2Vuc2UiLCJhIjoiY2t2NWhyNnNzMm45MjJ1cXdkdnRzMjljciJ9.hapoex1xnmwB2fKo3JH_Mg",
                additionalOptions: {
                  'assessToken':
                      'pk.eyJ1IjoiZnJ1aXR5c2Vuc2UiLCJhIjoiY2t2NWhyNnNzMm45MjJ1cXdkdnRzMjljciJ9.hapoex1xnmwB2fKo3JH_Mg',
                }),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 50.0,
                  height: 50.0,
                  point: LatLng(
                    widget.serviceModels.lat,
                    widget.serviceModels.lon,
                  ),
                  builder: (BuildContext context) {
                    return Container(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.location_on),
                        iconSize: 20.0,
                        color: Colors.green[400],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
