import 'package:blog_project/util/debug.dart';
import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as m;

import '../config/style_config.dart';

///Tag: other --- this is for you to custom widget
InlineSpan getOtherWidgetSpan(m.Element node) =>
    WidgetSpan(child: getOtherWidget(node));
// typedef X=void Function(String b,{String a});
///the custom widget
Widget getOtherWidget(m.Element node) {
  //todo analyze this code
  final customWidget = StyleConfig().pConfig?.custom;

  //之前是把孩子的第一个tag作为回调对象
  //<a></a>
  //只返回了<a>元素
  //现在应该返回布局树node本身

  // final m.Element customNode = node.children[0];

  // <r>rr<b>bbBB</b>RR</r>888
  //66 : other
  // 67 : Element
  // 67 : Text
  // 67 : Element
  // 67 : Text
  //考虑把孩子的第一个标签给父节点使用，并删5除第一个孩子
  // node.children.remove(0);

  // custom[0]是否一定存在?
  //前面已经确保了，只要是element，就一定存在一个对应的child
  final m.Element customNode = node;

  final customNode2 =
      m.Element((node.children[0] as m.Element).tag, node.children);
//<red>abc</red>def
  //55 : 1616632480362 : ,Element
  // solution
  // node.children.add(null);

  // 55 : 1616632628124 : ,Element,red
  var t = DateTime.now().millisecondsSinceEpoch;
  log(
      55,
      '$t : node itself ' +
          node.textContent +
          ',' +
          node.runtimeType.toString());
  node.children.forEach((element) {
    log(55,
        '$t : ' + element.textContent + ',' + element.runtimeType.toString());
  });
  if (customWidget != null) {
    // return customWidget.call(customNode);
    return customWidget.call(customNode2);
  } else {
    debugPrint('UnCatch Node:${customNode.tag}');
    return Container();
  }
}
