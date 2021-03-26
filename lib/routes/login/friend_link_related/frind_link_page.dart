import 'package:blog_project/widgets/only/base_scaffold.dart';
import 'package:blog_project/widgets/reusable/dbg_container.dart';
import 'package:flutter/material.dart';

class FriendLinkPage extends StatefulWidget {
  @override
  _FriendLinkPageState createState() => _FriendLinkPageState();
}

class _FriendLinkPageState extends State<FriendLinkPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(child: DbgContainer());
  }
}
