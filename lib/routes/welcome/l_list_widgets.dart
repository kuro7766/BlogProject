import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:math';
import 'dart:typed_data';

import 'package:blog_project/config.dart';
import 'package:blog_project/entity/new1_public_info_entity.dart';
import 'package:blog_project/routes/blog_gate/logic.dart';
import 'package:blog_project/util/getx_debug_tool.dart';
import 'package:blog_project/unused/configuration.dart';
import 'package:blog_project/consts.dart';
import 'package:blog_project/unused/django_function.dart';
import 'package:blog_project/widgets/only/l_item.dart';
import 'package:blog_project/widgets/only/titile_widget.dart';
import 'package:blog_project/widgets/reusable/http_builder.dart';
import 'package:blog_project/widgets/reusable/over_lap_inkwell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:url_launcher/url_launcher.dart';

class LUserContentList extends StatelessWidget {
  final GlobalLogic logic = Get.put(GlobalLogic());

  @override
  Widget build(BuildContext context) {

    // add it to your class as a static member


    Dbg.log('fff');
    return Cfg.isMobile
        ? Container(
            color: Colors.white10,
          )
        : Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TitleCard(
                //   title: 'Debug',
                //   child: GridView(
                //     shrinkWrap: true,
                //     children: [
                //       ElevatedButton(
                //           onPressed: () {
                //             // Get.find<MainContentLogic>().toArticleList(home: true);
                //             Get.offNamed(
                //                 '/entrance?user=dslfjk${Random().nextInt(99)}',
                //                 preventDuplicates: true);
                //             // Get.currentRoute
                //           },
                //           child: Text('1')),
                //
                //     ],
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 3),
                //   ),
                // ),
                TitleCard(
                  title: '联系方式',
                  child: Text('2280315050@qq.com'),
                ),
                TitleCard(
                  title: '广告',
                  child: Text('一个朋友\nvx:lh168b 王者代练/陪玩 黑奴在线'),
                ),
                TitleCard(
                  title: '广告',
                  child: Text('广告位出租'),
                ),
                TitleCard(
                  title: '广告',
                  child: Text('广告位出租'),
                ),  TitleCard(
                  title: '广告',
                  child: Text('广告位出租'),
                ),
              ],
            ),
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
