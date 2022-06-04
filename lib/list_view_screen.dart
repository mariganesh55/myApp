import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/grid_view_screen.dart';

class ListviewScreen extends StatefulWidget {
  ListviewScreen({Key? key}) : super(key: key);

  @override
  State<ListviewScreen> createState() => _ListviewScreenState();
}

class _ListviewScreenState extends State<ListviewScreen> {
  List<String> saplings = [
    "Potato",
    "Onion",
    "Tomoto",
    "Brinjal",
    "Apple",
    "Orange",
    "Papaya",
    "Grapes"
  ];

  List<String> amountList = [
    "2500",
    "1000",
    "500",
    "300",
    "400",
    "760",
    "800",
    "555"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Listview Screen"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GridViewScreen(),
                      ));
                },
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ))
          ],
        ),
        body: ListView.builder(
          itemCount: saplings.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            child: Text(
                              saplings[index] + "janskdjnsajkndjasndjksan",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                        Text(amountList[index])
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.red,
                  ),
                )
              ],
            );
          },
        ));
  }
}
