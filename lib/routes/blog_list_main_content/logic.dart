import 'dart:convert';
import 'dart:js';

import 'package:blog_project/entity/show_banner_event.dart';
import 'package:blog_project/routes/blog_list_main_content/state_music.dart';
import 'package:blog_project/util/debug.dart';
import 'package:blog_project/util/getx_debug_tool.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import 'state_global.dart';

class GlobalLogic extends GetxController {
  final state = MainContentState();
  final musicState = MusicState();
  EventBus _eventBus;

  @override
  onInit(){
    super.onInit();
    (()async{
      if(musicState.playing.value){
        return;
      }
      Dbg.log('source','x');
      final player = AudioPlayer();
      // var duration = await player.setAsset('assets/data/snow.mp3');
      // player.play(); // Usually you don't want to wait for playback to finish.

      // >> To get paths you need these 2 lines
      final manifestContent = await rootBundle.loadString('AssetManifest.json');

      final Map<String, dynamic> manifestMap = json.decode(manifestContent);
      // >> To get paths you need these 2 lines

      final imagePaths = manifestMap.keys.toList();

      // var s=await rootBundle.loadString(imagePaths[0].replaceFirst('assets/', ''));
      // Dbg.log(s,'kkk');
      var musics=(imagePaths
          .where((element) => element.startsWith('assets/music/'))
          .toList());

      await player.setAudioSource(
        ConcatenatingAudioSource(
          // Start loading next item just before reaching it.
          useLazyPreparation: true, // default
          // Customise the shuffle algorithm.
          shuffleOrder: DefaultShuffleOrder(), // default
          // Specify the items in the playlist.
          children:
          List.generate(musics.length, (index) => AudioSource.uri(Uri.parse('asset:///${musics[index]}')))
          // [
          //   AudioSource.uri(Uri.parse("https://example.com/track1.mp3")),
          //   AudioSource.uri(Uri.parse("https://example.com/track2.mp3")),
          //   AudioSource.uri(Uri.parse("https://example.com/track3.mp3")),
          // ]
          ,
        ),
        // Playback will be prepared to start from track1.mp3
        initialIndex: 0, // default
        // Playback will be prepared to start from position zero.
        initialPosition: Duration.zero, // default
      );
      // player.play();
      // await player.seekToNext();
      // await player.seekToPrevious();
      // // Jump to the beginning of track3.mp3.
      // await player.seek(Duration(milliseconds: 0), index: 2);

      musicState.playing.value=true;

    }());
  }

  GlobalLogic() {
    _eventBus = Get.find();
  }

  void _loseTextFieldFocus() {
    FocusScope.of(Get.context).requestFocus(new FocusNode());
  }

  void _showBanner() {
    _eventBus.fire(ShowBannerEvent());
  }

  void changeSearchBarFocus(bool focus) {
    if (focus) {
      toSearch();
    }
  }

  void toFriendList() {
    Future.microtask(() {
      _loseTextFieldFocus();
      state.viewType(3);
    });
  }

  void toSearch() {
    state.viewType(4);
  }

  void toMarkdownArticle(String articleId) {
    // state.viewType.value = 1;
    // state.articleId.value = articleId;
    state.viewType(5);
    state.articleAssetResource(articleId);
    _showBanner();
  }

  void toArticleList({home = false}) {
    Future.microtask(() {
      state.viewType.value = 0;
      if (home) state.currentPage.value = 1;
      _showBanner();
      _loseTextFieldFocus();
    });
  }

  void toTagList({home = false}) {
    state.viewType.value = 2;
    if (home) state.tagCurrentPage.value = 1;
    _showBanner();
  }

  void switchPage(int offset) {
    var target = state.currentPage.value + offset;
    if (target < 1) {
      target = 1;
    }
    log(95, '${target},${state.currentPage.value}');
    if (target != state.currentPage.value) {
      _showBanner();
    }
    state.currentPage.value = (target);
  }

  void toArticlePage(int page) {
    state.currentPage.value = page;
    _showBanner();
  }

  set _viewType(int view) {
    state.viewType.value = view;
  }
}
