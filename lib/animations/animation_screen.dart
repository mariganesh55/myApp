import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/animations/AnimatedContainerDemo.dart';
import 'package:myapp/animations/HeroAnimationDemo.dart';

class AnimationScreen extends StatefulWidget {
  AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HeroAnimationDemo(),
                      ));
                },
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ))
          ],
        ),
        body: AnimatedContainerDemo());
  }
}
