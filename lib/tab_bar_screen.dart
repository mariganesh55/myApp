import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/grid_view_screen.dart';

import 'form_screen.dart';

class TabBarScreen extends StatefulWidget {
  TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  bool isCheckBoxChecked = false;

  int selectedValue = 0;

  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab Bar Screen"),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/api_list_screen");
                },
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )
          ],
          // bottom: TabBar(
          //     tabs: [Icon(Icons.home), Icon(Icons.add), Icon(Icons.phone)]),
        ),
        bottomNavigationBar: TabBar(tabs: [
          Text(
            "Home",
            style: TextStyle(color: Colors.red),
          ),
          Icon(
            Icons.add,
            size: 60,
            color: Colors.red,
          ),
          Icon(
            Icons.phone,
            size: 60,
            color: Colors.red,
          )
        ]),
        body: TabBarView(children: [
          FormScreen(),
          GridViewScreen(),
          Container(
            color: Colors.amber,
            child: Column(
              children: [
                CheckboxListTile(
                  value: isCheckBoxChecked,
                  onChanged: (value) {
                    setState(() {
                      isCheckBoxChecked = value ?? false;
                    });
                  },
                  title: Text(
                    "Accept Terms and condition",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                RadioListTile(
                  value: selectedValue,
                  groupValue: 1,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = 1;
                    });
                  },
                  title: Text("Metro City"),
                ),
                RadioListTile(
                  value: selectedValue,
                  groupValue: 2,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = 2;
                    });
                  },
                  title: Text("Non-Metro City"),
                ),
                RadioListTile(
                  value: selectedValue,
                  groupValue: 3,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = 3;
                    });
                  },
                  title: Text("village"),
                ),
                RadioListTile(
                  value: selectedValue,
                  groupValue: 4,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = 4;
                    });
                  },
                  title: Text("Town"),
                ),
                Slider(
                  value: sliderValue,
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                  min: 0,
                  max: 100,
                ),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                height: 100,
                                color: Colors.green,
                                child: Column(
                                  children: [
                                    Text("Logout"),
                                    TextButton(
                                        onPressed: () {
                                          //dialog dismiss
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.white),
                                        ))
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Text("Show Dialog")),
                if (isCheckBoxChecked)
                  ElevatedButton(
                      onPressed: () {
                        if (isCheckBoxChecked) {
                          // yesy function
                        } else {
                          //no function
                        }

                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => LoginScreen(),
                        //     ),
                        //     (route) => false);

                        Navigator.pushNamedAndRemoveUntil(
                            context, "/login", (Route<dynamic> route) => false);

                        // Navigator.popUntil(
                        //     context, ModalRoute.withName('/login'));

                        // Navigator.pushReplacementNamed(context, "/login");
                        // Navigator.pop(context);
                      },
                      child: Text("Logout"))
                else
                  Container()
              ],
            ),
          )
        ]),
      ),
    );
  }
}
