import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/bloc/select_player/select_player_event.dart';
import 'package:tic_tac_toe/screens/player_name_input_screen.dart';

import '../bloc/select_player/select_player_bloc.dart';
import '../bloc/select_player/select_player_state.dart';

class SelectPlayerMode extends StatefulWidget {
  const SelectPlayerMode({super.key});

  @override
  State<SelectPlayerMode> createState() => _SelectPlayerModeState();
}

class _SelectPlayerModeState extends State<SelectPlayerMode> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.sizeOf(context).height;
    final deviceWidth = MediaQuery.sizeOf(context).width;
    return BlocProvider(
      create: (context) => SelectPlayerModeBloc(),
      child: BlocConsumer<SelectPlayerModeBloc, SelectPlayersModeState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/my_profile.png",
                    height: 80,
                  )
                ],
              ),
              SizedBox(
                height: deviceHeight * 0.2,
              ),
              GestureDetector(
                onTap: () => context
                    .read<SelectPlayerModeBloc>()
                    .add(SinglePlayerEvent()),
                child: Container(
                  width: deviceWidth * 0.8,
                  height: deviceHeight * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: state is SinglePlayerModeState
                          ? Colors.blue
                          : Colors.transparent),
                  child: Center(
                    child: Text(
                      "Single player",
                      style: GoogleFonts.notoSerif(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.1,
              ),
              GestureDetector(
                onTap: () => context
                    .read<SelectPlayerModeBloc>()
                    .add(DoublePlayerEvent()),
                child:
                    BlocConsumer<SelectPlayerModeBloc, SelectPlayersModeState>(
                  listener: (context, playerState) {},
                  builder: (context, playerState) => Container(
                    width: deviceWidth * 0.6,
                    height: deviceHeight * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: playerState is DoublePlayerModeState
                            ? Colors.blue
                            : Colors.transparent),
                    child: Center(
                      child: Text(
                        "Double player",
                        style: GoogleFonts.notoSerif(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.1,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayerNameInputScreen(
                          mode: state is SinglePlayerModeState ? true : false),
                    )),
                child: Container(
                  width: deviceWidth * 0.6,
                  height: deviceHeight * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.deepPurple),
                  child: Center(
                    child: Text(
                      "Next",
                      style: GoogleFonts.notoSerif(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
