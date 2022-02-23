import 'dart:html';

import 'package:blog_project/config.dart';
import 'package:flutter/material.dart';

class Const {
  // static const baseUrl = 'http://127.0.0.1:8000/';

  static const baseUrl = 'http://kuroweb.cf:8085/';
  static const displayMarkdownUrl =
      'http://kuroweb.cf/ci/MarkDownRenderer/index.html';
  static const eruptUrl = 'http://localhost:8084/#/passport/login';

  static const weather = baseUrl + 'apis?type=weather';

  // static const displayMarkdownUrl = 'http://127.0.0.1:8813/index.html';

  static var leftTopTitle = '首页';

  // static var leftTopTitle='kuroの小站';
  static const barHeight = 85.0;

  static get leftFlex => DynamicConfig.isMobile ? 0 : 2;
  static var iFrameId = 'myiframe';

  static const rightFlex = 15;
  static const cardColor = Colors.white70;
  static const barColor = Color(0xFF7266BA);
  static const appBarColor = Color(0xFF7266BA);

  static get normalTextSize => DynamicConfig.isMobile ? 30.0 : 22.0;
  static const rListDefaultGap = 25.0;
  static const loginDividerHeight = 50.0;
  static const defaultUser = 'kuro';
  static const searchBarColor = Color(0xFFFFFFFF);

  static const loginImgUrl = 'http://kuroweb.cf/picture/1615892316837.jpg';
  static const emptyImgUrl = 'http://kuroweb.cf/picture/1615892316837.jpg';

  // static var music = [
  //   ["//music.163.com/outchain/player?type=2&id=28561001&auto=1&height=66","BOYS DON'T CRY - Key Sounds Label"],
  //   ["https://music.163.com/outchain/player?type=2&id=26131698&auto=1&height=66","恋文 - やなぎなぎ"],
  // ];

  static const lTitleColor = Colors.white;
  static const lTitleSize = 20.0;
  static const lItemSize = 50.0;
}
