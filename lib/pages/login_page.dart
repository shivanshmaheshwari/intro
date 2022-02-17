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
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
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
                          hintText: "Enter Username", labelText: "username"),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      }),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter Password", labelText: "password"),
                  ),

                  //space
                  const SizedBox(height: 20),

                  InkWell(
                    onTap: () async {
                      setState(() {
                        change_button = true;
                      });
                      await Future.delayed(const Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.home_page);
                    },
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
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(change_button ? 20 : 8),
                      ),
                    ),
                  ),
                  // button
                  //   ElevatedButton(
                  //       // style: TextButton.styleFrom(),
                  //       child: const Text("LOGIN"),
                  //       style: TextButton.styleFrom(
                  //           minimumSize: const Size(150, 40)),
                  //       onPressed: () {
                  //         Navigator.pushNamed(context, MyRoutes.home_page);
                  //       })
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
