import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'package:s2longapp/common/CommonAppBar.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'package:s2longapp/features/navi/menu.dart';

String finalEmail = '';
String finalRe = '';

// String finalWordLen = '0';

const baseApiUrl = String.fromEnvironment('BASE_URL');

class MainappPage extends StatefulWidget {
  const MainappPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => MainappPage());
  }

  @override
  State<MainappPage> createState() => _MainappPageState();
}

class _MainappPageState extends State<MainappPage> {
  int _selectedIndex = 0;

  int mylibIndex = 0;
  // final List<Widget> pageList = <Widget>[
  //   HomePage(),
  //   EBookPage(),
  //   MclubPage(),
  //   Store()
  // ];

  @override
  void initState() {
    getValidationData();
    super.initState();

    // "ref"는 StatefulWidget의 모든 생명주기 상에서 사용할 수 있습니다.
  }

  // Future getWordBookLength() async {
  //   var url =
  //       Uri.parse("http://${baseApiUrl}/wordbook/getwordlength/${finalEmail}");
  //   http.Response res = await http.get(url);
  //   setState(() {
  //     finalWordLen = res.body;
  //   });
  //   return res.body;
  // }

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
                                            Navigator.pushNamed(
                                                context, '/wordbook');
                                          },
                                          icon: Image.asset(
                                              'assets/iconChevronR.png')),
                                    ),
                                  ],
                                ),
                              ),

                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(56, 8, 135, 1.0),
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
                                    Navigator.pushNamed(
                                        context, '/wordbooktest');
                                  },
                                  child: Text(
                                    '오답 시험',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(255, 255, 255, 1.0),
                                    ),
                                  ))
                              // CommonMdeckCard(text: "영어독립 365영어독립 365..."),
                            ],
                          )),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      //   backgroundColor: Color.fromRGBO(56, 8, 135, 1.0),
      //   type: BottomNavigationBarType.fixed,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //         activeIcon: Container(
      //           width: 48,
      //           height: 48,
      //           decoration: BoxDecoration(
      //               image: DecorationImage(
      //                   image: AssetImage("assets/iconHome.png")),
      //               color: Color.fromRGBO(255, 255, 255, 1.0),
      //               borderRadius: BorderRadius.circular(18)),
      //         ),
      //         icon: Image.asset(
      //           "assets/iconHomeDis.png",
      //         ),
      //         label: ""),
      //     BottomNavigationBarItem(
      //         activeIcon: Container(
      //           width: 48,
      //           height: 48,
      //           decoration: BoxDecoration(
      //               image: DecorationImage(
      //                   image: AssetImage("assets/iconLibrary.png")),
      //               color: Color.fromRGBO(255, 255, 255, 1.0),
      //               borderRadius: BorderRadius.circular(18)),
      //         ),
      //         icon: Image.asset("assets/iconLibraryDis.png"),
      //         label: ""),
      //     BottomNavigationBarItem(
      //         activeIcon: Container(
      //           width: 48,
      //           height: 48,
      //           decoration: BoxDecoration(
      //               image: DecorationImage(
      //                   image: AssetImage("assets/iconClub.png")),
      //               color: Color.fromRGBO(255, 255, 255, 1.0),
      //               borderRadius: BorderRadius.circular(18)),
      //         ),
      //         icon: Image.asset("assets/iconClubDis.png"),
      //         label: ""),
      //     BottomNavigationBarItem(
      //         activeIcon: Container(
      //           width: 48,
      //           height: 48,
      //           decoration: BoxDecoration(
      //               image: DecorationImage(
      //                   image: AssetImage("assets/iconStore.png")),
      //               color: Color.fromRGBO(255, 255, 255, 1.0),
      //               borderRadius: BorderRadius.circular(18)),
      //         ),
      //         icon: Image.asset("assets/iconStoreDis.png"),
      //         label: ""),
      //   ],
      // )
    );
  }
}

// void main() {
//   runApp(Testtts());
// }

// class Testtts extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: Home(),
//     );
//   }
// // }

// class Home extends StatelessWidget {
//   // var speed;

//   final FlutterTts tts = FlutterTts();
//   final TextEditingController controller =
//       TextEditingController(text: '속도를 클릭하시고 ,변환할 영어 단어 , 구문을 입력하세요.');

//   Home() {
//     tts.setLanguage('en');
//     tts.setSpeechRate(1.0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: controller,
//             ),
//             Container(
//               margin: EdgeInsets.all(10),
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   tts.speak(controller.text);
//                 },
//                 child: Text('변환'))
//           ],
//         ),
//       ),
//     );
//   }
// }

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
