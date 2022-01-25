import 'package:blog_project/util/getx_debug_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

class B2BlockSyntax extends md.BlockSyntax {
  // static const String _pattern = r'.*\[\[warning\]\](.*)$';
  static const String _pattern = r'.*warning(.*)$';
  @override
  RegExp get pattern => RegExp(_pattern);

  B2BlockSyntax();

  @override
  md.Node parse(md.BlockParser parser) {
    Dbg.log('w','wrn');

    var childLines = parseChildLines(parser);

    var content = childLines.join('\n');
    Dbg.log(content,'ctt');
    final md.Element el = md.Element('p', [
      md.Element('warning', [md.Text(content)]),
    ]);

    return el;
  }

}

class WarningBuilder extends MarkdownElementBuilder {

  @override
  Widget visitText(md.Text text, TextStyle preferredStyle) {

    return Text(text.text, style: preferredStyle.apply(fontWeightDelta: 2));
  }
  @override
  Widget visitElementAfter(md.Element element, TextStyle preferredStyle) {
    return Builder(builder: (context) {

      return Container(
        width: double.infinity,
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
              child: const Text('Warning !', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Text(element.textContent, style: preferredStyle),
          ],
        ),
      );
    });
  }
}