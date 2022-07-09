import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  var color = Colors.blue;
  var height = 100.0;
  var width = 100.0;

  bool firstStateEnabled = true;

  var myOpacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 1),
                color: color,
                height: height,
                width: width,
              ),
              ElevatedButton(
                onPressed: () {
                  color = Colors.green;
                  height = 300;
                  width = 300;
                  setState(() {});
                },
                child: Text(
                  "Animate!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              AnimatedCrossFade(
                firstChild: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
                  height: 200.0,
                  width: 200.0,
                ),
                secondChild: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlutterLogo(),
                  ),
                  height: 200.0,
                  width: 200.0,
                ),
                crossFadeState: firstStateEnabled
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 1500),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ElevatedButton(
                  onPressed: () {
                    firstStateEnabled = false;
                    setState(() {});
                  },
                  child: Text(
                    "Trigger crossfade",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedOpacity(
                  child: FlutterLogo(
                    size: 100.0,
                  ),
                  opacity: myOpacity,
                  duration: Duration(seconds: 1),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  myOpacity = 0.0;
                  setState(() {});
                },
                child: Text(
                  "Click here to change opacity",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
