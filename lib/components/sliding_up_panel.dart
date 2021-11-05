import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MySlideUp extends StatelessWidget {
  const MySlideUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SlidingUpPanel(
        // panelBuilder: (scrollController) => _buildBuildSlidingPanel(),
        body: Container(

        ),
      ),
    );
  }
}
