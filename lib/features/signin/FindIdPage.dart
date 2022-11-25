import 'package:flutter/material.dart';
import '../common/commonBottomBtn.dart';
import '/features/common/CommonAppBar.dart';
import '/features/common/CommonRow.dart';
import '/features/common/CommonTextInput.dart';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';
import 'dart:convert';

const baseApiUrl = String.fromEnvironment('BASE_URL');
String PostName = '';
String PostPhone = '';
String findEmail = '';
void main() {
  runApp(const FindIDPage());
}

class FindIDPage extends StatefulWidget {
  const FindIDPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => FindIDPage());
  }

  @override
  State<FindIDPage> createState() => _FindIDPage();
}

class _FindIDPage extends State<FindIDPage> {
  final formkey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GrayBlueAppBar(
          appBar: AppBar(),
          title: "아이디 찾기",
          center: true,
          // backgroundColor: const Color.fromRGBO(56, 8, 135, 1.0),
          backgroundColor: const Color.fromRGBO(175, 180, 185, 1.0),
          key: null,
        ),
        body: Form(
            key: formkey,
            child: Container(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CommonRow(
                    text: "이름 입력",
                  ),
                  TextFormField(
                      onSaved: (value) {
                        setState(() {
                          PostName = value!;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                          height: 2.9,
                          color: Color.fromRGBO(175, 180, 185, 1.0),
                          fontSize: 16,
                          letterSpacing: -0.4,
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(241, 244, 248, 1.0),
                            )),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(241, 244, 248, 1.0),
                            )),
                        filled: true,
                        fillColor: const Color.fromRGBO(241, 244, 248, 1.0),
                        focusColor: const Color.fromRGBO(241, 244, 248, 1.0),
                        hoverColor: const Color.fromRGBO(241, 244, 248, 1.0),
                        hintText: "이름 입력",
                        // suffix: suffix,
                        // suffix: SizedBox(
                        //     width: 102,
                        //     height: 32,
                        //     child: ElevatedButton(
                        //         onPressed: () {},
                        //         style: ElevatedButton.styleFrom(
                        //             primary: const Color.fromRGBO(56, 8, 135, 1.0)),
                        //         child: const Text("이메일 인증"))),
                      )),
                  CommonRow(
                    text: "전화번호 입력",
                  ),
                  TextFormField(
                      controller: _controller,
                      onSaved: (value) {
                        setState(() {
                          PostPhone = value!;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                          height: 2.9,
                          color: Color.fromRGBO(175, 180, 185, 1.0),
                          fontSize: 16,
                          letterSpacing: -0.4,
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(241, 244, 248, 1.0),
                            )),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(241, 244, 248, 1.0),
                            )),
                        filled: true,
                        fillColor: const Color.fromRGBO(241, 244, 248, 1.0),
                        focusColor: const Color.fromRGBO(241, 244, 248, 1.0),
                        hoverColor: const Color.fromRGBO(241, 244, 248, 1.0),
                        hintText: "전화번호 '-' 없이 입력",
                        // suffix: suffix,
                        // suffix: SizedBox(
                        //     width: 102,
                        //     height: 32,
                        //     child: ElevatedButton(
                        //         onPressed: () {},
                        //         style: ElevatedButton.styleFrom(
                        //             primary: const Color.fromRGBO(56, 8, 135, 1.0)),
                        //         child: const Text("이메일 인증"))),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                        child: Text('비밀번호 찾기',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: -0.4,
                            )),
                      ),
                      IconButton(
                          onPressed: () {
                            // GoRouter.of(context).push('/findpassword');

                            Navigator.pushNamed(context, '/findpw');
                          },
                          icon: Image.asset('assets/iconChevronRCopy5.png')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                        child: Text('회원가입',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: -0.4,
                            )),
                      ),
                      IconButton(
                          onPressed: () {
                            // GoRouter.of(context).push('/signup');

                            Navigator.pushNamed(context, '/signup');
                          },
                          icon: Image.asset('assets/iconChevronRCopy5.png')),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    height: 1,
                    color: Color(0xffe5e7e9),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                      height: 54,
                      child: Row(
                        children: [
                          Expanded(
                            child: CommonBottomBtn1(
                              text: "확인",
                              onPressed: () async {
                                if (formkey.currentState!.validate()) {
                                  formkey.currentState!.save();
                                  var url = Uri.parse(
                                      "http://${baseApiUrl}/signin/getemail/${PostName}/${PostPhone}");
                                  http.Response res = await http.get(url);

                                  print(res.body);
                                  Map<String, dynamic> jsonData =
                                      jsonDecode(res.body);
                                  setState(() {
                                    findEmail = jsonData['email'];
                                  });
                                  print(findEmail);
                                  showEx(context);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
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
                    Text('아이디 찾기 결과',
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
            padding: EdgeInsets.fromLTRB(19, 16, 17, 24),
            color: Colors.white,
            child: Text("Email : " + findEmail,
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
                        // GoRouter.of(context).go('/');

                        Navigator.pushNamed(context, '/');
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
