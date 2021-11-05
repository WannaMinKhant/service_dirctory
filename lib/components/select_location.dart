import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:service_directory/modules/town.dart';
import 'package:service_directory/screens/show_list_screen.dart';
import 'package:service_directory/services/database_services.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({
    Key? key,
  }) : super(key: key);

  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  bool _chose = false;
  late List<Town> towns = [];
  late List<Town> state = [];

  late List<String> stateList = [];
  late List<String> townList = [];

  late String _state;
  late String _town;

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

  getTowns(String state) async{
    towns = await DatabaseHelper().getTownByState(state);
    townList = towns.map((e) => e.township).toList();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                items: stateList, // state list in drop down menu
                onChanged: (value) {
                  setState(() {
                    _chose = true;
                    print(value);
                    _state = value.toString();
                    getTowns(value.toString().trim());
                    _town ="";
                  });

                },
              ),
            ),
            SizedBox(
              height: 5,
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
                    prefixIcon: Icon(Icons.local_convenience_store_outlined),
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
                  // selectedItem: _resetState ? "" : "ရှာမည်",
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
              height: 5,
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
                    prefixIcon: Icon(Icons.local_laundry_service),
                    hintText: "ဝန်ဆောင်မှု",
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
                  items: [
                    'ဖုန်းဆားဗစ်',
                    'အဲယားကွန်း ဆားဗစ်',
                    'ကွန်ပျူတာ ဆားဗစ်',
                    'ကား ဝပ်ရှော့',
                  ],
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.pop(context);
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          color: Colors.redAccent,
                        ),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if(_state.isNotEmpty && _town != ""){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ShowListScreen()));
                        }else{
                          _showToast(context);
                        }
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Text(
                            "OK",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Select State and Region'),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
