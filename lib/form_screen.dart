import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter first Name";
                  }
                  return "";
                },
                decoration: InputDecoration(hintText: "First Name"),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Last Name";
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Last Name"),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Email";
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Email"),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Phone Number"),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Address"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                    onPressed: () {
                      bool isFormValid = (formKey.currentState!.validate());

                      if (isFormValid) {
                        // actions for submit

                      } else {
                        // error toast message
                      }
                    },
                    child: Text("Submit")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
