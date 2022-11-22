import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:s2longapp/features/wordbook/Words.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:s2longapp/features/common/CommonAppBar.dart';
import 'package:s2longapp/features/navi/menu.dart';

const baseApiUrl = String.fromEnvironment('BASE_URL');
String finalEmail = '';
String finalEx = '';

class WordBookPage extends StatefulWidget {
  const WordBookPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => WordBookPage());
  }

  @override
  State<StatefulWidget> createState() => _WordBookState();
}

class _WordBookState extends State<WordBookPage> {
  final List<Words> _words = [];

  Future<List<Words>> fetchJson() async {
    var url = Uri.parse(
        "http://${baseApiUrl}/wordbook/getwordbooklist/${finalEmail}");

    http.Response res = await http.get(url);

    List<Words> wordlist = [];
    var urjson = json.decode(res.body);
    for (var jsonData in urjson) {
      wordlist.add(Words.fromJson(jsonData));
    }
    return wordlist;
  }

  void initState() {
    fetchJson().then((value) {
      setState(() {
        _words.addAll(value);
      });
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BlueMenuAppBar(
        appBar: AppBar(),
        title: "나의 단어장",
        center: true,
        backgroundColor: const Color.fromRGBO(56, 8, 135, 1.0),
        // backgroundColor: const Color.fromRGBO(175, 180, 185, 1.0),
        key: null,
      ),
      drawer: MenuBar(),

      // return Dismissible(
      //             key: Key(items[index]),
      //             onDismissed: (direction) {
      //               setState(() {
      //                 items.removeAt(index);
      //               });
      //             },

      body: ListView.builder(
          itemCount: _words.length,
          itemBuilder: (context, index) {
            return Dismissible(
              // key: Key(_words[index].toString()),
              key: Key(_words[index].toString()),
              onDismissed: (direction) async {
                var deleteData = {
                  "email": finalEmail,
                  "word": _words[index].word,
                };
                var body = json.encode(deleteData);
                var url = Uri.parse("http://${baseApiUrl}/wordbook/deleteword");
                http.Response res = await http.post(url,
                    headers: {
                      "Content-Type": "application/json",
                      "Access-Control-Allow-Origin": "*",
                    },
                    body: body);
                print(res);
                _words.removeAt(index);
              },

              child: ListTile(
                title: Text(
                  _words[index].word.toString() +
                      " / " +
                      _words[index].mean.toString(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                onLongPress: () async {
                  var url = Uri.parse(
                      "http://${baseApiUrl}/wordbook/getexample/${_words[index].word}");

                  http.Response res = await http.get(url);
                  print(res.body);
                  Map<String, dynamic> jsonData = jsonDecode(res.body);
                  print(jsonData);
                  // Map<String, dynamic>jsonData = jsonDecode(res.body);
                  print(jsonData["word"]); // bebe 출력d
                  print(jsonData["ex"]); //
                  setState(() {
                    finalEx = jsonData["ex"];
                  });
                  print(finalEx);
                  showEx(context);
                },
              ),
              background: Container(
                alignment: Alignment.center,
                color: Colors.red,
                child: Text(
                  "삭제",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              //
            );
          }),
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
                    Image.asset('assets/iconHelpCopy2.png'),
                    Container(margin: EdgeInsets.fromLTRB(8, 0, 0, 0)),
                    Text('예문',
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
                        icon: Image.asset('assets/close.png')),
                  ],
                ),
              ],
            ),
          ),
          content: Container(
            constraints: BoxConstraints(
              minWidth: 358,
            ),
            padding: EdgeInsets.fromLTRB(19, 16, 17, 24),
            color: Colors.white,
            child: Text(finalEx,
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: -0.45,
                )),
          ),
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
                      minWidth: 200,
                      minHeight: 50,
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
