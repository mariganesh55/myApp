import 'package:flutter/material.dart';
import 'package:myapp/login_screen.dart';

import 'list_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => LoginScreen(),

        '/list_view_screen': (context) => ListviewScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Container(
        color: Colors.red,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.green,
                    Color.fromARGB(255, 77, 103, 78)
                  ])),
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 80.0),
                      child: Text(
                        "Skip",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.green,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.yellow,
                    ),
                    TextButton(
                        onPressed: () {
                          // on press action code

                          // navigation code

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => LoginScreen(),
                          //     ));

                          // Named route

                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => ListviewScreen(),
                          //     ));

                          // Navigator.pushNamed(context, "/login");
                        },
                        child: const Text(
                          "Go to login screen",
                          style: TextStyle(fontSize: 25),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListviewScreen(),
                              ));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => LoginScreen(),
                          //     ));
                        },
                        child: const Text("Go to login"),
                        style: ElevatedButton.styleFrom(primary: Colors.orange))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
