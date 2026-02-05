import 'package:flutter/material.dart';
import 'package:shazam_clone/services/models/deezer_song_model.dart';

class SongScreen extends StatelessWidget {
  final DeezerSongModel? song;
  const SongScreen({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF042442),
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: song != null
                      ? NetworkImage(song!.album.coverMedium)
                      : const AssetImage("assets/images/default.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      child: Column(
                        children: [
                          Expanded(
                            child: Text(
                              song?.title ?? "Unknown Title",
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      song?.artist.name ?? "Unknown Artist",
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
