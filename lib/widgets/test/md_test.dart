import 'dart:convert';

import 'package:blog_project/config.dart';
import 'package:blog_project/util/getx_debug_tool.dart';
import 'package:blog_project/util/http_request.dart';
import 'package:blog_project/util/simple_http_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:http/http.dart' as http;
class B2BlockSyntax extends md.BlockSyntax {
  // static const String _pattern = r'.*\[\[warning\]\](.*)$';

  // 至少要有一个group
  // static const String _pattern = r'^(.*)warning.*$';
  static const String _pattern = r'^(.*)faf.*$';

  @override
  RegExp get pattern => RegExp(_pattern);

  B2BlockSyntax();

  @override
  md.Node parse(md.BlockParser parser) {
    Dbg.log(parser.current, 'wrn');

    var childLines = parseChildLines(parser);

    var content = childLines.join('\n');
    Dbg.log(content, 'ctt');
    final md.Element el = md.Element('p', [
      md.Element('warning', [md.Text(content)]),
    ]);
    // final md.Element el = md.Element('warning', [md.Text(content)]);
    return el;
  }
}

class WarningBuilder extends MarkdownElementBuilder {
  @override
  void visitElementBefore(md.Element element) {
    super.visitElementBefore(element);
    Dbg.log(element.textContent, 'xxx');
  }

  @override
  Widget visitText(md.Text text, TextStyle preferredStyle) {
    return Text(text.text, style: preferredStyle.apply(fontWeightDelta: 2));
  }

  @override
  Widget visitElementAfter(md.Element element, TextStyle preferredStyle) {
    return Builder(builder: (context) {
      return Container(
        // width: double.infinity,
        width: 300,
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(left: BorderSide(color: Colors.red, width: 2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: const Text('Warning !',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Text(element.textContent, style: preferredStyle),
          ],
        ),
      );
    });
  }
}

class InlineLatexSyntax extends md.InlineSyntax {
  InlineLatexSyntax(String pattern) : super(pattern);

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    var displayText = match[1];

    var el = md.Element('latex', [md.Text(displayText)]);
    el.attributes['type'] = 'highlight';

    parser.addNode(el);
    return true;
  }
}

class LatexTermBuilder extends MarkdownElementBuilder {
  @override
  void visitElementBefore(md.Element element) {}

  @override
  Widget visitText(md.Text text, TextStyle style) {
    return Container();
  }

  @override
  Widget visitElementAfter(md.Element element, TextStyle preferredStyle) {
    var img=Image.network(
        r'http://chart.apis.google.com/chart?cht=tx&chs=20&chl='+element.textContent,fit: BoxFit.fitHeight,
    );
  //  wrap img with maxed width less than 200
    return Container(constraints: BoxConstraints(
      maxHeight: 15,
      maxWidth: DynamicConfig.blogContentWidth,
    ),child: img);
  //   return SimpleHttpBuilder(httpFuture: ()async{
  //     var r=await http.post(Uri.parse('https://e1kf0882p7.execute-api.us-east-1.amazonaws.com/default/latex2image'),headers: {
  //       'Content-Type': 'application/json'
  //
  //     },body: jsonEncode({
  //       'latexInput': '\\begin{align*} and \\end{align*}',
  //       'outputFormat': 'PNG',
  //       'outputScale': '125%'
  //     }));
  //     return ResponseContent.success(r);
  //   }(),
  //   builder: (data){
  //     Dbg.log(data,'ddd');
  //     return Text('***');
  //   },);
    // $.ajax({
    // url: 'https://e1kf0882p7.execute-api.us-east-1.amazonaws.com/default/latex2image',
    // type: 'POST',
    // dataType: 'json',
    // data: JSON.stringify({
    // latexInput: latexInput,
    // outputFormat: $('#outputFormatSelect').val(),
    // outputScale: $('#outputScaleSelect').val()
    // }),
    // success: show,
    // error: function(data) {
    // if (data.responseJSON) { // Deliberate error 500 with an error message
    // show(data.responseJSON);
    // } else {
    // show({ error: 'There was an error communicating with server. Please check your internet connection.' });
    // }
    // }
    // });
  }
}
