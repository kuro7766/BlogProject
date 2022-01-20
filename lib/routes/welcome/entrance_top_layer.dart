import 'dart:async';

import 'package:blog_project/config.dart';
import 'package:blog_project/routes/blog_list_main_content/logic.dart';
import 'package:blog_project/routes/welcome/l_list_widgets.dart';
import 'package:blog_project/util/getx_debug_tool.dart';
import 'package:blog_project/util/js_util.dart';
import 'package:blog_project/util/simple_http_builder.dart';
import 'package:blog_project/vars/consts.dart';
import 'package:blog_project/widgets/attatcher.dart';
import 'package:blog_project/widgets/iframe_widget.dart';
import 'package:blog_project/widgets/reusable/over_lap_inkwell.dart';
import 'package:blog_project/widgets/reusable/white_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:should_rebuild/should_rebuild.dart';
import 'package:http/http.dart' as http;

class EntranceTopLayer extends StatefulWidget {
  final Animation<double> animation;

  EntranceTopLayer({Key key, this.animation}) : super(key: key);

  @override
  _EntranceTopLayerState createState() => _EntranceTopLayerState();
}

class _EntranceTopLayerState extends State<EntranceTopLayer> {
  MainContentLogic logic = Get.put(MainContentLogic());
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

  Widget topRightRow() =>
      Row(
        children: [
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width / 3,
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
          Visibility(
            child: Obx(() {
              return ShouldRebuild<IframeWidget>(
                  shouldRebuild: (oldWidget, newWidget) => oldWidget.url!=newWidget.url,
                  child: IframeWidget(
                    // 'https://music.163.com/outchain/player?type=2&id=26131698&auto=1&height=66',
                    // 'https://music.163.com/outchain/player?type=2&id=419594766&auto=1&height=66',
                    Const.music[logic.state.musicIframeUrlIndex.value][0],
                    width: 300,
                    height: 200,
                  ));
            }),
            // maintainSize: true,
            // maintainAnimation: true,
            // maintainState: true,
            visible: Cfg.isMobile ? false : true,
          ),
          Visibility(
            visible: true,
            child: Builder(builder: (c) {
              return IconButton(
                onPressed: () {
                  // SmartDialog.showAttach(
                  //   targetContext: c,
                  //   target: Offset(100, 100),
                  //   widget: Container(width: 100, height: 100, color: Colors.red),
                  // );
                  attach(c, Alignment.bottomCenter, WhiteBorder(
                    child: Container(
                      color: Colors.white70,
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Column(children: List.generate(Const.music
                            .length, (index) =>
                            ListTile(
                              title: Text(Const.music[index][1]),
                              onTap: () {
                                logic.state.musicIframeUrlIndex.value = index;
                              },
                            )),),
                      ),
                    ),
                  ));
                },
                icon: Icon(Icons.music_video_rounded),
              );
            }),
          )
          // Container(child: SizedBox(width: 300,child: HtmlEmbedView(url: Const.music[0]))),
          // OverlapInkwell(
          //   color: Const.barColor,
          //   onTap: () {
          //     // Get.toNamed('/login');
          //     JSUtil.call(function: 'redirect', params: [Const.eruptUrl]);
          //   },
          //
          //   child: SizedBox(
          //     height: Const.barHeight,
          //     child: Row(
          //       children: [
          //         SizedBox(
          //           width: 30,
          //         ),
          //         Text('登录'),
          //         Icon(Icons.login),
          //         SizedBox(
          //           width: 30,
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ],
      );

  topScrollBar() =>
      SizeTransition(
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
