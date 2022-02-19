import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro/pages/home_page.dart';
import 'package:intro/pages/login_page.dart';
import 'utils/routes.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.abhayaLibre().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.home_page,
      routes: {
        MyRoutes.login_page: (context) => LoginPage(),
        MyRoutes.home_page: (context) => homePage(),
      },
    );
  }
}
