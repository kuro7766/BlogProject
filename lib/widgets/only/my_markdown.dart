import 'package:blog_project/widgets/only/markdown_web.dart';
import 'package:blog_project/widgets/reusable/dbg_container.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarkdownListView extends StatefulWidget {
  final String data;

  MarkdownListView(this.data);

  @override
  State<StatefulWidget> createState() {
    return _MarkdownListViewState();
  }
}

class _MarkdownListViewState extends State<MarkdownListView> {
  ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    EventBus eventBus = Get.find();
    eventBus.on<WebScrollEvent>().listen((event) {
      var target = (controller?.offset ?? 0) + event.dy;
      if (target < 0) target = 0;
      controller?.jumpTo(target);
    });
  }

  void dispose() {
    super.dispose();
    controller.dispose();
    controller = null;
  }

  Widget build(BuildContext context) {
    return ListView(
        controller: controller,
        children: [MarkDownWeb(widget.data)]);
  }
}

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

// return DbgContainer();
// return MarkdownWidget(
//   loadingWidget: Center(
//     child: Container(),
//   ),
//   data: data,
//   shrinkWrap: true,
//   styleConfig: StyleConfig(
//       markdownTheme: MarkdownTheme.lightTheme,
//       pConfig: PConfig(custom: (node) {
//         //<r>rr<b>bbBB</b>RR</r>888
//         // err null ptr
//
//         return Container(
//           color: Colors.lightBlueAccent,
//           child: Text('${node.tag} not supported'),
//         );
//       }),
//       tableConfig: TableConfig(
//         headerRowDecoration: BoxDecoration(
//             border: Border.all(color: Colors.lightGreen),
//             borderRadius: BorderRadius.all(Radius.circular(10))),
//         border: TableBorder.all(),
//       ),
//       blockQuoteConfig: BlockQuoteConfig(
//
//           textConfig: TextConfig(textAlign: TextAlign.center),
//           blockColor: Colors.blue,
//           backgroundColor: Colors.black),
//       titleConfig: TitleConfig(
//         showDivider: false,
//         // commonStyle: TextStyle(color: Colors.black),
//       ),
//       preConfig: PreConfig(
//           autoDetectionLanguage: true,
//           preWrapper: (w, t) {
//             return w;
//           })),
// );
