import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_directory/components/map_view_design.dart';
import 'package:service_directory/modules/service_models.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlideUpPanel extends StatefulWidget {
  const SlideUpPanel({Key? key, required this.serviceModels}) : super(key: key);

  final ServiceModels serviceModels;

  @override
  _SlideUpPanelState createState() => _SlideUpPanelState();
}

class _SlideUpPanelState extends State<SlideUpPanel> {
  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Detail Pages"),
          centerTitle: true,
        ),
        body: SlidingUpPanel(
          // padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          maxHeight: 600.0,
          minHeight: 30,
          color: Colors.blueGrey,
          collapsed: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: radius,
            ),
            child: Center(
                child: Icon(
              Icons.drag_handle_sharp,
              color: Colors.white,
              size: 20,
            )),
          ),
          panel: Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: radius,
                  ),
                  child: Center(
                      child: Icon(
                    Icons.drag_handle_sharp,
                    color: Colors.white,
                    size: 30,
                  )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: MapViewDesign(
                    serviceModels: widget.serviceModels,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        child: Text("Call Us"),
                        color: Colors.teal,
                        splashColor: Colors.white38,
                        minWidth: 150,
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Text("Message"),
                        color: Colors.teal,
                        splashColor: Colors.white38,
                        minWidth: 150,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            child: Hero(
                              tag: widget.serviceModels.img,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                child: Image.asset(
                                  widget.serviceModels.img,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.serviceModels.name,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                const SizedBox(height: 20.0,),
                                Row(
                                  children: [
                                    Icon(Icons.add_business_outlined,size: 30,color: Colors.cyan,),
                                    SizedBox(width: 10,),
                                    Text(
                                      widget.serviceModels.serviceName,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.description,size: 30,color: Colors.cyan,),
                                    SizedBox(width: 10,),
                                    Flexible(
                                      child: Text(
                                        widget.serviceModels.description,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.location_on,size: 30,color: Colors.cyan,),
                                    SizedBox(width: 10,),
                                    Flexible(
                                      child: Text(
                                        widget.serviceModels.address,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.phone,size: 30,color: Colors.cyan,),
                                    SizedBox(width: 10,),
                                    Flexible(
                                      child: Text(
                                        widget.serviceModels.phoneNo,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.description,size: 30,color: Colors.cyan,),
                                    SizedBox(width: 10,),
                                    Flexible(
                                      child: Text(
                                        widget.serviceModels.description,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 150,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
