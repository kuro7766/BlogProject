import 'package:blog_project/routes/login/login_page.dart';
import 'package:blog_project/routes/welcome/part/l_list/l_list_widgets.dart';
import 'package:blog_project/util/debug.dart';
import 'package:blog_project/vars/consts.dart';
import 'package:blog_project/widgets/reusable/html_embeded.dart';
import 'package:blog_project/widgets/reusable/over_lap_inkwell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntranceTopLayer extends StatefulWidget {
  final Animation<double> animation;

  EntranceTopLayer({Key key, this.animation}) : super(key: key);

  @override
  _EntranceTopLayerState createState() => _EntranceTopLayerState();
}

class _EntranceTopLayerState extends State<EntranceTopLayer>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> searchListAnimation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    controller.value = 0;
    searchListAnimation =
        // Tween(begin: 1.0, end: 0.0).animate(controller);
        CurveTween(curve: Curves.fastOutSlowIn).animate(controller);
  }

  topRightRow() => Row(
        children: [
          SizedBox(
            width: 300,
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
                  onFocusChange: (has) {

                    if (has) {
                      controller.forward();
                    } else {
                      controller.reverse();
                    }
                  },
                  child: new TextField(
                    decoration: new InputDecoration(
                      labelText: '搜索',
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
              onTap: () {},
              child: Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Icon(Icons.search))),
          Expanded(child: Container()),

          // Container(child: SizedBox(width: 300,child: HtmlEmbedView(url: Const.music[0]))),
          OverlapInkwell(
            color: Const.barColor,
            onTap: () {
              Get.toNamed('/login');
            },
            child: SizedBox(
              height: Const.barHeight,
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text('登录'),
                  Icon(Icons.login),
                  SizedBox(
                    width: 30,
                  )
                ],
              ),
            ),
          ),
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
                        onTap: () {},
                        child: SizedBox(
                          height: Const.barHeight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              Text(
                                '菜单',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
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
                  color: Color(0xff3A3F51),
                  child: LUserContentList(),
                ),
              ),
              Expanded(
                child: Container(
                    // color: Colors.red,
                    child: Align(
                  alignment: Alignment.topLeft,
                  child: SizeTransition(
                    sizeFactor: searchListAnimation,
                    child: Column(
                      children: [
                        SizedBox(
                            width: 300,
                            height: 200,
                            child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (c, i) {
                                  return OverlapInkwell(
                                      onTap: () {},
                                      child: Container(
                                          height: 30,
                                          child: Center(child: Text('$i'))));
                                }))
                      ],
                    ),
                  ),
                )),
                flex: Const.rightFlex,
              )
            ],
          ),
        ),
      ],
    );
  }
}
