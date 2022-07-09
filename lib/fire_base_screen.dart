import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseDemoScreen extends StatefulWidget {
  @override
  State<FirebaseDemoScreen> createState() => _FirebaseDemoScreenState();
}

class _FirebaseDemoScreenState extends State<FirebaseDemoScreen> {
  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    //getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Connect'),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton(
            child: Text('Create Record'),
            onPressed: () {
              createRecord();
            },
          ),
          ElevatedButton(
            child: Text('View Record'),
            onPressed: () {
              getData();
            },
          ),
          ElevatedButton(
            child: Text('Update Record'),
            onPressed: () {
              updateData();
            },
          ),
          ElevatedButton(
            child: Text('Delete Record'),
            onPressed: () {
              deleteData();
            },
          ),
        ],
      )), //center
    );
  }

  void createRecord() {
    databaseReference
        .child("1")
        .set({'name': 'Ganesh', 'age': 26, 'country': "india"});
    databaseReference.child("2").set({
      'title': 'Flutter in Action',
      'description': 'Complete Programming Guide to learn Flutter'
    });
  }

  void getData() {
    databaseReference.once().then((var snapshotqqqq) {
      print('Data : ${snapshotqqqq.snapshot.value}');
    });
  }

  void updateData() {
    databaseReference.child('1').update({'name': 'Mariganesh'});
  }

  void deleteData() {
    databaseReference.child('1').remove();
  }
}
