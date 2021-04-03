import 'package:blog_project/vars/consts.dart';
import 'package:blog_project/widgets/reusable/over_lap_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoSubmit extends StatefulWidget {
  @override
  _PersonalInfoSubmitState createState() => _PersonalInfoSubmitState();
}

class _PersonalInfoSubmitState extends State<PersonalInfoSubmit> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color(0xffd9d9f3),
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  SizedBox(
                    width: 250,
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Colors.black,
                        primaryColorDark: Colors.black,
                      ),
                      child: new TextField(
                        controller: TextEditingController()..text = '666',
                        decoration: new InputDecoration(
                          labelText: '重置密码',
                          border: new OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Const.searchBarColor),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                          ),
                          enabledBorder: new OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Const.searchBarColor),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                          ),
                          // filled: true,
                          // hintStyle: new TextStyle(color: Colors.grey[800]),
                          // hintText: "密码",
                        ),
                      ),
                    ),
                  ),
                  OverlapInkwell(
                    onTap: (){
                      // simpleHttpRequest(url)
                      Get.snackbar('提示', '暂不支持');
                    },
                      color: Color(0xffd9d9f3),
                      child: Container(
                          padding: EdgeInsets.all(25), child: Text('修改'))),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
