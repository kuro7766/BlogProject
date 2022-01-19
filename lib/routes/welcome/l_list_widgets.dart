import 'package:blog_project/config.dart';
import 'package:blog_project/entity/new1_public_info_entity.dart';
import 'package:blog_project/routes/blog_list_main_content/logic.dart';
import 'package:blog_project/vars/configuration.dart';
import 'package:blog_project/vars/consts.dart';
import 'package:blog_project/vars/django_function.dart';
import 'package:blog_project/widgets/only/l_item.dart';
import 'package:blog_project/widgets/only/titile_widget.dart';
import 'package:blog_project/widgets/reusable/http_builder.dart';
import 'package:blog_project/widgets/reusable/over_lap_inkwell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class LUserContentList extends StatelessWidget {
  final MainContentLogic logic = Get.put(MainContentLogic());

  @override
  Widget build(BuildContext context) {
    return Cfg.isMobile?Container(color: Colors.white10,):Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitleCard(
          title: '广告',
          child: Text('广告位出租'),
        ),TitleCard(
          title: '广告',
          child: Text('广告位出租'),
        ),TitleCard(
          title: '广告',
          child: Text('广告位出租'),
        ),
      ],
    );
//     return HttpBuilder<New1PublicInfoEntity>(
//         url: DjangoUrl.getUserPublicInfoByName(Config.user),
//         builder: (context, j) {
//           return ListView(
//             children: [
//               ClipOval(
//                 child: SizedBox(
//                     height: 150,
//                     child: Image.network(
//                         'http://kuroweb.cf/picture/1615726693603.jpg')),
//               ),
//               OverlapInkwell(
//                 onTap: () {
//                   if (j.announcementLink != null)
//                     launch(j.announcementLink);
//                   else {
//                     Get.snackbar('提示', '用户未设置',
//                         snackPosition: SnackPosition.BOTTOM,
//                         colorText: Colors.white70);
//                   }
//                 },
//                 child: ConstrainedBox(
//                   constraints: BoxConstraints(
//                     minHeight: 100.0,
//                     // maxHeight: 30.0,
//                   ),
//                   child: Align(
//                     alignment: Alignment.topLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Text('${j.announcement ?? '无'}',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w900,
//                               color: Colors.white)),
//                     ),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text('导航',
//                     style: TextStyle(
//                         fontSize: Const.lTitleSize, color: Const.lTitleColor)),
//               ),
//               LItem(
//                 iconData: Icons.home_outlined,
//                 text: '首页',
//                 onTap: () {
//                   // Get.offNamed(Config.currentHomePageRoute);
// logic.toArticleList(home: true);
//                   // FocusScope.of(context).requestFocus(new FocusNode());
//                 },
//               ),
//               LItem(
//                 iconData: Icons.code_sharp,
//                 text: 'github',
//                 onTap: () {
//                   if (j.github != null)
//                     launch(j.github);
//                   else {
//                     Get.snackbar('提示', '用户未设置',
//                         snackPosition: SnackPosition.BOTTOM,
//                         colorText: Colors.white70);
//                   }
//                 },
//               ),
//               LItem(
//                 iconData: Icons.alternate_email,
//                 text: 'QQ',
//                 onTap: () {
//                   if (j.qq != null)
//                     launch(j.qq);
//                   else {
//                     Get.snackbar('提示', '用户未设置',
//                         snackPosition: SnackPosition.BOTTOM,
//                         colorText: Colors.white70);
//                   }
//                 },
//               ),
//               LItem(
//                 iconData: Icons.insert_link_sharp,
//                 text: '友链',
//                 onTap: () {
//                   // j.qq ?? launch(j.qq);
//                   logic.toFriendList();
//                 },
//               ),
//               LItem(
//                 iconData: Icons.create,
//                 text: 'CSDN',
//                 onTap: () {
//                   if (j.csdn != null)
//                     launch(j.csdn);
//                   else {
//                     Get.snackbar('提示', '用户未设置',
//                         snackPosition: SnackPosition.BOTTOM,
//                         colorText: Colors.white70);
//                   }
//                 },
//               ),
//               OverlapInkwell(
//                 onTap: () {
//                   if (j.game != null)
//                     launch(j.game);
//                   else {
//                     Get.snackbar('提示', '用户未设置',
//                         snackPosition: SnackPosition.BOTTOM,
//                         colorText: Colors.white70);
//                   }
//                 },
//                 color: Color(0xff3A3F51),
//                 child: SizedBox(
//                   height: Const.lItemSize,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.local_fire_department_sharp,
//                         color: Colors.red,
//                       ),
//                       Stack(
//                         children: [
//                           SizedBox(
//                             width: 80,
//                             height: 100,
//                             child: Center(
//                                 child: Text(
//                               '游戏',
//                               style: TextStyle(color: Colors.red),
//                             )),
//                           ),
//                           SizedBox(
//                             width: 80,
//                             height: 100,
//                             child: Align(
//                               alignment: Alignment.topRight,
//                               child: Text(
//                                 'hot',
//                                 style: TextStyle(color: Colors.red),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         });
  }
}
