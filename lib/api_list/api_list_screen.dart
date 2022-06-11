import 'package:flutter/material.dart';
import 'package:myapp/api_list/api_list_controller.dart';
import 'package:myapp/model/list_of_spacecraft/spacecraft.dart';

class ApiListScreen extends StatefulWidget {
  ApiListScreen({Key? key}) : super(key: key);

  @override
  State<ApiListScreen> createState() => _ApiListScreenState();
}

class _ApiListScreenState extends State<ApiListScreen> {
  List<Spacecraft> craftList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("API integration")),
        body: FutureBuilder(
          future: ApiListController.fetchScraftList(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              craftList = snapshot.data as List<Spacecraft>;
            }

            return ListView.builder(
              itemCount: craftList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(craftList[index].id.toString()),
                  subtitle: Text(craftList[index].name.toString()),
                );
              },
            );
          },
        ));
  }
}
