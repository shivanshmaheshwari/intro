import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intro/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
            const Text(
              "WELCOME",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            //for space
            const SizedBox(
              height: 20.0,
            ),

            //username and password column
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Enter Username", labelText: "username"),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter Password", labelText: "password"),
                  ),

                  //space
                  const SizedBox(height: 20),

                  //button
                  ElevatedButton(
                      // style: TextButton.styleFrom(),
                      child: const Text("LOGIN"),
                      style: TextButton.styleFrom(
                          minimumSize: const Size(150, 40)),
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.home_page);
                      })
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
