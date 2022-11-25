import 'package:flutter/material.dart';
import 'package:s2longapp/features/listen/listen.dart';
import 'package:s2longapp/features/main/mainapp.dart';
import 'package:s2longapp/features/navi/secession.dart';
import 'package:s2longapp/features/navi/changepw.dart';
import 'package:s2longapp/features/navi/event.dart';
import 'package:s2longapp/features/navi/guide.dart';
import 'package:s2longapp/features/navi/myinfo.dart';
import 'package:s2longapp/features/navi/notice.dart';
import 'package:s2longapp/features/navi/setting.dart';
import 'package:s2longapp/features/signin/FindIdPage.dart';
import 'package:s2longapp/features/signin/FindPwPage.dart';
import 'package:s2longapp/features/signin/signin.dart';
import 'package:s2longapp/features/signup/signup.dart';
import 'package:s2longapp/features/test/spellingtest.dart';
import 'package:s2longapp/features/test/spellingtrytest.dart';
import 'package:s2longapp/features/test/wordtest.dart';
import 'package:s2longapp/features/test/wordtrytest.dart';
import 'package:s2longapp/features/wordbook/wordbook.dart';
import 'package:s2longapp/features/wordbook/wordbooktest.dart';

final router = {
  '/': (BuildContext context) => SignInPage(),
  '/mainapp': (BuildContext context) => MainAppPage(),
  '/wordtest': (BuildContext context) => WordTestPage(),
  '/spellingtest': (BuildContext context) => SpellingTest(),
  '/listen': (BuildContext context) => ListenPage(),
  '/wordbook': (BuildContext context) => WordBookPage(),
  '/wordbooktest': (BuildContext context) => WordBookTestPage(),
  '/wordtrytest': (BuildContext context) => WordTryTest(),
  '/spellingtrytest': (BuildContext context) => SpellingTryTest(),
  '/signup': (BuildContext context) => SignUpPage(),
  '/findid': (BuildContext context) => FindIDPage(),
  '/findpw': (BuildContext context) => FindPwPage(),
  '/event': (BuildContext context) => EventPage(),
  '/guide': (BuildContext context) => GuidePage(),
  '/myinfo': (BuildContext context) => MyInfoPage(),
  '/notice': (BuildContext context) => NoticePage(),
  '/setting': (BuildContext context) => SettingPage(),
  '/changepw': (BuildContext context) => ChangePwPage(),
  '/secession': (BuildContext context) => SecessionPage(),
};
