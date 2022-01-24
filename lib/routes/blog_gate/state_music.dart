import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:just_audio/just_audio.dart';

class MusicState {
  var loaded = false.obs;
  var playingIndex = (-1).obs;
  final player = AudioPlayer();
  List musicList = [
    {
      'name': '風のアルペジオ',
      'url':'https://m804.music.126.net/20220124003144/c0a096f2eccc7f7822101a90f8e1ddd7/jdyyaac/515e/525f/025f/f4398d7e34e5e34574b4556a2de2e95c.m4a?authSecret=0000017e87b096ad033d0aaba61a198a'
    }
  ];
}
