import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:just_audio/just_audio.dart';

class MusicState {
  var loaded = false.obs;
  var playingIndex = (-1).obs;
  final player = AudioPlayer();

  static String neteaseMusicId(String id) {
    return 'http://music.163.com/song/media/outer/url?id=$id.mp3';
  }

  List musicList = [
    {'name': "BOYS DON'T CRY", 'url': neteaseMusicId('28561001')}
  ];
}
