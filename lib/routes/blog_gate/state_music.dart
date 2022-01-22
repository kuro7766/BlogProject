import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:just_audio/just_audio.dart';

class MusicState {
  var loaded = false.obs;
  var playingIndex = (-1).obs;
  final player = AudioPlayer();
  final List<String> musicAssetList=[];
}
