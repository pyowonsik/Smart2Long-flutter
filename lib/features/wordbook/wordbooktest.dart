import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:s2longapp/features/listen/listen.dart';

const baseApiUrl = String.fromEnvironment('BASE_URL');
String answer = '';
String finalEmail = '';
String finalWord = '';
String finalMean = '다음을 누르시면 문제가 시작됩니다.';
var ResultO = 0;
var ResultX = 0;

var O = 0;
var X = 0;

var beforePage = 0;

// wordbook.length
String finalWordlen = '0';
var nextPage = 20;

class WordBookTestPage extends StatefulWidget {
  const WordBookTestPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => WordBookTestPage());
  }

  @override
  State<WordBookTestPage> createState() => _WordBookTestPage();
}

class _WordBookTestPage extends State<WordBookTestPage> {
  final formkey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  var Data = [];

  void initState() {
    getValidationTest();

    super.initState();
  }

  void stateInit() async {
    setState(() {
      finalResult = '다음을 누르시면 문제가 시작됩니다.';
      O = 0;
      X = 0;
      beforePage = 0;
    });
  }

  // 정답시 딜리트
  void deleteMean() async {
    var deleteData = {
      "email": finalEmail,
      "mean": finalMean,
    };
    var body = json.encode(deleteData);
    var url = Uri.parse("http://${baseApiUrl}/wordbook/deletemean");
    http.Response res = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
        body: body);
    print(res);
  }

  void getResultWord() async {
    var url =
        Uri.parse("http://${baseApiUrl}/trytest/getwordbookword/${finalEmail}");
    http.Response res = await http.get(url);

    Map<String, dynamic> jsonData = jsonDecode(res.body);

    print(jsonData['word']); // bebe 출력d

    if (Data.contains(jsonData['mean'])) {
      print('데이터 중복 !! ');
      getResultWord();
    } else {
      setState(() {
        finalWord = jsonData['word'];
        finalMean = jsonData['mean'];
      });
      // }
      Data.add(finalMean);
      print("getData : ");
      print(Data);
    }
  }

  Future getValidationTest() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      finalEmail = prefs.getString('email').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GrayBlueAppBar(
        appBar: AppBar(),
        title: "단어장(오답) Test",
        center: true,
        backgroundColor: const Color.fromRGBO(56, 8, 135, 1.0),
        // backgroundColor: const Color.fromRGBO(175, 180, 185, 1.0),
        key: null,
      ),
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
                          Text("오답 시험 ",
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
                          Text(finalMean,
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
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(56, 8, 135, 1.0),
                                      minimumSize: Size(100, 50),
                                    ),
                                    onPressed: () async {
                                      // print(finalWordlen);
                                      if (beforePage < nextPage + 1) {
                                        if (beforePage > 0 || beforePage != 0) {
                                          if (formkey.currentState!
                                              .validate()) {
                                            formkey.currentState!.save();
                                            print(" 정답(영어) : " + finalWord);
                                            print(" 정답(단어) : " + finalMean);
                                            print("내가 적은 답 : " + answer);
                                            if (finalWord != answer) {
                                              beforePage++;
                                              var url = Uri.parse(
                                                  "http://${baseApiUrl}/wordbook/getmeaninfo/${finalMean}");

                                              http.Response res =
                                                  await http.get(url);
                                              print(res.body);
                                              Map<String, dynamic> jsonData =
                                                  jsonDecode(res.body);
                                              print(jsonData);

                                              setState(() {
                                                X++;
                                              });
                                              _controller.clear();
                                            }
                                            if (finalWord == answer) {
                                              beforePage++;
                                              O++;
                                              deleteMean();
                                            }

                                            _controller.clear();
                                            getResultWord();
                                          }
                                        } else {
                                          _controller.clear();
                                          beforePage++;
                                          getResultWord();
                                          // getWordBookLength();
                                        }

                                        if ((O + X) == 20) {
                                          beforePage = 0;
                                          setState(() {
                                            ResultO = O;
                                            ResultX = X;
                                          });
                                          showEx(context);
                                          O = 0;
                                          X = 0;
                                        }
                                      }
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
          finalMean = '다음을 누르시면 문제가 시작됩니다.';
          O = 0;
          X = 0;
          beforePage = 0;
          // GoRouter.of(context).go('/main');
          // Navigator.pop(context);
          Navigator.pushNamed(context, '/mainapp');
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
                        finalMean = '다음을 누르시면 문제가 시작됩니다.';
                        // GoRouter.of(context).go('/ebook');
                        Navigator.pushNamed(context, '/mainapp');
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
