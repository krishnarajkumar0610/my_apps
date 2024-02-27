import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:instagram/bloc/bloc.dart';
import 'package:instagram/bloc/states.dart';
import 'package:instagram/screens/log_in.dart';

void main() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => InstaBloc(), child: const OpenApp());
  }
}

class OpenApp extends StatefulWidget {
  const OpenApp({super.key});

  @override
  State<OpenApp> createState() => _OpenAppState();
}

class _OpenAppState extends State<OpenApp> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final orientation = MediaQuery.of(context).orientation;
    return BlocConsumer<InstaBloc, InstaStates>(
      listener: (context, state) {},
      builder: (context, state) => MaterialApp(
        theme: state.themeStatus ? ThemeData.light() : ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: "Instagram",
        home: Login(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          orientation: orientation,
        ),
      ),
    );
  }
}
