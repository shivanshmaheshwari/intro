import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);
  final String name = "shivansh";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("welcome"),
      ),
      body: Center(
        child: Container(
          child: Text("welcome to my 1st app by $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
