import 'package:blog_project/util/debug.dart';
import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as m;
import 'input.dart';
import 'a.dart';
import 'img.dart';
import 'code.dart';
import 'video.dart';
import 'markdown_tags.dart';
import '../config/html_support.dart';
import '../config/style_config.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class P {
  P._internal();

  static P _instance;

  factory P() {
    _instance ??= P._internal();
    return _instance;
  }

  // 可能是孩子递归发生入口
  //  getPWidget
  //    - buildWebRichText
  //      - buildBlockWidgets 递归
  //         - 可能执行 (if Text) buildWebTextWidget
  //            - 可能执行 (if nodes not empty) getPWidget 递归
  ///Tag:  p
  Widget getPWidget(List<m.Node> children, m.Node parentNode,
      {TextStyle textStyle,
      bool selectable,
      TextConfig textConfig,
      WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.center,
      String from}) {
    //input
    //<img src='http://kuroweb.cf/picture/1615892316837.jpg'>fff</img>
    //
    // result:
    //51 : -<img src='http://kuroweb.cf/picture/1615892316837.jpg'>fff</img>,p-
    // 52 : 1616593243501 <img src='http://kuroweb.cf/picture/1615892316837.jpg'>fff</img>
    // 52 : 1616593243508
    // 52 : 1616593243508 fff
    // 50 : Element
    // 51 : -<img src='http://kuroweb.cf/picture/1615892316837.jpg'>fff</img>,p-
    // 52 : 1616593243639 <img src='http://kuroweb.cf/picture/1615892316837.jpg'>fff</img>
    // 这个的意思是img和img的孩子是两个不同组件的children ,
    // 52 : 1616593243640
    // 这个孩子什么含义？
    // 52 : 1616593243640 fff
    // 这个又是社么意思

    //初步分析：
    // children发生了二次构建

    //测试1 56
    // <red>abc</red>def
    //56 : 1616633072116 from : markdown_helper.dart
    // 56 : 1616633072116 <red>abc</red>def,Text
    // 54 : 1616633072118 : <red>abc</red>def,Text
    // 56 : 1616633072120 from : p.dart 1
    // 56 : 1616633072120 ,Element
    // 56 : 1616633072120 abc,Text
    // 56 : 1616633072120 def,Text

    //测试2 递归 56
    //<red>a<red>bc</red>def
    //56 : 1616633234163 from : markdown_helper.dart
    // 56 : 1616633234163 <red>a<red>bc</red>def,Text
    // 54 : 1616633234165 : <red>a<red>bc</red>def,Text
    // 56 : 1616633234171 from : p.dart 1
    // 56 : 1616633234171 ,Element
    // 56 : 1616633234171 a,Text
    // 56 : 1616633234171 ,Element
    // 56 : 1616633234171 bc,Text

    // var t = DateTime.now().millisecondsSinceEpoch;
    // log(56, '$t from : $from');
    // children.forEach((element) {
    //   log(56,
    //       '$t ' + element.textContent + ',' + element.runtimeType.toString());
    // });
    final configSelectable =
        selectable ?? StyleConfig().pConfig?.selectable ?? true;
    return isWeb()
        ? buildWebRichTextReturnToPWidget(children, parentNode, textStyle,
            configSelectable, crossAxisAlignment, textConfig)
        : buildRichText(
            children, parentNode, textStyle, configSelectable, textConfig);
  }

  bool isWeb() => kIsWeb;

  ///see this issue:https://github.com/flutter/flutter/issues/42086
  ///flutter web can't use WidgetSpan now.so this is another solution
  ///you can also use this in mobile，but it will finally be replaced by [buildRichText]
  ///
  ///
  /// 由p widget调用
  Widget buildWebRichTextReturnToPWidget(
      List<m.Node> nodes,
      m.Node parentNode,
      TextStyle style,
      bool selectable,
      WrapCrossAlignment crossAxisAlignment,
      TextConfig textConfig) {
    if (nodes == null) return Container();

    //PWidget最终返回的组件
    List<Widget> children = [];

    final config = StyleConfig()?.pConfig;

    //  nodes 打印结果是一样的
    // var t = DateTime.now().millisecondsSinceEpoch;
    // nodes.forEach((element) {
    //   log(53, '$t :' + element.textContent);
    // });

    // custom tag child entrance
    //  52 : 1616595011745 <img src='http://kuroweb.cf/picture/1615892316837.jpg'>fff</img>
    // 52 : 1616595011748 from : p.dart
    // 52 : 1616595011748
    // 52 : 1616595011748 fff
    //todo more investigation

    buildBlockWidgets(
        nodes,
        parentNode,
        style ?? config?.textStyle ?? defaultPStyle,
        children,
        selectable,
        textConfig);
    return Wrap(
      children: children,
      crossAxisAlignment: crossAxisAlignment,
    );
  }

  RichText buildRichText(List<m.Node> children, m.Node parentNode,
      TextStyle textStyle, bool selectable, TextConfig textConfig) {
    final config = StyleConfig().pConfig;

    //RichText Inline span
    // rich text 富文本
    return RichText(
      softWrap: true,
      text: getBlockSpan(
        children,
        parentNode,
        textStyle ?? config?.textStyle ?? defaultPStyle,
        selectable: selectable,
      ),
      textAlign: textConfig?.textAlign ??
          config?.textConfig?.textAlign ??
          TextAlign.start,
      textDirection:
          textConfig?.textDirection ?? config?.textConfig?.textDirection,
    );
  }

  //todo : more investigation
  InlineSpan getBlockSpan(
      List<m.Node> nodes, m.Node parentNode, TextStyle parentStyle,
      {bool selectable = true}) {
    if (nodes == null || nodes.isEmpty) return TextSpan();
    return TextSpan(
      children: List.generate(
        nodes.length,
        (index) {
          bool shouldParseHtml = needParseHtml(parentNode);
          final node = nodes[index];

          if (node is m.Text)
            return buildTextSpan(
                node, parentStyle, shouldParseHtml, selectable);
          else if (node is m.Element) {
            if (node.tag == code) return getCodeSpan(node);
            if (node.tag == img) return getImageSpan(node);
            if (node.tag == video) return getVideoSpan(node);
            if (node.tag == a) return getLinkSpan(node);
            if (node.tag == input) return getInputSpan(node);
            if (node.tag == other) return getOtherWidgetSpan(node);
            return getBlockSpan(
              node.children,
              node,
              parentStyle.merge(getTextStyle(node.tag)),
              selectable: selectable,
            );
          }
          return TextSpan();
        },
      ),
    );
  }

  InlineSpan buildTextSpan(m.Text node, TextStyle parentStyle,
      bool shouldParseHtml, bool selectable) {
    final nodes = shouldParseHtml ? parseHtml(node) : [];
    if (nodes.isEmpty) {
      return selectable
          ? WidgetSpan(child: SelectableText(node.text, style: parentStyle))
          : TextSpan(text: node.text, style: parentStyle);
    } else {
      return getBlockSpan(nodes, node, parentStyle, selectable: selectable);
    }
  }

  //p widget 具体实现类
  void buildBlockWidgets(
      List<m.Node> nodes,
      m.Node parentNode,
      TextStyle parentStyle,
      List<Widget> widgets, //p widget 继承下来的 children
      bool selectable,
      TextConfig textConfig) {
    if (nodes == null || nodes.isEmpty) return;
    var t = DateTime.now().millisecondsSinceEpoch;
    nodes.forEach((node) {
      bool shouldParseHtml = needParseHtml(parentNode);
      //54 : 1616597940361 : <red>abc</red>,Text
      // 54 : 1616597940362 : ,Element
      // 54 : 1616597940362 : abc,Text

      //例2
      //<red>abc<red></red>
      // 这也是为什么它用了child[0]作为custom标签
      //54 : 1616598887590 : <red>abc<red></red>,Text
      // 54 : 1616598887593 : ,Element    这个和后面的</red>算一个
      // 54 : 1616598887593 : abc,Text
      // 54 : 1616598887593 : ,Element
      log(
          54,
          '$t : ' +
              node.textContent +
              ',' +
              node.runtimeType.toString() +
              ',' +
              shouldParseHtml.toString());
      if (node is m.Text) {
        ////54 : 1616598887590 : <red>abc<red></red>,Text
        //它不add，因为是纯文字?

        //因为ta有孩子，所以本身不加入，孩子本身保存了全部的信息

        //58 : true,<red>abc<red></red>,| parsed : 3|
        // 60 : 1616634458098 : ,Element,true
        // 60 : 1616634458098 : abc,Text,true
        // 60 : 1616634458098 : ,Element,true
        buildWebTextWidget(widgets, node, selectable, shouldParseHtml,
            parentStyle, textConfig);
      } else if (node is m.Element) {
        log(41, node.tag);
        if (node.tag == code)
          widgets.add(defaultCodeWidget(node));
        else if (node.tag == img)
          widgets.add(defaultImageWidget(node.attributes));
        else if (node.tag == video)
          widgets.add(defaultVideoWidget(node.attributes));
        else if (node.tag == a)
          widgets.add(defaultAWidget(node));
        else if (node.tag == input)
          widgets.add(defaultCheckBox(node.attributes));
        else if (node.tag == other)
          widgets.add(getOtherWidget(node));
        else
          //递归
          buildBlockWidgets(
              node.children,
              node,
              parentStyle.merge(getTextStyle(node.tag)),
              widgets,
              selectable,
              textConfig);
      }
    });
  }

  void buildWebTextWidget(
    List<Widget> widgets,
    m.Text node,
    bool selectable,
    bool shouldParseHtml,
    TextStyle parentStyle,
    TextConfig textConfig,
  ) {
    final nodes = shouldParseHtml ? parseHtml(node) : [];

    //58 : true,<red>abc<red></red>,| parsed : 3|
    // 60 : 1616634458098 : ,Element,true
    // 60 : 1616634458098 : abc,Text,true
    // 60 : 1616634458098 : ,Element,true
    // 59 : false,abc,| parsed : 0|
    // 如果有nodes存在，一定是当前的节点标签，应该把它加入到children[0]这里来，这个方法本身也应该是递归的

    //测试3 嵌套测试
    //58 : true,<r>rr<b>bbBB</b>RR</r>888,| parsed : 6|
    // 60 : 1616638119449 : ,Element,true
    // 60 : 1616638119449 : rr,Text,true
    // 60 : 1616638119449 : ,Element,true
    // 60 : 1616638119449 : bbBB,Text,true
    // 60 : 1616638119449 : RR,Text,true
    // 60 : 1616638119449 : 888,Text,true
    // 它这是一下子解析完了，估计嵌套是不支持了
    // 如果在这里一下子就能解析好，就不用管递归的事情了
    var t = DateTime.now().millisecondsSinceEpoch;
    if (shouldParseHtml) {
      log(
          58,
          shouldParseHtml.toString() +
              ',' +
              node.textContent +
              ',' +
              '| parsed : ${nodes?.length}|');
      nodes.forEach((element) {
        log(
            60,
            '$t : ' +
                element.textContent +
                ',' +
                element.runtimeType.toString() +
                ',' +
                shouldParseHtml.toString());
      });
    } else {
      log(
          59,
          shouldParseHtml.toString() +
              ',' +
              node.textContent +
              ',' +
              '| parsed : ${nodes?.length}|');
      nodes.forEach((element) {
        log(
            60,
            '$t : ' +
                element.textContent +
                ',' +
                element.runtimeType.toString() +
                ',' +
                shouldParseHtml.toString());
      });
    }

    final config = StyleConfig()?.pConfig;
    if (nodes.isEmpty) {
      widgets.add(selectable
          ? SelectableText(
              node.text,
              style: parentStyle,
              textAlign: textConfig?.textAlign ?? config?.textConfig?.textAlign,
              textDirection: textConfig?.textDirection ??
                  config?.textConfig?.textDirection,
            )
          : Text(
              node.text,
              style: parentStyle,
              textAlign: textConfig?.textAlign ?? config?.textConfig?.textAlign,
              textDirection: textConfig?.textDirection ??
                  config?.textConfig?.textDirection,
            ));
    } else {
      //把孩子重复加入 ， 孩子的tag后期被标记为other
      widgets.add(getPWidget(nodes, node,
          textStyle: parentStyle,
          from: 'p.dart 1',
          selectable: selectable,
          textConfig: textConfig));
    }
  }
}

class PConfig {
  final TextStyle textStyle;
  final TextStyle linkStyle;
  final TextStyle delStyle;
  final TextStyle emStyle;
  final TextStyle strongStyle;
  final TextConfig textConfig;
  final bool selectable;
  final OnLinkTap onLinkTap;
  final LinkGesture linkGesture;
  final Custom custom;

  PConfig({
    this.textStyle,
    this.linkStyle,
    this.delStyle,
    this.emStyle,
    this.strongStyle,
    this.textConfig,
    this.onLinkTap,
    this.selectable,
    this.linkGesture,
    this.custom,
  });
}

class TextConfig {
  final TextAlign textAlign;
  final TextDirection textDirection;

  TextConfig({this.textAlign, this.textDirection});
}

typedef void OnLinkTap(String url);
typedef Widget LinkGesture(Widget linkWidget, String url);
//children[0] is always the start tag
//like <a>123<r></a>
//children.length=3
//children[0]=<a>
//children[1]=123
//children[2]=<r>
typedef Widget Custom(m.Element element);
