import 'package:flutter/material.dart';

class SlideContainer extends StatefulWidget {
  @override
  _SlideContainerState createState() => _SlideContainerState();
}

class _SlideContainerState extends State<SlideContainer> {
  double containerWidth = 300.0;
  bool showNewContainer = false;

  void toggleContainer() {
    setState(() {
      showNewContainer = !showNewContainer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slide Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: showNewContainer ? 0 : containerWidth,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: showNewContainer
                ? Text(
                    "New",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleContainer,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
