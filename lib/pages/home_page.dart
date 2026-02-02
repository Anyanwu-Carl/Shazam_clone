import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        // LIBRARY BUTTON
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person_search,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        Text(
                          "Library",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    Spacer(),

                    // CONCERTS BUTTON
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.confirmation_num,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),

                        Text(
                          "Concerts",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.headphones, color: Colors.white, size: 40),

                      SizedBox(width: 10),

                      Text(
                        "Tap to Shazam",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 75),

                  // SHAZAM CIRCLE
                  AvatarGlow(
                    startDelay: Duration(milliseconds: 1000),
                    glowColor: Colors.white,
                    glowShape: BoxShape.circle,
                    animate: true,
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(milliseconds: 2000),
                    repeat: true,
                    child: Material(
                      shape: CircleBorder(),
                      child: Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Color(0xff333333),
                              Color(0xff2f2f2f),
                              Color(0xff575757),
                            ],
                          ),
                        ),
                        child: Image(
                          image: ResizeImage(
                            AssetImage("assets/images/shazam-logo.png"),
                            width: 150,
                            height: 150,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 100),

                  // SEARCH ICON BUTTON
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          Color(0xff333333),
                          Color(0xff2f2f2f),
                          Color(0xff575757),
                        ],
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search, color: Colors.white, size: 40),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
