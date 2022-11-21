import 'package:flutter/material.dart';
import 'package:s2longapp/features/navi/menu.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

const baseApiUrl = String.fromEnvironment('BASE_URL');

String finalClass = '';
String answer = '';
String finalEmail = '';
String finalWord = '다음을 누르시면 문제가 시작됩니다.';
String finalMean = '';
var ResultO = 0;
var ResultX = 0;

var O = 0;
var X = 0;

String PostEmail = '';
String PostWord = '';
String PostMean = '';
String PostEx = '';
var beforePage = 0;
var nextPage = 20;

class WordTryTest extends StatefulWidget {
  const WordTryTest({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => WordTryTest());
  }

  @override
  State<WordTryTest> createState() => _WordTryTest();
}

class _WordTryTest extends State<WordTryTest> {
  final formkey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  var Data = [];

  // final List<Problems> _problems = [];

  // Future<List<Problems>> fetchJson() async {
  //   var url =
  //       Uri.parse("http://192.168.0.13:3000/trytest/getwordlist/${finalClass}");

  //   http.Response res = await http.get(url);

  //   List<Problems> problemlist = [];
  //   var urjson = json.decode(res.body);
  //   for (var jsonData in urjson) {
  //     problemlist.add(Problems.fromJson(jsonData));
  //   }

  //   return problemlist;
  // }

  void initState() {
    // fetchJson().then((value) {
    //   setState(() {
    //     _problems.addAll(value);
    //   });
    // });

    getValidationTest();
    super.initState();
  }

  void getResultWord() async {
    var url =
        Uri.parse("http://${baseApiUrl}/trytest/getfirstword/${finalClass}");
    http.Response res = await http.get(url);

    Map<String, dynamic> jsonData = jsonDecode(res.body);

    print(jsonData['word']); // bebe 출력d

    // if (getDatas.contains(jsonData['word'])) {
    //   getResultWord();
    // } else {

    if (Data.contains(jsonData['word'])) {
      print('데이터 중복 !! ');
      getResultWord();
    } else {
      setState(() {
        finalWord = jsonData['word'];
        finalMean = jsonData['mean'];
      });
      // }
      Data.add(finalWord);
      print("getData : ");
      print(Data);
    }
  }

  Future getValidationTest() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      finalClass = prefs.getString('class').toString();
      finalEmail = prefs.getString('email').toString();
    });
    print(finalClass);
  }

  void sendWordInfo() async {
    var url = Uri.parse("http://${baseApiUrl}/wordbook/insertword");

    var insertData = {
      "email": PostEmail,
      "word": PostWord,
      "mean": PostMean,
      "ex": PostEx
    };
    var body = jsonEncode(insertData);
    print(insertData);
    http.Response res = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
        body: body);
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GrayBlueAppBar(
        appBar: AppBar(),
        title: "영단어 Test",
        center: true,
        backgroundColor: const Color.fromRGBO(56, 8, 135, 1.0),
        // backgroundColor: const Color.fromRGBO(175, 180, 185, 1.0),
        key: null,
      ),
      drawer: MenuBar(),
      body: Container(
        color: Color.fromRGBO(243, 239, 253, 1.0),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  color: Color.fromRGBO(56, 8, 135, 1.0),
                  height: 192,
                  child: Align(
                      alignment: Alignment(0.0, -0.5),
                      child: Column(
                        children: [
                          Container(margin: EdgeInsets.fromLTRB(0, 36, 0, 0)),
                          Text(finalClass,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(255, 188, 0, 1.0))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('$beforePage',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(255, 255, 255, 1.0),
                                  )),
                              Text(' / ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(255, 255, 255, 1.0),
                                  )),
                              Text(
                                '$nextPage',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(175, 151, 215, 1.0),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(16),
              height: 300,
              width: 400,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(254, 254, 254, 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 51, 33, 29),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(finalWord,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(255, 188, 0, 1.0))),
                          Text('  맞은 개수 : ' + '$O',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(255, 188, 0, 1.0))),
                          Text('  틀린 개수 : ' + '$X',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(255, 188, 0, 1.0))),
                        ],
                      ),
                      Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Container(
                                child: Container(
                              height: 48,
                              margin: const EdgeInsets.fromLTRB(0, 15, 0, 22),
                              child: TextFormField(
                                  controller: _controller,
                                  onSaved: (value) {
                                    setState(() {
                                      answer = value!;
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return '단어를 입력하세요 !!';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xfff1f4f8),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      border: OutlineInputBorder(),
                                      hintText: '')),
                            )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(56, 8, 135, 1.0),
                                      minimumSize: Size(100, 50),
                                    ),
                                    onPressed: () async {
                                      var url = Uri.parse(
                                          "http://${baseApiUrl}/wordbook/getwordinfo/${finalWord}");

                                      http.Response res = await http.get(url);
                                      print(res.body);
                                      Map<String, dynamic> jsonData =
                                          jsonDecode(res.body);
                                      print(jsonData);

                                      // print(jsonData['email']);
                                      // print(jsonData['word']);
                                      // print(jsonData['mean']);
                                      // print(jsonData['ex']);
                                      setState(() {
                                        // 체크시  40페이지에서 다음을 누르면  틀린것과 email고ㅏ 함께 wordbook 에서 insert
                                        PostEmail = finalEmail;
                                        PostWord = jsonData['word'];
                                        PostMean = jsonData['mean'];
                                        PostEx = jsonData['ex'];
                                      });

                                      print(PostEmail +
                                          PostWord +
                                          PostMean +
                                          PostEx);
                                      sendWordInfo();
                                    },
                                    child: Text('check')),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                ),
                                // ElevatedButton(
                                //     onPressed: () {
                                //       if (beforePage == nextPage) {
                                //         GoRouter.of(context).push('/ebook');
                                //         setState(() {
                                //           _controller.clear();

                                //           beforePage = 0;
                                //           finalWord = "----";
                                //         });
                                //       } else {
                                //         showError(context);
                                //       }
                                //     },
                                //     child: Text('완료')),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(56, 8, 135, 1.0),
                                      minimumSize: Size(100, 50),
                                    ),
                                    onPressed: () async {
                                      print(beforePage);
                                      if (beforePage < nextPage + 1) {
                                        if (beforePage > 0 || beforePage != 0) {
                                          if (formkey.currentState!
                                              .validate()) {
                                            formkey.currentState!.save();
                                            print(" 정답(영어) : " + finalWord);
                                            print(" 정답(단어) : " + finalMean);
                                            print("내가 적은 답 : " + answer);
                                            if (finalMean != answer) {
                                              beforePage++;
                                              var url = Uri.parse(
                                                  "http://${baseApiUrl}/wordbook/getwordinfo/${finalWord}");

                                              http.Response res =
                                                  await http.get(url);
                                              // print(res.body);
                                              Map<String, dynamic> jsonData =
                                                  jsonDecode(res.body);
                                              // print(jsonData);

                                              // print(jsonData['email']);
                                              // print(jsonData['word']);
                                              // print(jsonData['mean']);
                                              // print(jsonData['ex']);

                                              setState(() {
                                                // 체크시  40페이지에서 다음을 누르면  틀린것과 email고ㅏ 함께 wordbook 에서 insert
                                                X++;

                                                PostEmail = finalEmail;
                                                PostWord = jsonData['word'];
                                                PostMean = jsonData['mean'];
                                                PostEx = jsonData['ex'];
                                              });

                                              // print(PostEmail +
                                              //     PostWord +
                                              //     PostMean +
                                              //     PostEx);

                                              _controller.clear();
                                              sendWordInfo();
                                            }
                                            if (finalMean == answer) {
                                              beforePage++;
                                              O++;
                                            }

                                            // var newData = Data.toSet();
                                            // print(newData.length);
                                            // if (newData.length != beforePage) {
                                            //   getResultWord();
                                            //   _controller.clear();
                                            //   setState(() {
                                            //     beforePage == newData.length;
                                            //   });
                                            // }

                                            // print(Data);
                                            // for (var i = 0;
                                            //     i < Data.length;
                                            //     i++) {
                                            //   print(Data[i]);
                                            // }
                                            // // 공통 단어일때
                                            // if (Data.contains(
                                            //     jsonData['word'])) {
                                            //   print('same word 한번더 출력!!');
                                            //   print(Data);
                                            //   _controller.clear();
                                            //   getResultWord();
                                            // }

                                            // if (Data.contains(finalWord)) {
                                            //   print('공통 Word !!');
                                            //   print(Data);
                                            //   getResultWord();
                                            // }

                                            _controller.clear();
                                            getResultWord();
                                          }
                                        } else {
                                          _controller.clear();
                                          beforePage++;
                                          getResultWord();
                                        }

                                        if ((O + X) == 20) {
                                          beforePage = 0;
                                          setState(() {
                                            ResultO = O;
                                            ResultX = X;
                                          });
                                          showEx(context);
                                          Data.clear();
                                          O = 0;
                                          X = 0;
                                        }
                                        print(finalWord);
                                      }

                                      // setState(() {
                                      //   // 마지막 문제전
                                      //   if (beforePage < nextPage) {
                                      //     if (beforePage > 0 ||
                                      //         beforePage != 0) {
                                      //       // answer와 finalResult의 mean을 get해온 값과 같다면 넘어가고 O++ , else X-- insertwords
                                      //     }
                                      //   } else {}

                                      //   // 문제가 끝났을경우
                                      // });
                                    },
                                    child: Text('다음'))
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonBefore extends StatelessWidget {
  const CommonBefore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: FloatingActionButton(
        backgroundColor: Color.fromRGBO(56, 8, 135, 1.0),
        child: Text('이전',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            )),
        onPressed: () {},
      ),
    );
  }
}

class CommonNext extends StatelessWidget {
  const CommonNext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: FloatingActionButton(
        backgroundColor: Color.fromRGBO(56, 8, 135, 1.0),
        child: Text('다음',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            )),
        onPressed: () {},
      ),
    );
  }
}

class GrayBlueAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GrayBlueAppBar(
      {Key? key,
      this.center = false,
      required this.appBar,
      required this.title,
      required this.backgroundColor})
      : super(key: key);

  final AppBar appBar;
  final String title;
  final bool center;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          finalWord = '다음을 누르시면 문제가 시작됩니다.';
          O = 0;
          X = 0;
          beforePage = 0;
          // GoRouter.of(context).go('/ebook');
          Navigator.pop(context);
        },
        color: Colors.white,
        icon: Image.asset("assets/iconArrowBackCopy2.png"),
      ),
      centerTitle: center,
      title: Text(
        "$title",
        style: const TextStyle(fontSize: 24),
      ),
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
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
                    Text("Success",
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
                  Text('맞은 개수 ' + '$ResultO',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.45,
                      )),
                  Text('/ 틀린 개수' + '$ResultX',
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
                      onPressed: () async {
                        finalWord = '다음을 누르시면 문제가 시작됩니다.';
                        GoRouter.of(context).go('/ebook');
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
