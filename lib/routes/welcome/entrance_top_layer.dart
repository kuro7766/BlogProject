import 'dart:async';
import 'dart:convert';

import 'package:blog_project/config.dart';
import 'package:blog_project/routes/blog_gate/logic.dart';
import 'package:blog_project/routes/welcome/l_list_widgets.dart';
import 'package:blog_project/util/getx_debug_tool.dart';
import 'package:blog_project/util/js_util.dart';
import 'package:blog_project/util/simple_http_builder.dart';
import 'package:blog_project/consts.dart';
import 'package:blog_project/widgets/ShouldRebuild.dart';
import 'package:blog_project/widgets/attatcher.dart';
import 'package:blog_project/widgets/iframe_widget.dart';
import 'package:blog_project/widgets/reusable/over_lap_inkwell.dart';
import 'package:blog_project/widgets/reusable/white_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:blog_project/widgets/ShouldRebuild.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';

class EntranceTopLayer extends StatefulWidget {
  final Animation<double> animation;

  EntranceTopLayer({Key key, this.animation}) : super(key: key);

  @override
  _EntranceTopLayerState createState() => _EntranceTopLayerState();
}

class _EntranceTopLayerState extends State<EntranceTopLayer> {
  GlobalLogic logic = Get.put(GlobalLogic());
  TextEditingController textEditingController;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();

    // controller = new AnimationController(
    //     vsync: this, duration: Duration(milliseconds: 500));
    // controller.value = 0;
    // searchListAnimation =
    //     // Tween(begin: 1.0, end: 0.0).animate(controller);
    //     CurveTween(curve: Curves.fastOutSlowIn).animate(controller);
  }

  Widget topRightRow() => Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            // height: 200,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(30),
              //     border: Border.all(
              //         width: 3, color: Colors.blueAccent)),
              child: Theme(
                data: new ThemeData(
                  primaryColor: Const.searchBarColor,
                  primaryColorDark: Const.searchBarColor,
                ),
                child: Focus(
                  onFocusChange: logic.changeSearchBarFocus,
                  child: new TextField(
                    controller: textEditingController,
                    decoration: new InputDecoration(
                      labelText: '  搜索',
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Const.searchBarColor),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                      enabledBorder: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Const.searchBarColor),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                      // filled: true,
                      // hintStyle: new TextStyle(color: Colors.grey[800]),
                      hintText: "输入想要搜索的内容",
                    ),
                  ),
                ),
              ),
            ),
          ),
          OverlapInkwell(
              color: Const.barColor,
              onTap: () {
                logic.state.search(textEditingController.text);
                textEditingController.text = '';
              },
              child: Container(
                  padding: Cfg.isMobile
                      ? EdgeInsets.only(
                          left: Cfg.mobileHomeIconPadding,
                          right: Cfg.mobileHomeIconPadding)
                      : EdgeInsets.all(30.0),
                  alignment: Alignment.center,
                  child: Icon(Icons.search))),
          // Expanded(child: Container()),
          // Visibility(
          //   child: Obx(() {
          //     return ShouldRebuild<IframeWidget>(
          //         shouldRebuild: (oldWidget, newWidget) =>
          //         oldWidget.url != newWidget.url,
          //         child: IframeWidget(
          //           // 'https://music.163.com/outchain/player?type=2&id=26131698&auto=1&height=66',
          //           // 'https://music.163.com/outchain/player?type=2&id=419594766&auto=1&height=66',
          //           Const.music[logic.state.musicIframeUrlIndex.value][0],
          //           width: 300,
          //           height: 200,
          //         ));
          //     // return logic.state.globalMusicWidget;
          //   }),
          //   // maintainSize: true,
          //   // maintainAnimation: true,
          //   // maintainState: true,
          //   // visible: Cfg.isMobile ? false : true,
          //   visible: false,
          // ),
          Visibility(
            visible: true,
            child: Builder(builder: (c) {
              return IconButton(
                onPressed: () async {
                  var musicState = logic.musicState;
                  var player = musicState.player;

                  attach(
                      c,
                      Cfg.isMobile
                          ? Alignment.centerLeft
                          : Alignment.bottomLeft, Obx(() {
                    // musicState.loaded.value;
                    return musicState.loaded.value
                        ?WhiteBorder(
                            color: Colors.white70,
                            child: Container(
                              child: SizedBox(
                                width: 200,
                                height: 200,
                                child: Column(
                                  children: List.generate(
                                      musicState.musicList.length,
                                      (index) => GestureDetector(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0, bottom: 8),
                                              child: Row(
                                                // crossAxisAlignment:
                                                //     CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0, top: 2),
                                                    child: Visibility(
                                                      visible: index ==
                                                          musicState
                                                              .playingIndex
                                                              .value,
                                                      child: Icon(Icons
                                                          .pause_circle_outline),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      musicState.musicList[index]['name'],
                                                      // Uri.decodeFull(
                                                      //   musicState.musicList[index]['name'],
                                                      // ),
                                                      // .replaceFirst(r'.mp3', ''),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            onTap: () async {
                                              SmartDialog.dismiss();

                                              if (musicState.playingIndex ==
                                                  index) {
                                                player.pause();
                                                musicState.playingIndex.value =
                                                    -1;
                                              } else {
                                                logic.musicState.playingIndex
                                                    .value = index;
                                                await player.seek(
                                                    Duration(milliseconds: 0),
                                                    index: index);
                                                musicState.player.play();
                                              }
                                            },
                                          )),
                                ),
                              ),
                            ),
                          )
                        : Text('loading...');
                  }));

                  if (!musicState.loaded.value) {
                    // if (false) {

                    // await Future.delayed(Duration(milliseconds: 500));
                    // // await attach(context,Alignment.center,Text('加载中'));
                    // Dbg.log('source', 'x');
                    // // var duration = await player.setAsset('assets/data/snow.mp3');
                    // // player.play(); // Usually you don't want to wait for playback to finish.
                    //
                    // // >> To get paths you need these 2 lines
                    // final manifestContent =
                    //     await rootBundle.loadString('AssetManifest.json');
                    //
                    // final Map<String, dynamic> manifestMap =
                    //     json.decode(manifestContent);
                    // // >> To get paths you need these 2 lines
                    //
                    // final assetPaths = manifestMap.keys.toList();

                    // var s=await rootBundle.loadString(imagePaths[0].replaceFirst('assets/', ''));
                    // Dbg.log(s,'kkk');

                    // var musics = (assetPaths
                    //     .where((element) => element.startsWith('assets/music/'))
                    //     .toList());
                    // musicState.musicAssetList
                    //   ..clear()
                    //   ..addAll(musics);

                    await player.setAudioSource(
                      ConcatenatingAudioSource(
                        // Start loading next item just before reaching it.
                        useLazyPreparation: true,
                        // default
                        // Customise the shuffle algorithm.
                        shuffleOrder: DefaultShuffleOrder(),
                        // default
                        // Specify the items in the playlist.
                        children:

                            // List.generate(
                            //     musics.length,
                            //     (index) => AudioSource.uri(
                            //         Uri.parse('asset:///${musics[index]}')))
                        //     [
                        //   DashAudioSource(Uri.parse()),
                        // ]
                        List.generate(
                          musicState.musicList.length,
                              (index){
                            Dbg.log(musicState.musicList[index]['url'],'path');
                            Dbg.log(index,'path');
                            // return DashAudioSource(Uri.parse('https://m804.music.126.net/20220124003144/c0a096f2eccc7f7822101a90f8e1ddd7/jdyyaac/515e/525f/025f/f4398d7e34e5e34574b4556a2de2e95c.m4a?authSecret=0000017e87b096ad033d0aaba61a198a'));
                            return DashAudioSource(Uri.parse(musicState.musicList[index]['url']));
                              }
                          // HlsAudioSource(
                          // Uri.parse('asset:///${musics[index]}'))
                          ),

                        // List.generate(
                        //   musics.length,
                        //       (index) =>
                        //   // HlsAudioSource(
                        //   // Uri.parse('asset:///${musics[index]}'))
                        //   DashAudioSource(
                        //       Uri.parse('asset:///${musics[index]}')),
                        // )

                        // [
                        //   AudioSource.uri(Uri.parse("https://example.com/track1.mp3")),
                        //   AudioSource.uri(Uri.parse("https://example.com/track2.mp3")),
                        //   AudioSource.uri(Uri.parse("https://example.com/track3.mp3")),
                        // ]

                      ),
                      // Playback will be prepared to start from track1.mp3
                      // initialIndex: 0, // default
                      // Playback will be prepared to start from position zero.
                      initialPosition: Duration.zero, // default
                      preload: false,
                    );
                    player.playerStateStream.listen((state) {
                      Dbg.log('$state', 'state.toString()');

                      if (state.playing) {
                        if (state.processingState ==
                            ProcessingState.completed) {
                          musicState.playingIndex.value = -1;
                        } else if (state.processingState ==
                            ProcessingState.ready) {
                          musicState.playingIndex.value = player.currentIndex;
                        }
                      } else {
                        musicState.playingIndex.value = -1;
                      }

                      // if (state.playing) ... else ...
                      // switch (state.processingState) {
                      // case ProcessingState.idle: ...
                      // case ProcessingState.loading: ...
                      // case ProcessingState.buffering: ...
                      // case ProcessingState.ready: ...
                      // case ProcessingState.completed: ...
                      // }
                    });
                    // player.play();
                    // await player.seekToNext();
                    // await player.seekToPrevious();
                    // // Jump to the beginning of track3.mp3.
                    // await player.seek(Duration(milliseconds: 0), index: 2);
                    Dbg.log('finished');
                    musicState.loaded.value = true;
                    // await SmartDialog.dismiss();
                  }

                  // SmartDialog.showAttach(
                  //   targetContext: c,
                  //   target: Offset(100, 100),
                  //   widget: Container(width: 100, height: 100, color: Colors.red),
                  // );
                },
                icon: Icon(
                  Icons.menu,
                ),
              );
            }),
          )
        ],
      );

  topScrollBar() => SizeTransition(
        sizeFactor: widget.animation,
        child: SizedBox(
          height: Const.barHeight,
          child: Container(
            color: Const.barColor,
            child: Row(
              children: [
                Expanded(
                    flex: Const.leftFlex,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          logic.toArticleList(home: true);
                        },
                        child: Padding(
                          padding: Cfg.isMobile
                              ? EdgeInsets.only(
                                  left: Cfg.mobileHomeIconPadding,
                                  right: Cfg.mobileHomeIconPadding)
                              : EdgeInsets.only(),
                          child: SizedBox(
                            height: Const.barHeight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.home,
                                  color: Colors.white,
                                ),
                                Cfg.isMobile
                                    ? Container()
                                    : Text(
                                        Const.leftTopTitle,
                                        style: TextStyle(color: Colors.white),
                                      )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                Expanded(flex: Const.rightFlex, child: topRightRow())
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        topScrollBar(),
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: Const.leftFlex,
                child: Container(
                  // color: Color(0xff3A3F51),
                  child: LUserContentList(),
                ),
              ),
              Expanded(
                child: Container(
                    // color: Colors.red,
                    ),
                flex: Const.rightFlex,
              )
            ],
          ),
        ),
      ],
    );
  }
}
