import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:service_directory/components/field_input.dart';
import 'package:service_directory/modules/town.dart';
import 'package:service_directory/services/database_services.dart';

class AddingServices extends StatefulWidget {
  const AddingServices({Key? key}) : super(key: key);

  @override
  _AddingServicesState createState() => _AddingServicesState();
}

class _AddingServicesState extends State<AddingServices> {
  TextEditingController _serviceName = TextEditingController();
  TextEditingController _serviceAddress = TextEditingController();
  TextEditingController _servicePhone = TextEditingController();
  TextEditingController _serviceDescription = TextEditingController();
  TextEditingController _serviceLat = TextEditingController();
  TextEditingController _serviceLong = TextEditingController();
  TextEditingController _serviceCategory = TextEditingController();

  bool _chose = false;
  late List<Town> towns = [];
  late List<Town> state = [];

  late List<String> stateList = [];
  late List<String> townList = [];

  late String _state;
  late String _town;

  bool resetState = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getState();
  }

  getState() async {
    state = await DatabaseHelper().getStates();
    stateList = state.map((e) => e.state).toList();
    setState(() {});
  }

  getTowns(String state) async {
    towns = await DatabaseHelper().getTownByState(state);
    townList = towns.map((e) => e.township).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Adding Services"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                  child: DropdownSearch(
                    dropdownSearchDecoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                      ),
                      prefixIcon: Icon(Icons.account_balance_outlined),
                      hintText: "တိုင်း / ပြည်နယ်",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    popupElevation: 10,
                    popupTitle: Text(
                      "ရှာမည်",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    showSearchBox: true,
                    mode: Mode.DIALOG,
                    autoValidateMode: AutovalidateMode.disabled,
                    popupBackgroundColor: Colors.blue[100],
                    items: stateList,
                    // state list in drop down menu
                    onChanged: (value) {
                      setState(() {
                        _chose = true;
                        resetState = !resetState;
                        print(value);
                        _state = value.toString();
                        getTowns(value.toString().trim());
                        _town = "";
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                if (_chose)
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: DropdownSearch(
                      dropdownSearchDecoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.blueAccent,
                          ),
                        ),
                        prefixIcon:
                            Icon(Icons.local_convenience_store_outlined),
                        hintText: "မြို့နယ်",
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      popupElevation: 10,
                      popupTitle: Text(
                        "ရှာမည်",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      showSearchBox: true,
                      selectedItem: resetState ? "" : "ရှာမည်",
                      showSelectedItems: true,
                      mode: Mode.DIALOG,
                      autoValidateMode: AutovalidateMode.disabled,
                      popupBackgroundColor: Colors.blue[100],
                      //adding to township to search bar
                      items: townList,
                      onChanged: (value) {
                        print(value);
                        _town = value.toString();
                      },
                    ),
                  ),
                SizedBox(
                  height: 15,
                ),
                if (_chose)
                  Column(
                    children: [
                      Field(
                        controller: _serviceCategory,
                        icon: Icons.account_box,
                        hintText: "Category",
                        size: size,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Field(
                        controller: _serviceName,
                        icon: Icons.person,
                        hintText: "Name",
                        size: size,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Field(
                        controller: _serviceAddress,
                        icon: Icons.add_business,
                        hintText: "Address",
                        size: size,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Field(
                        controller: _servicePhone,
                        icon: Icons.call,
                        hintText: "Phone",
                        size: size,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Field(
                        controller: _serviceDescription,
                        icon: Icons.menu,
                        hintText: "Description",
                        size: size,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Field(
                        controller: _serviceLat,
                        icon: Icons.location_on,
                        hintText: "Latitude",
                        size: size,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Field(
                        controller: _serviceLong,
                        icon: Icons.location_on,
                        hintText: "Longitude",
                        size: size,
                      ),
                    ],
                  ),

                // Container(
                //   child: Padding(
                //     padding:
                //         EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                //     child: InkWell(
                //       onTap: () {
                //         if (_state.isNotEmpty && _town != "") {
                //           // adding firebase services
                //
                //         } else {
                //           _showToast(context);
                //         }
                //       },
                //       child: Container(
                //         width: size.width / 1.1,
                //         height: 50,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(10.0),
                //           ),
                //           color: Colors.green,
                //         ),
                //         child: Center(
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                //             children: [
                //               // Text(
                //               //   "Add",
                //               //   style: TextStyle(
                //               //     fontSize: 20,
                //               //     color: Colors.white,
                //               //     fontWeight: FontWeight.w500,
                //               //   ),
                //               // ),
                //               Icon(Icons.add_circle,color: Colors.white,size: 40,),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if (_state.isNotEmpty && _town != "") {
            // adding firebase services

          } else {
            _showToast(context);
          }
        },
        child: Icon(Icons.add,color: Colors.white,size: 40,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Select State and Region'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
