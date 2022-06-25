import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils/authentication_service.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        AuthenticationService(FirebaseAuth.instance)
                            .signUp(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim())
                            .then((value) {
                          if (value == "Signed up") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(value ?? ''),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(value ?? ''),
                              backgroundColor: Colors.red,
                            ));
                          }
                        });
                      },
                      child: const Text("Register")),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AuthenticationService(FirebaseAuth.instance)
                          .signIn(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim())
                          .then((value) {
                        if (value == "Signed in") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(value ?? ''),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pushNamed(context, '/cart_home_screen');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(value ?? ''),
                            backgroundColor: Colors.red,
                          ));
                        }
                      });
                    },
                    child: const Text("Sign in"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
