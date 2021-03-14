import 'package:blog_project/md_widgets/config/style_config.dart';
import 'package:blog_project/md_widgets/markdown_widget.dart';
import 'package:blog_project/md_widgets/tags/pre.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../tests.dart';

class MarkdownExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @deprecated
  Widget getMarkdownBody(BuildContext context) {
    final isDark =
    Theme.of(context).brightness == Brightness.dark ? true : false;

    return MarkdownWidget(
      data: Tests.s,
      shrinkWrap: true,
      loadingWidget: Container(),
      styleConfig: StyleConfig(
          codeConfig: CodeConfig(codeStyle: TextStyle(fontSize: 50)),
          pConfig: PConfig(
              onLinkTap: (url) => print('should launch url'),
              selectable: false),
          titleConfig: TitleConfig(
            showDivider: false,
            commonStyle: TextStyle(color: Colors.red),
          ),
          imgBuilder: (url, attr) {
            double w;
            double h;
            if (attr['width'] != null) w = double.parse(attr['width']);
            if (attr['height'] != null) h = double.parse(attr['height']);
            return GestureDetector(
              onTap: () => print('should launch url'),
              child: Card(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/img/loading.gif',
                  placeholderScale: 0.5,
                  image: url ?? '',
                  height: h,
                  width: w,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          preConfig: PreConfig(
              preWrapper: (child, text) {
                return Stack(
                  children: <Widget>[
                    child,
                    Container(
                      margin: EdgeInsets.only(top: 5, right: 5),
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          Widget toastWidget = Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 50),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xff006EDF), width: 2),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(
                                    4,
                                  )),
                                  color: Color(0xff007FFF)),
                              width: 100,
                              height: 30,
                              child: Center(
                                child: Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    '复制成功',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          );
                          // ToastWidget().showToast(context, toastWidget, 1);
                        },
                        icon: Icon(
                          Icons.content_copy,
                          size: 10,
                        ),
                      ),
                    )
                  ],
                );
              },
              language: 'dart'),
          markdownTheme:
          isDark ? MarkdownTheme.darkTheme : MarkdownTheme.lightTheme),
    );
  }
}
