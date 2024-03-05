import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../bloc/grocery_bloc.dart';
import '../../bloc/grocery_states.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _fullName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

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

  void showStatus({
    required Icon icon,
    required String text,
    required Color buttonColor,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: icon,
        content: Text(text),
        actions: [
          MaterialButton(
            color: buttonColor,
            onPressed: () => Navigator.pop(context),
            child: const Text("Ok"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;

    return BlocConsumer<GroceryBloc, GroceryStates>(
      listener: (context, state) {},
      builder: (context, state) => ListView(children: [
        Column(
          children: [
            getField(
              controller: _fullName,
              icon: const Icon(Icons.person),
              hintText: "Full Name",
              top: deviceHeight * 0.04,
              left: deviceWidth * 0.05,
              right: deviceWidth * 0.05,
            ),
            getField(
              controller: _email,
              icon: const Icon(Icons.lock),
              hintText: "Email ID",
              top: deviceHeight * 0.04,
              left: deviceWidth * 0.05,
              right: deviceWidth * 0.05,
            ),
            getField(
              controller: _password,
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
                    state.signupStatus
                        ? showStatus(
                            icon: const Icon(Icons.warning,
                                color: Colors.yellow, size: 40),
                            buttonColor: Colors.red,
                            text: "Sign up failed")
                        : showStatus(
                            icon: const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 40,
                            ),
                            buttonColor: Colors.green,
                            text: "Sign up successful please log in");
                  }, //w:250,h:50,
                  child: otherSignUp(
                      width: deviceWidth * 0.70,
                      height: deviceHeight * 0.05,
                      text: "SIGN UP",
                      color: Colors.orange)),
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
      ]),
    );
  }
}

// end of sign up page
