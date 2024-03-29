import 'package:flutter/material.dart';
import 'package:food_donating/screens/logins/home.dart';

import 'package:google_fonts/google_fonts.dart';

// this is sign in page

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _username = TextEditingController();
  final _signInPass = TextEditingController();

  Widget getField(
      {double? left = 0,
      double? right = 0,
      double? top = 0,
      double? bottom = 0,
      TextEditingController? controller,
      String? hintText,
      Icon? icon}) {
    return Padding(
        padding: EdgeInsets.only(
            left: left!, right: right!, top: top!, bottom: bottom!),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: icon,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ));
  }

  Widget otherSignUp(
          {double? width = 0,
          double? height = 0,
          String? text,
          Color? color,
          Color? textColor}) =>
      Container(
          width: width!,
          height: height!,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              text!,
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.bold, fontSize: 15, color: textColor),
            ),
          ));

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
    Orientation orientation = MediaQuery.of(context).orientation;

    return ListView(children: [
      Column(
        children: [
          SizedBox(height: deviceHeight * 0.02),
          getField(
            controller: _username,
            icon: const Icon(Icons.person),
            hintText: "User name",
            top: deviceHeight * 0.04,
            left: deviceWidth * 0.05,
            right: deviceWidth * 0.05,
          ),
          getField(
            controller: _signInPass,
            icon: const Icon(Icons.lock),
            hintText: "Password",
            top: deviceHeight * 0.04,
            left: deviceWidth * 0.05,
            right: deviceWidth * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                }, //w:250,h:50,
                child: otherSignUp(
                    width: deviceWidth * 0.70,
                    height: deviceHeight * 0.05,
                    text: "SIGN IN",
                    color: Colors.orange)),
          ),
          Padding(
            padding: EdgeInsets.only(left: deviceWidth * 0.400, top: 20),
            child: GestureDetector(
              onTap: () {
                print("Pressed forget password");
              },
              child: Text(
                "Forget password?",
                style: GoogleFonts.notoSerif(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              "--------------or Sign In with--------------",
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                otherSignUp(
                    width: deviceWidth * 0.360,
                    text: "Google",
                    color: Colors.white,
                    height: deviceHeight * 0.050,
                    textColor: Colors.black),
                otherSignUp(
                    width: deviceWidth * 0.360,
                    text: "Facebook",
                    color: Colors.deepPurple[700],
                    height: deviceHeight * 0.050,
                    textColor: Colors.white),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    ]);
  }
}

// ending sing in
