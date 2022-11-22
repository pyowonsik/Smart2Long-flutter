import 'package:flutter/material.dart';
import 'package:s2longapp/features/listen/listen.dart';
import 'package:s2longapp/features/main/mainapp.dart';
import 'package:s2longapp/features/signin/signin.dart';
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

  // '/findid': (BuildContext context) => FindIDPage(),
  // '/findpw': (BuildContext context) => FindPwPage(),
  // '/signup': (BuildContext context) => SignUpPage(),
  // '/main': (BuildContext context) => MainPage(),
  // 'wordtest': (BuildContext context) => WordTestPage(),
  // 'wordtrytest':(BuildContext con
};
