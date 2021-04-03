import 'package:blog_project/util/debug.dart';
import 'package:html/dom.dart' as h;
import 'package:html/parser.dart';
import 'package:markdown/markdown.dart' as m;

import '../tags/markdown_tags.dart';

///see this issue: https://github.com/dart-lang/markdown/issues/284#event-3216258013
///use [htmlToMarkdown] to convert HTML in [m.Text] to [m.Node]
///
/// [deep]表示了调用入口
void htmlToMarkdown(h.Node node, int deep, List<m.Node> mNodes,
    {m.Element parent}) {
  if (node == null) return;
  if (node is h.Text) {
    if (deep == 0) {
      mNodes.add(m.Text(node.text));
    } else {
      parent.children.add(m.Text(node.text));
    }
  } else if (node is h.Element) {
    //递归调用
    final tag = node.localName;
    //底层默认实现的
    //img标签里放组件应该没什么用
    if (tag == img || tag == video) {
      final element = m.Element(tag, null);
      element.attributes.addAll(node.attributes.cast());
      mNodes.add(element);
    } else {
      //解析出来当前节点信息
      final element = m.Element(tag, null);
      element.attributes.addAll(node.attributes.cast());
      final customElement = m.Element(other, [element]);

      // 原代码
      // mNodes.add(customElement);
      // if (node.nodes == null || node.nodes.isEmpty) return;
      // node.nodes.forEach((n) {
      //   htmlToMarkdown(n, deep + 1, mNodes);
      // });
      if (deep == 0) {
        mNodes.add(customElement);
        if (node.nodes == null || node.nodes.isEmpty) return;
        node.nodes.forEach((child) {
          htmlToMarkdown(child, deep + 1, mNodes, parent: customElement);
        });
      } else {
        parent.children.add(customElement);
        if (node.nodes == null || node.nodes.isEmpty) return;
        var t = DateTime.now().millisecondsSinceEpoch;
        node.nodes.forEach((child) {
          // log(
          //     64,
          //     "$t : " +
          //         child.text +
          //         ',${child?.children?.length}, ${child.toString()}' +
          //         ',' +
          //         child.runtimeType.toString());
          htmlToMarkdown(child, deep + 1, mNodes, parent: customElement);
        });
      }
    }
  }
}

final RegExp htmlRep = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);

///return [true] if need parse [m.Node] to [h.Node]
bool needParseHtml(m.Node parentNode) =>
    // false;
// 设置为false
// <f>abc</f>def
// 它会什么也不做
    (parentNode is m.Element && parentNode.tag != code);

///parse [m.Node] to [h.Node]
/////只被p.dart 调用
List<m.Node> parseHtml(
  m.Node node,
) {
  final text = node.textContent;
  if (!text.contains(htmlRep)) return [];
  log(61, 'to parse : ' + text);
  h.DocumentFragment document = parseFragment(text);
  //最终Nodes，初始化空，递归入口
  List<m.Node> nodes = [];
  var t = 0;

  document.nodes.forEach((element) {
    t+=1;
    //61 : to parse : <r>rr<b>bbBB</b>RR</r>888
    //root
    // 61 : 1616654122237 : rrbbBBRR,1, <html r>      判断 是否检测有没有孩子的依据
    // 63 : 1616654122237 : rr,0, "rr"                从这里开始就是真正的元素
    // 63 : 1616654122237 : bbBB,0, <html b>
    // 63 : 1616654122237 : RR,0, "RR"

    //root1
    // 61 : 1616654122240 : 888,0, "888"

    //61 : to parse : <r>rr<b>bbBB</b>RR</r>888
    // 62 : 1616654247001 : bbBB,0, <html b>,Element      这个没用去掉62
    // 61 : 1616654247001 : rrbbBBRR,1, <html r>,Element  判断 是否检测有没有孩子的依据
    // 63 : 1616654247001 : rr,0, "rr",Text               从这里开始就是真正的元素
    // 63 : 1616654247001 : bbBB,0, <html b>,Element
    // 63 : 1616654247001 : RR,0, "RR",Text
    // 61 : 1616654247004 : 888,0, "888",Text
    //this is parent
    log(61, "$t : " + element.text + ',${element?.children?.length}, ${element.toString()}' + ',' + element.runtimeType.toString());
    //this is children
    element.nodes.forEach((element) {
      log(63, "$t : " + element.text + ',${element?.children?.length}, ${element.toString()}' + ',' + element.runtimeType.toString());
    });
    htmlToMarkdown(element, 0, nodes);
  });
  return nodes;
}
