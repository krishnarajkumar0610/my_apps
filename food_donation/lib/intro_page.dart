import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_donating/screens/logins/new_user.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const NewUser(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/app_logo.png"),
            Text(
              "Keep donating ❤️",
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
