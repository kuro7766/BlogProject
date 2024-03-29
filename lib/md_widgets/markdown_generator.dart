import 'dart:collection';

import 'package:blog_project/util/debug.dart';
import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as m;

import 'config/html_support.dart';
import 'config/style_config.dart';
import 'config/widget_config.dart';
import 'markdown_helper.dart';
import 'markdown_toc.dart';

///use [MarkdownGenerator] to transform markdown data to [Widget] list, so you can render it by any type of [ListView]
class MarkdownGenerator {
  MarkdownGenerator({
    @required String data,
    WidgetConfig widgetConfig,
    StyleConfig styleConfig,
    EdgeInsetsGeometry childMargin,
  }) {
    final m.Document document = m.Document(
        extensionSet: m.ExtensionSet.gitHubFlavored,
        encodeHtml: false,
        inlineSyntaxes: [TaskListSyntax()]);
    final List<String> lines = data.split(RegExp(r'(\r?\n)|(\r?\t)|(\r)'));
    List<m.Node> nodes = document.parseLines(lines);

    nodes.forEach((element) {
      log(35, '-${element.textContent}-');
    });
    log(36, nodes.length);
    _tocList = LinkedHashMap();
    _helper = MarkdownHelper(wConfig: widgetConfig);
    _widgets = [];
    nodes.forEach((element) {
      var w = _generatorWidget(element, childMargin);
      log(40, '${w} added ');
      _widgets.add(w);
    });
  }

  List<Widget> _widgets;
  LinkedHashMap<int, Toc> _tocList;
  MarkdownHelper _helper;

  List<Widget> get widgets => _widgets;

  LinkedHashMap<int, Toc> get tocList => _tocList;

  //todo : generator all widget from markdown data by this method
  ///generator all widget from markdown data by this method
  Widget _generatorWidget(m.Node node, EdgeInsetsGeometry childMargin) {
    if (node is m.Text) {
      log(51, node.textContent + ',' + node.textContent);
      return _helper.getPWidget(m.Element(p, [node]));
    }
    log(50, node.runtimeType);
    final tag = (node as m.Element).tag;
    Widget result;
    var dbg = node as m.Element;
    log(37, '-${dbg.textContent},${dbg.tag}-');
    log(51, '-${dbg.textContent},${dbg.tag}-');
    switch (tag) {
      case h1:
        _tocList[_widgets.length] = Toc(
            node.textContent.replaceAll(htmlRep, ''),
            tag,
            _widgets.length,
            _tocList.length,
            0);
        result = _helper.getTitleWidget(node, h1);
        break;
      case h2:
        _tocList[_widgets.length] = Toc(
            node.textContent.replaceAll(htmlRep, ''),
            tag,
            _widgets.length,
            _tocList.length,
            1);
        result = _helper.getTitleWidget(node, h2);
        break;
      case h3:
        _tocList[_widgets.length] = Toc(
            node.textContent.replaceAll(htmlRep, ''),
            tag,
            _widgets.length,
            _tocList.length,
            2);
        result = _helper.getTitleWidget(node, h3);
        break;
      case h4:
        _tocList[_widgets.length] = Toc(
            node.textContent.replaceAll(htmlRep, ''),
            tag,
            _widgets.length,
            _tocList.length,
            3);
        result = _helper.getTitleWidget(node, h4);
        break;
      case h5:
        _tocList[_widgets.length] = Toc(
            node.textContent.replaceAll(htmlRep, ''),
            tag,
            _widgets.length,
            _tocList.length,
            4);
        result = _helper.getTitleWidget(node, h5);
        break;
      case h6:
        _tocList[_widgets.length] = Toc(
            node.textContent.replaceAll(htmlRep, ''),
            tag,
            _widgets.length,
            _tocList.length,
            5);
        result = _helper.getTitleWidget(node, h6);
        break;
      //custom widget 入口
      case p:
        // log(53, 'enter p');
        // only called once

        //50 : Element
        // 51 : -<ff>def</ff>abc,p-
        // 53 : enter p
        // 52 : 1616596190345 from : markdown_helper.dart     md调用了一次
        // 52 : 1616596190345 <ff>def</ff>abc
        // 52 : 1616596190348 from : p.dart                   p自己又调用了一次,禁用p自己的调用方法
        // 52 : 1616596190348
        // 52 : 1616596190348 def
        // 52 : 1616596190348 abc
        result = _helper.getPWidget(node);
        break;
      case pre:
        result = _helper.getPreWidget(node);
        break;
      case ul:
        result = _helper.getUlWidget(node, 0);
        break;
      case ol:
        result = _helper.getOlWidget(node, 0);
        break;
      case hr:
        result = _helper.getHrWidget(node);
        break;
      case table:
        result = _helper.getTableWidget(node);
        break;
      case blockquote:
        result = _helper.getBlockQuote(node);
        break;
    }
    if (result == null)
      print('tag:$tag not catched! --- Text:${node.textContent} \n'
          'report bug:https://github.com/asjqkkkk/markdown_widget/issues/new/choose');
    return Container(
      child: result ?? Container(),
      margin: childMargin ??
          (result == null ? null : EdgeInsets.only(top: 5, bottom: 5)),
    );
  }

  void clear() {
    _tocList.clear();
    _widgets.clear();
  }
}

///Thanks for https://github.com/flutter/flutter_markdown/blob/4cc79569f6c0f150fc4e9496f594d1bfb3a3ff54/lib/src/widget.dart
class TaskListSyntax extends m.InlineSyntax {
  static final String _pattern = r'^ *\[([ xX])\] +';

  TaskListSyntax() : super(_pattern);

  @override
  bool onMatch(m.InlineParser parser, Match match) {
    m.Element el = m.Element.withTag('input');
    el.attributes['type'] = 'checkbox';
    el.attributes['disabled'] = 'true';
    el.attributes['checked'] = '${match[1].trim().isNotEmpty}';
    parser.addNode(el);
    return true;
  }
}
