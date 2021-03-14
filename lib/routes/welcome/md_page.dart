import 'package:blog_project/routes/welcome/right_list_view.dart';
import 'package:blog_project/tests.dart';
import 'package:blog_project/util/debug.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import '../../consts.dart';
import '../../md_widgets/markdown_widget.dart';

class MainPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  var barHeight = Const.barHeight;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    controller.value = 1;
    animation =
        // Tween(begin: 1.0, end: 0.0).animate(controller);
        CurveTween(curve: Curves.fastOutSlowIn).animate(controller);
  }

  layer2() => Column(
        children: [
          SizeTransition(
            sizeFactor: animation,
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
                            onTap: (){

                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Icon(Icons.home,color: Colors.white,),
                                Text('主页',style:TextStyle(color: Colors.white),)
                              ],
                            ),
                          ),
                        )),
                    Expanded(
                        flex: Const.rightFlex,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: Container(
                                padding: EdgeInsets.only(left: 10),

                                // decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(30),
                                //     border: Border.all(
                                //         width: 3, color: Colors.blueAccent)),
                                child: new TextField(
                                  decoration: new InputDecoration(
                                    labelText: 'abc',
                                    border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(30.0),
                                      ),
                                    ),
                                    // filled: true,
                                    // hintStyle: new TextStyle(color: Colors.grey[800]),
                                    hintText: "Type in your text",
                                  ),
                                ),
                              ),
                            ),
                            Text('music')
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: Const.leftFlex,
                  child: ListView(
                    children: [
                      FlutterLogo(
                        size: 50,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('导航'),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.home_rounded),
                              Text('首页'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                  flex: Const.rightFlex,
                )
              ],
            ),
          ),
        ],
      );

  layer1() => Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(),
                  flex: Const.leftFlex,
                ),
                Expanded(
                  flex: Const.rightFlex,
                  child: buildCombineList(),
                ),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [layer1(), layer2()],
    ));
  }

  Widget buildCombineList() {
    return NotificationListener(
      onNotification: (t) {
        if (t is ScrollUpdateNotification) {
          if (t.scrollDelta > 0) {
            controller.reverse();
          } else {
            controller.forward();
          }
          Debug.log(5, t.scrollDelta);
        }
        return false;
      },
      child: InnerLayerContainer()
    );
  }

}
