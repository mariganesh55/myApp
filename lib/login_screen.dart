import 'package:flutter/material.dart';
import 'package:myapp/list_view_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
        actions: [
          TextButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => ListviewScreen(),
                //     ));

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListviewScreen(),
                    ));

                //Navigator.pushNamed(context, '/list_view_screen');
              },
              child: const Text(
                "Next",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ))
        ],
      ),
      body: Container(
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.people,
                    size: 50,
                    color: Colors.green,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "FARMERCE",
                      style: TextStyle(
                          //color: Color(0xff5AC537),
                          // color: Color.fromRGBO(90, 197, 55, 1),
                          color: Colors.green,
                          decoration: TextDecoration.none),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (input) {
                    if (RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(input!)) {
                      return null;
                    } else {
                      return "Check your email address";
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                  obscureText: false,
                  maxLength: 8,
                ),
              ),
              Visibility(
                visible: true,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Visibility(
                  visible: true,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Visibility(
                  visible: true,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Visibility(
                  visible: true,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Container(
              //     width: 100,
              //     height: 100,
              //     color: Colors.red,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
