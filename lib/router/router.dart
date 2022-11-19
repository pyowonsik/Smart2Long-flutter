import 'package:flutter/material.dart';
import 'package:s2longapp/features/listen/listen.dart';
import 'package:s2longapp/features/main/mainapp.dart';
import 'package:s2longapp/features/signin/SignInPage.dart';
import 'package:s2longapp/features/test/spellingtest.dart';
import 'package:s2longapp/features/test/wordtest.dart';
import 'dart:js';

final router = {
  '/': (BuildContext context) => SignInPage(),
  '/mainapp': (BuildContext context) => MainappPage(),
  '/wordtest': (BuildContext context) => WordTestPage(),
  '/spellingtest': (BuildContext context) => SpellingTest(),
  '/listen': (BuildContext context) => ListenPage(),

  // '/findid': (BuildContext context) => FindIDPage(),
  // '/findpw': (BuildContext context) => FindPwPage(),
  // '/signup': (BuildContext context) => SignUpPage(),
  // '/main': (BuildContext context) => MainPage(),
  // 'wordtest': (BuildContext context) => WordTestPage(),
  // 'wordtrytest':(BuildContext con
};
