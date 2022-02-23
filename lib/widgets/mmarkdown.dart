import 'package:blog_project/widgets/test/md_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

class MMarkdown extends StatelessWidget {
  final String data;
  const MMarkdown({this.data,Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: this.data,

//             """
// B Hello **bold**
// sfdasd
// xxx warning **bold**
// """r

      // """
      // B Hello **bold**
      //
      // [[warning]] warning **bold**
      // """

      selectable: true,
      builders: <String, MarkdownElementBuilder>{
        // 'warning': WarningBuilder(),
        'latex':LatexTermBuilder()
      },
      inlineSyntaxes: [
        InlineLatexSyntax((r'\$(.*?)\$'))
      ],
      // blockSyntaxes: [
      //   // B2BlockSyntax(),
      //   B2BlockSyntax(),
      // ],
      onTapLink: (String text, String href, String title) async {
        var fail = !await launch(href);
        if (fail) {
          Get.snackbar('Error', 'Could not open link',
              snackPosition: SnackPosition.BOTTOM);
        }
      },
    );
  }
}
