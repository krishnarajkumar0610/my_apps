import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/bloc/bloc.dart';
import 'package:instagram/bloc/events.dart';
import 'package:instagram/bloc/states.dart';
import 'package:instagram/screens/signup_mobile.dart';

import 'home.dart';

class Login extends StatelessWidget {
  final screenWidth;
  final screenHeight;
  final orientation;

  const Login({super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.orientation});

  Widget textField(String text, TextEditingController controller,
      {Icon? icon}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.grey),
        suffix: icon,
        labelText: text,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 16, horizontal: 10.0),
      ),
    );
  }

  Widget getButton(String text,
      bool goHomePage,
      BuildContext context, {
        double? width,
        double? height,
        Color? textColor,
        Color? buttonColor,
      }) {
    return GestureDetector(
      onTap: () {
        if (goHomePage) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    Home(
                      orientation: orientation,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    ),
              ));
        } else {
          print("Crt tha");
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SignupMobileNumber(
                      screenHeight: screenWidth,
                      screenWidth: screenHeight,
                      orientation: orientation,
                    ),
              ));
        }
      },
      child: Container(
        width: width ?? 0,
        height: height ?? 0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: buttonColor,
          border: Border.all(color: Colors.blue),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userName = TextEditingController();
    final password = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.11,
              ),
              const Text("English(US)"),
              SizedBox(
                height: screenHeight * 0.09,
              ),
              Image.asset("assets/insta_logo.png", height: screenHeight * 0.09),
              Image.asset(
                "assets/insta_text.png",
                height: screenHeight * 0.1,
              ),
              SizedBox(
                  width: screenWidth * 0.9,
                  child: textField(
                    "Username, email or mobile number",
                    userName,
                  )),
              SizedBox(height: screenHeight * 0.015),
              SizedBox(
                  width: screenWidth * 0.9,
                  child: textField("Password", password,
                      icon: const Icon(Icons.lock))),
              SizedBox(height: screenHeight * 0.015),
              getButton("Login", true, context,
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.055,
                  buttonColor: Colors.blue,
                  textColor: Colors.black),
              SizedBox(height: screenHeight * 0.02),
              const Text(
                "Forget password?",
                style:
                    TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
              ),
              SizedBox(height: screenHeight * 0.20),
              getButton("Create an account", false, context,
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.055,
                  textColor: Colors.blue),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/meta.png",
                    height: screenHeight * 0.01,
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  const Text("Meta")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
