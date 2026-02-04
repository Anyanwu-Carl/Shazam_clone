import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:shazam_clone/services/models/deezer_song_model.dart';
import 'package:shazam_clone/services/song_service.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    // INITIALIZE ACR
    initAcr();
  }

  final AcrCloudSdk acr = AcrCloudSdk();
  final songService = SongService();
  DeezerSongModel? currentSong;
  bool isRecognizing = false;
  bool success = false;

  Future<void> initAcr() async {
    try {
      acr.init(
        host: "host",
        accessKey: "accessKey",
        accessSecret: "accessSecret",
        setLog: true,
      );
    } catch (e) {
      print(e.toString());
      throw ("An error occurred during ACR initialization: $e");
    }
  }

  // SEARCH SONG
  void searchSong(SongModel song) async {
    print(song);
    final metaData = song.metadata;
    if (metaData != null && metaData.music!.length > 0) {
      final trackId = metaData.music![0].externalMetadata?.deezer?.track?.id;
      try {
        final response = await songService.getTrack(trackId);
        currentSong = response;
        success = true;
        notifyListeners();
      } catch (e) {
        print(e.toString());
        isRecognizing = false;
        success = false;
        notifyListeners();
        throw ("An error occurred while fetching song details: $e");
      }
    }
  }

  // START RECOGNIZING
  Future<void> startRecognizing() async {
    isRecognizing = true;
    success = false;
    notifyListeners();
    try {
      await acr.start();
    } catch (e) {
      print(e.toString());
      throw ("An error occurred while starting recognition: $e");
    }
  }

  // STOP RECOGNIZING
  Future<void> stopRecognizing() async {
    isRecognizing = false;
    success = false;
    notifyListeners();
    try {
      await acr.stop();
    } catch (e) {
      print(e.toString());
      throw ("An error occurred while starting recognition: $e");
    }
  }
}

final homeViewModel = ChangeNotifierProvider<HomeViewModel>((ref) {
  return HomeViewModel();
});
