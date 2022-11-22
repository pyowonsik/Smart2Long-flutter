import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:s2longapp/features/common/CommonAppBar.dart';
import 'dart:convert';
import 'package:s2longapp/features/navi/menu.dart';

const baseApiUrl = String.fromEnvironment('BASE_URL');
String finalScore = '';
String finalField = '';
String finalEmail = '';
// String finalClass = '';

String begginer = '초등영어';
String middler = '중등영어';
String higher = '고등영어';
String toiecer = '토익영어';

// String begginerresult = '0';
String begginerwordnum = '0';
String middlerwordnum = '0';
String higherwordnum = '0';
String toiecerwordnum = '0';

class SpellingTest extends StatefulWidget {
  const SpellingTest({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SpellingTest());
  }

  @override
  State<StatefulWidget> createState() => _SpellingTest();
}

class _SpellingTest extends State<SpellingTest> {
  // 모든 생명주기 동안 적용
  @override
  void initState() {
    getValidation();
    getBegginerWord();
    getMiddlerWord();
    getHigherrWord();
    getToiecerWord();
    super.initState();
  }

  void sendBegginer() async {
    var url = Uri.parse("http://${baseApiUrl}/trytest");
    var tryData = {
      "tryclass": begginer,
      // "renum": begginerwordnum,
    };
    var body = json.encode(tryData);
    http.Response res = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
        body: body);
    print(res);
    print(res.statusCode);
    if (res.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('sclass', begginer);
      print('test');
      Navigator.popAndPushNamed(context, '/spellingtrytest');
    }
    if (res.statusCode == 400) {
      GoRouter.of(context).go('/sbook');
    }
  }

  void sendMiddler() async {
    var url = Uri.parse("http://${baseApiUrl}/trytest");
    var tryData = {
      "tryclass": middler,
    };
    var body = json.encode(tryData);
    http.Response res = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
        body: body);
    print(res);
    print(res.statusCode);
    if (res.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('sclass', middler);
      print('test');
      // GoRouter.of(context).go('/stest');
      Navigator.popAndPushNamed(context, '/spellingtrytest');
    }
    if (res.statusCode == 400) {
      GoRouter.of(context).go('/sbook');
    }
  }

  void sendHigher() async {
    var url = Uri.parse("http://${baseApiUrl}/trytest");
    var tryData = {
      "tryclass": higher,
    };
    var body = json.encode(tryData);
    http.Response res = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
        body: body);
    print(res);
    print(res.statusCode);
    if (res.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('sclass', higher);
      print('test');
      Navigator.popAndPushNamed(context, '/spellingtrytest');
    }
    if (res.statusCode == 400) {
      GoRouter.of(context).go('/sbook');
    }
  }

  void sendToiecer() async {
    var url = Uri.parse("http://${baseApiUrl}/trytest");
    var tryData = {
      "tryclass": toiecer,
    };
    var body = json.encode(tryData);
    http.Response res = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
        body: body);
    print(res);
    print(res.statusCode);
    if (res.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('sclass', toiecer);
      print('test');
      Navigator.popAndPushNamed(context, '/spellingtrytest');
    }
    if (res.statusCode == 400) {
      GoRouter.of(context).go('/sbook');
    }
  }

  // // begginerRe 값 가져옴 --> 남은 단어수 달성률 모달로 변경
  // Future getBegginerRe() async {
  //   var url =
  //       Uri.parse("http://192.168.0.13:3000/signin/begginer/${finalEmail}");
  //   http.Response res = await http.get(url);
  //   setState(() {
  //     begginerresult = res.body;
  //   });
  //   return res.body;
  // }

  // begginerRe 값 가져옴
  Future getBegginerWord() async {
    var url = Uri.parse("http://${baseApiUrl}/trytest/numbegginer/${begginer}");
    http.Response res = await http.get(url);
    setState(() {
      begginerwordnum = res.body;
    });
    return res.body;
  }

  // begginerRe 값 가져옴
  Future getMiddlerWord() async {
    var url = Uri.parse("http://${baseApiUrl}/trytest/numbegginer/${middler}");
    http.Response res = await http.get(url);
    setState(() {
      middlerwordnum = res.body;
    });
    return res.body;
  }

  // begginerRe 값 가져옴
  Future getHigherrWord() async {
    var url = Uri.parse("http://${baseApiUrl}/trytest/numbegginer/${higher}");
    http.Response res = await http.get(url);
    setState(() {
      higherwordnum = res.body;
    });
    return res.body;
  }

  // begginerRe 값 가져옴
  Future getToiecerWord() async {
    var url = Uri.parse("http://${baseApiUrl}/trytest/numbegginer/${toiecer}");
    http.Response res = await http.get(url);
    setState(() {
      toiecerwordnum = res.body;
    });
    return res.body;
  }

  Future getValidation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      finalEmail = prefs.getString('email').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BlueMenuAppBar(
        appBar: AppBar(),
        title: "스펠링 Test",
        center: true,
        backgroundColor: const Color.fromRGBO(56, 8, 135, 1.0),
        // backgroundColor: const Color.fromRGBO(175, 180, 185, 1.0),
        key: null,
      ),
      drawer: MenuBar(),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '(스펠링 시험) 시험 수준을 선택하세요',
                          style: TextStyle(
                              color: Color.fromRGBO(56, 8, 135, 1.0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      height: 1,
                      color: Color(0xffe5e7e9),
                    ),
                    Column(
                      // shrinkWrap: true,
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                            decoration: BoxDecoration(
                              color: Color(0xffe5e7e9),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            // padding: EdgeInsets.fromLTRB(40, 30, 40, 36),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(12, 12, 20, 12),
                                    child: Image(
                                        image:
                                            AssetImage("assets/layer14.png")),
                                  ),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      begginer +
                                          "  (총 단어 개수 : " +
                                          begginerwordnum +
                                          ")",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(46, 10, 106, 1.0),
                                          fontSize: 15,
                                          letterSpacing: -0.4,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 1.0),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: IconButton(
                                      iconSize: 16,
                                      icon: Image.asset(
                                        'assets/triangle1694.png',
                                        color: Color.fromRGBO(56, 8, 135, 1.0),
                                      ),
                                      onPressed: () {
                                        sendBegginer();
                                      },
                                    ),
                                  ),
                                ]),
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                            decoration: BoxDecoration(
                              color: Color(0xffe5e7e9),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            // padding: EdgeInsets.fromLTRB(40, 30, 40, 36),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(12, 12, 20, 12),
                                    child: Image(
                                        image:
                                            AssetImage("assets/layer14.png")),
                                  ),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      middler +
                                          "  (총 단어 개수 : " +
                                          middlerwordnum +
                                          ")",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(46, 10, 106, 1.0),
                                          fontSize: 15,
                                          letterSpacing: -0.4,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 1.0),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: IconButton(
                                      iconSize: 16,
                                      icon: Image.asset(
                                        'assets/triangle1694.png',
                                        color: Color.fromRGBO(56, 8, 135, 1.0),
                                      ),
                                      onPressed: () {
                                        sendMiddler();
                                      },
                                    ),
                                  ),
                                ]),
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                            decoration: BoxDecoration(
                              color: Color(0xffe5e7e9),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            // padding: EdgeInsets.fromLTRB(40, 30, 40, 36),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(12, 12, 20, 12),
                                    child: Image(
                                        image:
                                            AssetImage("assets/layer14.png")),
                                  ),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      higher +
                                          "  (총 단어 개수 : " +
                                          higherwordnum +
                                          ")",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(46, 10, 106, 1.0),
                                          fontSize: 15,
                                          letterSpacing: -0.4,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 1.0),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: IconButton(
                                      iconSize: 16,
                                      icon: Image.asset(
                                        'assets/triangle1694.png',
                                        color: Color.fromRGBO(56, 8, 135, 1.0),
                                      ),
                                      onPressed: () {
                                        sendHigher();
                                      },
                                    ),
                                  ),
                                ]),
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                            decoration: BoxDecoration(
                              color: Color(0xffe5e7e9),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            // padding: EdgeInsets.fromLTRB(40, 30, 40, 36),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(12, 12, 20, 12),
                                    child: Image(
                                        image:
                                            AssetImage("assets/layer14.png")),
                                  ),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      toiecer +
                                          "  (총 단어 개수 : " +
                                          toiecerwordnum +
                                          ")",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(46, 10, 106, 1.0),
                                          fontSize: 15,
                                          letterSpacing: -0.4,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 1.0),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: IconButton(
                                      iconSize: 16,
                                      icon: Image.asset(
                                        'assets/triangle1694.png',
                                        color: Color.fromRGBO(56, 8, 135, 1.0),
                                      ),
                                      onPressed: () {
                                        sendToiecer();
                                      },
                                    ),
                                  ),
                                ]),
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
