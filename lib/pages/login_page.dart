import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intro/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool change_button = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    // if (_formKey.currentState.validate()) {
    setState(() {
      change_button = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.home_page);
    setState(() {
      change_button = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(children: [
              Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
              //for space
              const SizedBox(
                height: 20,
              ),

              // for text
              Text(
                "WELCOME $name",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              //for space
              const SizedBox(
                height: 10.0,
              ),

              //username and password column
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter Username",
                          labelText: "username",
                        ),
                        //username compulsory
                        //not working
                        validator: (value) {
                          if (value != null) {
                            value.isEmpty ? 'Enter username' : null;
                          }
                          return null;
                        },
                        // validator: (String? value) {
                        //   if (value != null && value.isEmpty) {
                        //     return "Username can't be empty";
                        //   }

                        //   return null;
                        // },
                        //   validator: (String? value) {
                        //   if (value!.isEmpty) {
                        //     return "Username cann't be empty";
                        //   }

                        //   return null;
                        // },

                        //for adding name in after the welcome screen in the home page screen
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        }),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter Password", labelText: "password"),
                      //for asking password of lenght minimum 6 in the password bar
                      // not working
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     return "Username cann't be empty";
                      //   } else if (value.length < 6) {
                      //     return "passwod should be atleast 6 characters";
                      //   }

                      //   return null;
                      // },
                    ),

                    //space
                    const SizedBox(height: 20),

                    Material(
                      //to add repel effict in screen
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(change_button ? 20 : 8),

                      //actual ligin button code
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: change_button ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: change_button
                              ? (const Icon(Icons.done, color: Colors.white))
                              : const Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
