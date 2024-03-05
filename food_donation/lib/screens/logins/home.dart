import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'form_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<String> options = ["Instant", "Donars", "To register"];
  List<String> followers = [
    "KarthiK",
    "Manikandan",
    "Hari",
    "Krishna",
    "Raj",
    "Kumar",
    "Elon",
    "Musk",
    "Obama"
  ];

  List<List> images = [
    ["assets/apple.png", "Apple"],
    ["assets/avocado.png", "Avocado"],
    ["assets/banana.png", "Banana"],
    ["assets/cabbage.png", "Cabbage"],
    ["assets/carrot.png", "Carrot"],
    ["assets/milk.png", "Milk"],
    ["assets/orange.png", "Orange"],
    ["assets/potato.png", "Potato"],
    ["assets/watermelon.png", "Watermelon"],
  ];

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image.asset("assets/app_logo.png"),
        ),
        actions: [
          const Icon(
            Icons.star,
            size: 30,
            color: Colors.yellowAccent,
          ),
          SizedBox(
            width: deviceWidth * 0.05,
          ),
          const Icon(
            Icons.message,
            color: Colors.black,
          ),
          SizedBox(
            width: deviceWidth * 0.05,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 720,
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                  (index) => GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FormPage()));
                      }
                    },
                    child: Container(
                      width: deviceWidth * 0.3,
                      height: deviceHeight * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        options[index],
                        style: GoogleFonts.notoSerif(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.01,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                              radius: 40,
                              child: Stack(
                                children: [
                                  Image.asset("assets/user_profile.png"),
                                  const Positioned(
                                    top: 50,
                                    left: 50,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.deepPurple,
                                      radius: 15,
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          const Text("Add story")
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: List.generate(
                          images.length,
                          // Adjust the number of containers as needed
                          (index) => Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    child: Image.asset("assets/followers.png"),
                                  ),
                                  Text(
                                    followers[index],
                                    style: const TextStyle(fontSize: 15),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ]),
              ),
              Text(
                "News",
                style: GoogleFonts.notoSerif(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: double.infinity,
                height: 500,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: images.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        width: deviceWidth * 0.3,
                        height: deviceHeight * 0.09,
                        decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  spreadRadius: 5),
                            ]),
                        child: Column(
                          children: [
                            Image.asset(
                              images[index][0],
                              height: 100,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              images[index][1],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
