import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shazam_clone/pages/song_screen.dart';
import 'package:shazam_clone/viewmodels/home_vm.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(homeViewModel);
    ref.listen<HomeViewModel>(homeViewModel, (previous, next) {
      if (next.success) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SongScreen(song: vm.currentSong),
          ),
        );
      }
    });
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
                          icon: const Icon(
                            Icons.person_search,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        const Text(
                          "Library",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // CONCERTS BUTTON
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.confirmation_num,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),

                        const Text(
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

              const SizedBox(height: 50),

              Column(
                children: [
                  const Row(
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

                  const SizedBox(height: 75),

                  // SHAZAM CIRCLE
                  AvatarGlow(
                    startDelay: const Duration(milliseconds: 1000),
                    glowColor: Colors.white,
                    glowShape: BoxShape.circle,
                    glowRadiusFactor: 0.3,
                    animate: vm.isRecognizing,
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 2000),
                    repeat: true,
                    child: GestureDetector(
                      onTap: () => vm.isRecognizing
                          ? vm.stopRecognizing()
                          : vm.startRecognizing(),
                      child: Material(
                        shape: const CircleBorder(),
                        child: Container(
                          height: 250,
                          width: 250,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                Color(0xff333333),
                                Color(0xff2f2f2f),
                                Color(0xff575757),
                              ],
                            ),
                          ),
                          child: const Image(
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
                  ),

                  const SizedBox(height: 100),

                  // SEARCH ICON BUTTON
                  Container(
                    width: 75,
                    height: 75,
                    decoration: const BoxDecoration(
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
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 40,
                      ),
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
