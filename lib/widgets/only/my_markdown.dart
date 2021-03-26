import 'package:blog_project/md_widgets/markdown_widget.dart';
import 'package:blog_project/widgets/reusable/white_border.dart';
import 'package:flutter/material.dart';

class MyMarkDown extends StatelessWidget {
  final String data;

  MyMarkDown(this.data);

  //MarkdownWidget(
  //         data: Tests.s2,
  //         shrinkWrap: true,
  //         styleConfig: StyleConfig(
  //             markdownTheme: MarkdownTheme.darkTheme,
  //             pConfig: PConfig(custom: (node) {
  //               return Text(
  //                 '${node.tag}',
  //                 style: TextStyle(color: Colors.black),
  //               );
  //             }),
  //             titleConfig: TitleConfig(
  //               showDivider: false,
  //               // commonStyle: TextStyle(color: Colors.black),
  //             ),
  //             preConfig: PreConfig(
  //                 autoDetectionLanguage: true,
  //                 preWrapper: (w, t) {
  //                   return w;
  //                 })),
  //       );
  Widget build(BuildContext context) {
    return MarkdownWidget(
      loadingWidget: Center(
        child: Container(),
      ),
      data: data,
      shrinkWrap: true,
      styleConfig: StyleConfig(
          markdownTheme: MarkdownTheme.lightTheme,
          pConfig: PConfig(custom: (node) {
            //<r>rr<b>bbBB</b>RR</r>888
            // err null ptr

            return Container(
              color: Colors.lightBlueAccent,
              child: Text('${node.tag} not supported'),
            );
          }),
          tableConfig: TableConfig(
            headerRowDecoration: BoxDecoration(
                border: Border.all(color: Colors.lightGreen),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            border: TableBorder.all(),
          ),
          blockQuoteConfig: BlockQuoteConfig(

              textConfig: TextConfig(textAlign: TextAlign.center),
              blockColor: Colors.blue,
              backgroundColor: Colors.black),
          titleConfig: TitleConfig(
            showDivider: false,
            // commonStyle: TextStyle(color: Colors.black),
          ),
          preConfig: PreConfig(
              autoDetectionLanguage: true,
              preWrapper: (w, t) {
                return w;
              })),
    );
  }
}
