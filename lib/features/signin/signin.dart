/*
 * Copyright (c) 2021 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const baseApiUrl = String.fromEnvironment('BASE_URL');

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SignInPage());
  }

  @override
  Widget build(BuildContext context) {
    print("## _SignInStat`e ##");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(48, 140, 48, 78),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/vectorSmartObject.png'),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 79, 0, 0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(11, 0, 0, 0),
                      ),
                      Text('LOGIN',
                          style: TextStyle(
                            color: Color(0xff380887),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                  ),
                  SignInForm2(),
                  Container(margin: EdgeInsets.fromLTRB(0, 22, 0, 0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Container(
                      //       margin: EdgeInsets.fromLTRB(11, 0, 0, 0),
                      //     ),
                      //     Checkbox(
                      //       value: false,
                      //       onChanged: (value) {
                      //         //    setState(() {
                      //         //     value = true;
                      //         //    });
                      //       },
                      //       side: BorderSide(
                      //         color: Colors.indigo,
                      //         width: 2,
                      //       ),
                      //     ),
                      //     Text('자동 로그인',
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //         )),
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('아이디 찾기',
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: -0.4,
                              )),
                          Container(
                            margin: EdgeInsets.fromLTRB(13, 0, 0, 0),
                          ),
                          IconButton(
                            icon: Image.asset('assets/iconChevronRCopy3.png'),
                            onPressed: () {
                              // GoRouter.of(context).push('/findid');

                              Navigator.pushNamed(context, '/findid');
                              print("find id test");
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('비밀번호 찾기',
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: -0.4,
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(13, 0, 0, 0),
                      ),
                      IconButton(
                        icon: Image.asset('assets/iconChevronRCopy3.png'),
                        onPressed: () {
                          // GoRouter.of(context).push('/findpassword');

                          Navigator.pushNamed(context, '/findpw');
                          print("find password test");
                        },
                      )
                    ],
                  ),
                  // Container(
                  //   height: 1,
                  //   margin: EdgeInsets.fromLTRB(0, 31, 0, 32),
                  //   color: Color(0xffe5e7e9),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(('회원가입'),
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: -0.4,
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(13, 0, 0, 0),
                      ),
                      IconButton(
                        icon: Image.asset('assets/iconChevronRCopy3.png'),
                        onPressed: () {
                          // GoRouter.of(context).push('/signup');
                          Navigator.pushNamed(context, '/signup');
                          print("siginup test");
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  // void saveLoginState(BuildContext context) {
  //   Provider.of<LoginState>(context, listen: false).loggedIn = true;
  // }
}

// signin 사용
class SignInForm2 extends ConsumerStatefulWidget {
  const SignInForm2({Key? key}) : super(key: key);

  @override
  SignInForm2State createState() => SignInForm2State();
}

class SignInForm2State extends ConsumerState<SignInForm2> {
  @override
  void initState() {
    super.initState();
    sendSignIn();
    // "ref"는 StatefulWidget의 모든 생명주기 상에서 사용할 수 있습니다.
  }

  // String encryptModule(String plainText) {
  //   if (plainText.isEmpty) return "";
  //   final key =
  //       en.Key.fromBase64('hNN6kace0I+sNA0sNAYWG7EQptjuJGVaXG/Qy86h75c=');
  //   final iv = en.IV.fromBase64('zGF3s3lCsJdu9a5Y1t6Hyw==');
  //   final encrypter = en.Encrypter(en.AES(key, mode: en.AESMode.cbc));
  //   final encrypted = encrypter.encrypt(plainText, iv: iv);
  //   return encrypted.base64;
  // }

  final formkey = GlobalKey<FormState>();

  String email = "";
  String passwd = "";

  void sendSignIn() async {
    if (baseApiUrl.isEmpty) {
      throw AssertionError('BASE_URL is not set');
    }
    var url = Uri.parse("http://${baseApiUrl}/signin");
    var signinData = {
      "email": email,
      "passwd": passwd,
    };
    var body = json.encode(signinData);

    http.Response res = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
        body: body);
    print(res);
    print(res.statusCode);

    if (res.statusCode == 200) {
      print('test');
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email);
      prefs.setString('sclass', '최초접속!!');
      prefs.setString('class', '최초접속!!');
      // print(prefs.getString('email'));
      // var data = prefs.getString('email');
      // data = data.toString();
      // Get.to(MainPage());
      // GoRouter.of(context).go('/main');
      Navigator.pushNamed(context, '/mainapp');
    }
    if (res.statusCode == 400) {
      GoRouter.of(context).go('/');
    }
    if (res.statusCode == 401) {
      GoRouter.of(context).go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkey,
        child: Column(children: [
          Column(
            children: [
              // FutureBuilder(builder: builder) - 자동로그인
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        onSaved: (value) {
                          setState(() {
                            email = value!;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter some text';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xfff1f4f8),
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Color(0xffafb4b9),
                            ),
                            hintText: 'ID')),
                    // controller: emailTextController),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        onSaved: (value) {
                          setState(() {
                            passwd = value!;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter some text';
                          }
                          return null;
                        },
                        enableSuggestions: false,
                        autocorrect: false,
                        obscureText: true,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xfff1f4f8),
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xffafb4b9),
                            ),
                            hintText: 'Password')),
                    // controller: passwordTextController),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              ),
              Container(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff380887)),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(21)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: const BorderSide(
                                  color: Color.fromRGBO(56, 8, 135, 1.0)),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();

                            sendSignIn();
                            print("이메일: " + email + "\n비밀번호: " + passwd);
                          }
                        },
                        child: const Text('로그인',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ]));
  }
}
