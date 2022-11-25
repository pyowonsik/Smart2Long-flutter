import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:s2longapp/features/common/CommonAppBar.dart';

import 'package:s2longapp/features/navi/menu.dart';

const baseApiUrl = String.fromEnvironment('BASE_URL');
String finalScore = '';
String finalField = '';
String finalEmail = '';

String begginer = '초등영어';
String middler = '중등영어';
String higher = '고등영어';
String toiecer = '토익영어';

String begginerwordnum = '0';
String middlerwordnum = '0';
String higherwordnum = '0';
String toiecerwordnum = '0';

class WordTestPage extends StatefulWidget {
  const WordTestPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => WordTestPage());
  }

  @override
  State<StatefulWidget> createState() => _WordTestState();
}

class _WordTestState extends State<WordTestPage> {
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
      prefs.setString('class', begginer);
      print('test');
      // GoRouter.of(context).go('/test');
      Navigator.pushNamed(context, '/wordtrytest');
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
      prefs.setString('class', middler);
      print('test');
      Navigator.pushNamed(context, '/wordtrytest');
    }
    if (res.statusCode == 400) {
      GoRouter.of(context).go('/ebook');
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
      prefs.setString('class', higher);
      print('test');
      Navigator.pushNamed(context, '/wordtrytest');
    }
    if (res.statusCode == 400) {
      GoRouter.of(context).go('/ebook');
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
      prefs.setString('class', toiecer);
      print('test');
      Navigator.pushNamed(context, '/wordtrytest');
    }
    if (res.statusCode == 400) {
      GoRouter.of(context).go('/ebook');
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
        title: "Test",
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
                          '(영단어 시험) 시험 수준을 선택하세요',
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
                                    width: 190,
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
                                    width: 190,
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
                                    width: 190,
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
                                    width: 190,
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
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class ESmallBtn1 extends StatelessWidget {
  const ESmallBtn1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 32,
        child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: Color(0xff380887)),
                ),
              ),
            ),
            onPressed: () {
              GoRouter.of(context).push('/createtest');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('New',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xffffbc00))),
                Text(' Test ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xff380887))),
                Icon(Icons.add_circle_outline, color: Color(0xff380887)),
              ],
            )),
      ),
    );
  }
}

class ESmallBtn2 extends StatelessWidget {
  const ESmallBtn2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 32,
        child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: Color(0xff380887)),
                ),
              ),
            ),
            onPressed: () {
              print("test");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('E-Book ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xff380887))),
                Icon(Icons.add_circle_outline, color: Color(0xff380887)),
              ],
            )),
      ),
    );
  }
}

// 모달 팝업
void createTest(BuildContext context) {
  final _valueField = ['---', '  경   제  ', '  과   학  ', '  환   경  '];
  var _selectedField = '---';

  final _valueScore = ['---', '300-500', '500-700', '700-999'];
  var _selectedScore = '---';

  // void sendSignIn() async {
  //   var url = Uri.parse("http://192.168.35.195:3000/test");
  //   var signinData = {

  //   };
  //   var body = json.encode(signinData);

  //   http.Response res = await http.post(url,
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Access-Control-Allow-Origin": "*",
  //       },
  //       body: body);
  //   print(res);
  //   print(res.statusCode);

  //   if (res.statusCode == 200) {
  //     print('test');

  //     // final prefs = await SharedPreferences.getInstance();
  //     // prefs.setString('email', email);
  //   }
  // }

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          title: Container(
            constraints: BoxConstraints(
              minWidth: 358,
            ),
            padding: EdgeInsets.fromLTRB(20, 22, 20, 22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              color: Color(0xffaf97d7),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('iconHelpCopy2.png'),
                    Container(margin: EdgeInsets.fromLTRB(8, 0, 0, 0)),
                    Text('Test 추가',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: -0.45,
                          color: Color(0xff380887),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Image.asset('close.png')),
                  ],
                ),
              ],
            ),
          ),
          content: Container(
              constraints: BoxConstraints(
                maxHeight: 150,
                minWidth: 358,
              ),
              padding: EdgeInsets.fromLTRB(19, 16, 17, 24),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("점수"),
                      DropdownButton(
                          underline: SizedBox.shrink(),
                          value: _selectedScore,
                          items: _valueScore.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            value = value;
                            print(_selectedScore);
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("분야"),
                      DropdownButton(
                          underline: SizedBox.shrink(),
                          value: _selectedField,
                          items: _valueField.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            value = value;
                            print(_selectedField);
                          }),
                    ],
                  )
                ],
              )),
          actions: [
            Container(
              constraints: BoxConstraints(
                minWidth: 358,
              ),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      minWidth: 318,
                      minHeight: 54,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color(0xff380887),
                    ),
                    child: TextButton(
                      child: Text('확인',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                      onPressed: () {
                        print('modal test');
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      });
}
