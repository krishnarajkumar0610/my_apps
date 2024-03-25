import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/bloc/select_player/select_player_bloc.dart';
import 'package:tic_tac_toe/bloc/select_player/select_player_state.dart';

class PlayerNameInputScreen extends StatefulWidget {
  bool mode;

  PlayerNameInputScreen({super.key, required this.mode});

  @override
  State<PlayerNameInputScreen> createState() => _PlayerNameInputScreenState();
}

class _PlayerNameInputScreenState extends State<PlayerNameInputScreen> {
  final singlePlayer = TextEditingController();
  final firstPlayer = TextEditingController();
  final secondPlayer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.sizeOf(context).height;
    final deviceWidth = MediaQuery.sizeOf(context).width;
    return BlocConsumer<SelectPlayerModeBloc, SelectPlayersModeState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.mode
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: textField(
                          text: "Enter Player Name", controller: singlePlayer),
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15.0),
                          child: textField(
                              text: "Enter player 1 name",
                              controller: firstPlayer),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 40.0),
                          child: textField(
                              text: "Enter player 2 name",
                              controller: secondPlayer),
                        )
                      ],
                    ),
              SizedBox(
                height: deviceHeight * 0.1,
              ),
              SizedBox(
                width: deviceWidth * 0.5,
                height: deviceHeight * 0.1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple),
                    onPressed: () {},
                    child: Text(
                      "Start",
                      style: GoogleFonts.notoSerif(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textField(
      {required String text, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
