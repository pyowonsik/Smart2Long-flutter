import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:s2longapp/features/navi/menu.dart';
import '../common/CommonAppBar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../test/wordtest.dart';
import '../test/spellingtest.dart';
import '../listen/Listen.dart';
import '../wordbook/wordbook.dart';

String finalEmail = '';
String finalRe = '';

const baseApiUrl = String.fromEnvironment('BASE_URL');

class MainAppPage extends StatefulWidget {
  const MainAppPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => MainAppPage());
  }

  @override
  State<MainAppPage> createState() => _MainAppPage();
}

class _MainAppPage extends State<MainAppPage> {
  int _selectedIndex = 0;

  int mylibIndex = 0;

  @override
  void initState() {
    getValidationData();
    super.initState();

    // "ref"는 StatefulWidget의 모든 생명주기 상에서 사용할 수 있습니다.
  }

  Future getValidationData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email').toString();
    setState(() {
      finalEmail = email;
    });
    print(finalEmail);
  }

  final FlutterTts tts = FlutterTts();
  final TextEditingController controller = TextEditingController(text: '');

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      drawer: MenuBar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Scaffold(
            appBar: BlueLogoAppBar(
              appBar: AppBar(),
              center: true,
              backgroundColor: Color.fromRGBO(56, 8, 135, 1.0),
              key: null,
            ),
            drawer: MenuBar(),
            body: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      color: Color.fromRGBO(56, 8, 135, 1.0),
                      height: 192,
                      child: Align(
                          alignment: Alignment(0.0, -0.5),
                          child: Image.asset("assets/layer20.png")),
                    ),
                    Container(
                      color: Color.fromRGBO(255, 255, 255, 5.0),
                      height: 30,
                    ),
                    Positioned(
                        // bottom: -30,
                        child: Container(
                            padding: EdgeInsets.fromLTRB(37, 0, 40, 0),
                            height: 60,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    // padding: EdgeInsets.fromLTRB(64, 20, 23, 20),
                                    primary: Color.fromRGBO(255, 188, 0, 1.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                onPressed: () async {
                                  var url = Uri.parse(
                                      "http://${baseApiUrl}/wordbook/gettodayword/${finalEmail}");

                                  http.Response res = await http.get(url);

                                  print(res.body);
                                  Map<String, dynamic> jsonData =
                                      jsonDecode(res.body);
                                  print(jsonData['word']); // bebe 출력d
                                  print(jsonData['mean']); //
                                  setState(() {
                                    finalRe = jsonData['word'] +
                                        " : " +
                                        jsonData['mean'];
                                  });
                                  showEx(context);
                                },
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 2.5, 7, 0),
                                              child: Image(
                                                  image: AssetImage(
                                                      "assets/iconMdeckCheck.png")),
                                            ),
                                            Text(
                                              "TODAY'S ",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      56, 8, 135, 1.0),
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              "WORD",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      56, 8, 135, 1.0),
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                        right: 0,
                                        child: Container(
                                          // alignment: Alignment.center,

                                          margin:
                                              EdgeInsets.fromLTRB(0, 4, 0, 0),
                                          child: Image(
                                              image: AssetImage(
                                                  "assets/iconArrowR.png")),
                                        )),
                                  ],
                                )))),
                  ],
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image(
                                            image: AssetImage(
                                                "assets/iconBook_color.png")),
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(7, 0, 0, 0),
                                          child: Text(
                                            "영어 단어 시험",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    46, 10, 106, 1.0),
                                                fontSize: 24),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: IconButton(
                                          onPressed: () {
                                            // setState(() {
                                            //   _selectedIndex = 1;
                                            // });
                                            // GoRouter.of(context).go('/EBook');
                                            Navigator.pushNamed(
                                                context, '/wordtest');
                                          },
                                          icon: Image.asset(
                                              'assets/iconChevronR.png')),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image(
                                            image: AssetImage(
                                                "assets/iconBook_color.png")),
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(7, 0, 0, 0),
                                          child: Text(
                                            "영어 스펠링 시험",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    46, 10, 106, 1.0),
                                                fontSize: 24),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: IconButton(
                                          onPressed: () {
                                            // setState(() {
                                            //   _selectedIndex = 1;
                                            // });
                                            Navigator.pushNamed(
                                                context, '/spellingtest');
                                          },
                                          icon: Image.asset(
                                              'assets/iconChevronR.png')),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(40, 30, 40, 36),
                          height: 280,
                          color: Color.fromRGBO(255, 188, 0, 1.0),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        // Image(
                                        //     image: AssetImage(
                                        //         "assets/iconClubCopy.png")),
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(7, 0, 0, 0),
                                          child: Text(
                                            "Listen",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    46, 10, 106, 1.0),
                                                fontSize: 24),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: IconButton(
                                          onPressed: () {
                                            // setState(() {
                                            //   _selectedIndex = 2;
                                            // });
                                            Navigator.pushNamed(
                                                context, '/listen');
                                          },
                                          icon: Image.asset(
                                              'assets/iconChevronR.png')),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                height: 150,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
                                      child: Text(
                                        "TTS(Text To Speak) 기능",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                46, 10, 106, 1.0),
                                            fontSize: 15),
                                      ),
                                    ),
                                    TextField(
                                      controller: controller,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(10, 30, 10, 10),
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromRGBO(56, 8, 135, 1.0),
                                          minimumSize: Size(200, 40),
                                        ),
                                        // style: ButtonStyle(
                                        //   foregroundColor:
                                        //       MaterialStateProperty.all<
                                        //           Color>(
                                        //     Color.fromRGBO(56, 8, 135, 1.0),
                                        //   ),
                                        //   backgroundColor:
                                        //       MaterialStateProperty.all<
                                        //           Color>(
                                        //     Color.fromRGBO(56, 8, 135, 1.0),
                                        //   ),
                                        // ),
                                        onPressed: () {
                                          tts.speak(controller.text);
                                          controller.clear();
                                        },
                                        child: Text(
                                          '변  환',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1.0),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(40, 30, 40, 36),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image(
                                            image: AssetImage(
                                                "assets/iconDeck_color.png")),
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(7, 0, 0, 0),
                                          child: Text(
                                            "단어장",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    46, 10, 106, 1.0),
                                                fontSize: 24),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: IconButton(
                                          onPressed: () {
                                            // setState(() {
                                            //   _selectedIndex = 3;
                                            // });
                                            Navigator.pushNamed(
                                                context, '/wordbook');
                                          },
                                          icon: Image.asset(
                                              'assets/iconChevronR.png')),
                                    ),
                                  ],
                                ),
                              ),
                              // CommonMdeckCard(text: "영어독립 365영어독립 365..."),
                            ],
                          )),
                    ],
                  ),
                ))
              ],
            ),
          ),
          WordTestPage(),
          SpellingTest(),
          ListenPage(),
          WordBookPage(),
        ],
      ),
    );
  }
}

// 모달 팝업
void showEx(BuildContext context) {
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
                    Text("오늘의 단어",
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
                minWidth: 358,
              ),
              padding: EdgeInsets.all(18),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(finalRe,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.45,
                      )),
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
                        Navigator.of(context).pop();
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
