import 'package:flutter/material.dart';

class SignupMobileNumber extends StatelessWidget {
  final screenWidth;
  final screenHeight;
  final orientation;

  const SignupMobileNumber(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.orientation});

  Widget getButton(
    String text,
    Color borderColor, {
    Color? buttonColor,
    Color? textColor,
  }) {
    return GestureDetector(
        onTap: () {},
        child: Container(
            width: screenWidth * 0.4,
            height: screenHeight * 0.13,
            decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                color: buttonColor,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: textColor, fontSize: 18),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: screenHeight * 0.1,
            // ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.02, bottom: screenHeight * 0.01),
              child: const Text(
                "What's your mobile number?",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.02),
              child: const Text(
                "Enter the mobile number where you can be contacted. No one will see this on your profile.",
                style: TextStyle(fontSize: 16, wordSpacing: 0.5),
              ),
            ),
            // SizedBox(height:,),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.02,
                  top: screenHeight * 0.06,
                  right: screenWidth * 0.02,
                  bottom: screenHeight * 0.02),
              child: TextField(
                style: const TextStyle(fontSize: 17),
                decoration: InputDecoration(
                  labelText: "Mobile number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 10.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.02),
              child: const Text(
                "You may receive SMS notification from us for security and login purposes",
                style: TextStyle(fontSize: 14, wordSpacing: 0.5),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            getButton("Next", Colors.blue,
                textColor: Colors.white, buttonColor: Colors.blue),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            getButton("Sign up with email", Colors.white,
                textColor: Colors.white, buttonColor: Colors.transparent),
            SizedBox(
              height: screenHeight * 0.7,
            ),
            const Text(
              "Already hava an account?",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  wordSpacing: 0.5),
            )
          ],
        ),
      ),
    );
  }
}
