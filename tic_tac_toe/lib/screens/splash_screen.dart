import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("HELLO");
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const HomeScreen(),
    //       ));
    // });
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.sizeOf(context).height;
    final deviceWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset("assets/tic_tac_toe_logo.png"),
            ),
            Text(
              "Tic Tac Toe 🎮",
              style: GoogleFonts.notoSerif(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: deviceHeight * 0.04,
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.2,
            ),
            Row(
              children: [
                SizedBox(
                  width: deviceWidth * 0.1,
                ),
                Text(
                  "Developed by, \n P.Krishna Rajkumar",
                  style: GoogleFonts.notoSerif(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: deviceHeight * 0.02,
                  ),
                ),
                CircleAvatar(
                  child: Image.asset(
                    "assets/my_profile.png",
                    height: 50,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
