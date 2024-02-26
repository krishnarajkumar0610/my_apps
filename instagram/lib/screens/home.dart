import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/bloc/bloc.dart';
import 'package:instagram/bloc/states.dart';

import '../bloc/events.dart';

class Home extends StatelessWidget {
  final screenWidth;
  final screenHeight;
  final orientation;

  Home(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.orientation});

  List<String> followers = [
    "Krishna",
    "Raj",
    "Kumar",
    "Priya",
    "Dharshini",
    "Sathiya",
    "Praba",
    "Prakash",
    "Sharon",
    "Joseph",
    "Prem",
    "Viswanathan",
    "Shahana",
    "Juhi",
    "Mohammed"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              "assets/insta_text.png",
              height: 60,
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(Icons.keyboard_arrow_down_sharp)
          ],
        ),
        actions: [
          BlocConsumer<InstaBloc, InstaStates>(
            builder: (context, state) => GestureDetector(
                onTap: () {
                  context
                      .read<InstaBloc>()
                      .add(ThemeEvent(themeStatus: state.themeStatus));
                },
                child: Icon(Icons.dark_mode)),
            listener: (BuildContext context, Object? state) {},
          ),
          const SizedBox(
            width: 30,
          ),
          const Icon(
            Icons.favorite_border,
          ),
          const SizedBox(
            width: 30,
          ),
          const Icon(Icons.chat),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 5,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset("assets/dp.png"),
                              ),
                            ),
                          ),
                          const Positioned(
                              top: 50,
                              left: 45,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.blue,
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: List.generate(
                      followers.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 35,
                          child: Image.asset(
                            "assets/follower.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 600,
              width: double.infinity,
              child: ListView.builder(
                itemCount: followers.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 230,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              child: Image.asset("assets/follower.png"),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(followers[index])
                          ],
                        ),
                        Image.asset("assets/posts/post_$index.jpg")
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.home,
              size: 30,
            ),
            Icon(
              Icons.search,
              size: 30,
            ),
            Icon(
              Icons.add_box_outlined,
              size: 30,
            ),
            Icon(
              Icons.slow_motion_video,
              size: 30,
            ),
            Icon(
              Icons.person,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
