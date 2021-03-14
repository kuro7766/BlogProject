import 'package:blog_project/md_widgets/markdown_widget.dart';
import 'package:blog_project/state/right_page_list.dart';
import 'package:blog_project/state/right_page_md.dart';
import 'package:blog_project/tests.dart';
import 'package:blog_project/util/debug.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../consts.dart';

class InnerLayerContainer extends StatefulWidget {
  ///todo : params how to build widget
  @override
  // State createState() => RightListMdState();
  State createState() => RightList();
}
