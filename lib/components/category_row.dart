import 'package:flutter/material.dart';
import 'package:service_directory/modules/category_model.dart';
import 'package:service_directory/screens/details_screen.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Container(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (BuildContext context) => SlideUpPanel()));
                },
                child: Column(
                  children: [
                    ClipOval(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        backgroundImage: AssetImage(categories[index].img),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      //color: Colors.green,
                      width: 80,
                      child: Text(
                        categories[index].name,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
