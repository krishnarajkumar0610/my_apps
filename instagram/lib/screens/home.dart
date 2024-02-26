import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final screenWidth;
  final screenHeight;
  final orientation;

  Home(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.orientation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        actions: const [
          Icon(
            Icons.favorite_border,
          ),
          SizedBox(
            width: 30,
          ),
          Icon(Icons.chat),
          SizedBox(
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
                      100,
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
                  )
                ],
              ),
            ),
            //
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.white,
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
