import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:s2longapp/features/common/CommonAppBar.dart';

import 'package:s2longapp/features/navi/menu.dart';

String finalEmail = '';
String finalText = "";
String finalResult = "";
String finalClass = "";
String finalWord = "";
String finalMean = "";
var finalSpeed = 1.0;
const baseApiUrl = String.fromEnvironment('BASE_URL');

class ListenPage extends StatefulWidget {
  const ListenPage({Key? key}) : super(key: key);

  @override
  State<ListenPage> createState() => _ListenPageState();
}

class _ListenPageState extends State<ListenPage> {
  final FlutterTts tts = FlutterTts();
  final TextEditingController controller =
      TextEditingController(text: '속도를 클릭하시고 ,변환할 영어 단어 , 구문을 입력하세요.');

  @override
  void initStatae() {
    getValidationData();
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email').toString();
    setState(() {
      finalEmail = email;
    });
    print(finalEmail);
  }

  _MclubPageState() {
    tts.setLanguage("kor");
    tts.setSpeechRate(finalSpeed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BlueMenuAppBar(
        appBar: AppBar(),
        title: "Listen",
        center: true,
        backgroundColor: const Color.fromRGBO(56, 8, 135, 1.0),
        // backgroundColor: const Color.fromRGBO(175, 180, 185, 1.0),
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
                color: Color.fromRGBO(255, 255, 255, 6.0),
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
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {},
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 2.5, 7, 0),
                                        child: Image(
                                            image: AssetImage(
                                                "assets/iconMdeckCheck.png")),
                                      ),
                                      Text(
                                        "Test 단어 듣기",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(56, 8, 135, 1.0),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // Text(
                                      //   "",
                                      //   style: TextStyle(
                                      //       color:
                                      //           Color.fromRGBO(56, 8, 135, 1.0),
                                      //       fontSize: 20),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                              // Positioned(
                              //     right: 0,
                              //     child: Container(
                              //       // alignment: Alignment.center,
                              //       margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                              //       child: Image(
                              //           image: AssetImage(
                              //               "assets/iconArrowR.png")),
                              //     )),
                            ],
                          )))),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       '국적 선택 : ',
                  //       style: TextStyle(
                  //           color: Color.fromRGBO(56, 8, 135, 1.0),
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //     ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Color.fromRGBO(56, 8, 135, 1.0),
                  //           minimumSize: Size(100, 50),
                  //         ),
                  //         onPressed: () {},
                  //         child: Text(
                  //           '한국',
                  //           style: TextStyle(
                  //               fontSize: 15, fontWeight: FontWeight.bold),
                  //         )),
                  //     Container(
                  //       margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  //     ),
                  //     ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Color.fromRGBO(56, 8, 135, 1.0),
                  //           minimumSize: Size(100, 50),
                  //         ),
                  //         onPressed: () {},
                  //         child: Text(
                  //           '미국',
                  //           style: TextStyle(
                  //               fontSize: 15, fontWeight: FontWeight.bold),
                  //         )),
                  //     Container(
                  //       margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  //     ),
                  //     ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Color.fromRGBO(56, 8, 135, 1.0),
                  //           minimumSize: Size(100, 50),
                  //         ),
                  //         onPressed: () {},
                  //         child: Text(
                  //           '영국',
                  //           style: TextStyle(
                  //               fontSize: 15, fontWeight: FontWeight.bold),
                  //         )),
                  //     // ElevatedButton(
                  //     // onPressed: () {
                  //     //   tts.speak(controller.text);
                  //     // },
                  //     // child: Text('변환'))
                  //   ],
                  // ),
                  // Container(
                  //   margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  // ),
                  Column(
                    children: [
                      Text(
                        '듣기 메뉴 선택',
                        style: TextStyle(
                            color: Color.fromRGBO(56, 8, 135, 1.0),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(56, 8, 135, 1.0),
                            minimumSize: Size(200, 70),
                          ),
                          onPressed: () async {
                            var url = Uri.parse(
                                "http://${baseApiUrl}/listen/listenwordmean/초등영어");

                            http.Response res = await http.get(url);

                            print(res.body);
                            Map<String, dynamic> jsonData =
                                jsonDecode(res.body);
                            // print(jsonData['word']);
                            // print(jsonData['mean']);

                            finalWord = jsonData['word'];
                            finalMean = jsonData['mean'];
                            setState(() {
                              finalWord = jsonData['word'];
                              finalMean = jsonData['mean'];
                            });

                            tts.speak(finalWord + finalMean);
                          },
                          child: Text(
                            '초등영어',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(56, 8, 135, 1.0),
                            minimumSize: Size(200, 70),
                          ),
                          onPressed: () async {
                            var url = Uri.parse(
                                "http://${baseApiUrl}/listen/listenwordmean/중등영어");

                            http.Response res = await http.get(url);

                            print(res.body);
                            Map<String, dynamic> jsonData =
                                jsonDecode(res.body);

                            finalWord = jsonData['word'];
                            finalMean = jsonData['mean'];
                            setState(() {
                              finalWord = jsonData['word'];
                              finalMean = jsonData['mean'];
                            });

                            tts.speak(finalWord + finalMean);
                          },
                          child: Text(
                            '중등영어',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(56, 8, 135, 1.0),
                            minimumSize: Size(200, 70),
                          ),
                          onPressed: () async {
                            var url = Uri.parse(
                                "http://${baseApiUrl}/listen/listenwordmean/고등영어");

                            http.Response res = await http.get(url);

                            print(res.body);
                            Map<String, dynamic> jsonData =
                                jsonDecode(res.body);
                            // print(jsonData['word']);
                            // print(jsonData['mean']);

                            finalWord = jsonData['word'];
                            finalMean = jsonData['mean'];
                            setState(() {
                              finalWord = jsonData['word'];
                              finalMean = jsonData['mean'];
                            });

                            tts.speak(finalWord + finalMean);
                          },
                          child: Text(
                            '고등영어',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(56, 8, 135, 1.0),
                            minimumSize: Size(200, 70),
                          ),
                          onPressed: () async {
                            var url = Uri.parse(
                                "http://${baseApiUrl}/listen/listenwordmean/토익영어");

                            http.Response res = await http.get(url);

                            print(res.body);
                            Map<String, dynamic> jsonData =
                                jsonDecode(res.body);
                            // print(jsonData['word']);
                            // print(jsonData['mean']);

                            finalWord = jsonData['word'];
                            finalMean = jsonData['mean'];
                            setState(() {
                              finalWord = jsonData['word'];
                              finalMean = jsonData['mean'];
                            });

                            tts.speak(finalWord + finalMean);
                          },
                          child: Text(
                            '토익영어',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                  ),
                  // TextField(
                  //   controller: controller,
                  // ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Word : " + finalWord,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(56, 8, 135, 1.0),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      ),
                      Text(
                        "Mean : " + finalMean,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(56, 8, 135, 1.0),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
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


