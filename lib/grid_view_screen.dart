import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/tab_bar_screen.dart';

class GridViewScreen extends StatefulWidget {
  GridViewScreen({Key? key}) : super(key: key);

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Grid View Screen"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TabBarScreen(),
                      ));
                },
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ))
          ],
        ),
        body: GridView.builder(
            itemCount: 100,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              return Container(
                width: 30,
                height: 30,
                color: Colors.red,
              );
            }));
  }
}
