import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/features/common/CommonAppBar.dart';
import '/features/common/CommonRow.dart';
import 'package:http/http.dart' as http;

const baseApiUrl = String.fromEnvironment('BASE_URL');

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GrayBlueAppBar(
          appBar: AppBar(),
          title: "회원정보 입력",
          center: true,
          // backgroundColor: const Color.fromRGBO(56, 8, 135, 1.0),
          backgroundColor: const Color.fromRGBO(175, 180, 185, 1.0),
          key: null,
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.fromLTRB(28, 16, 28, 41),
              child: Column(
                children: [
                  SignInForm(),
                ],
              )),
        ));
  }
}

// signup 사용
class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends ConsumerState<SignInForm> {
  @override
  void initState() {
    super.initState();
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

  final _formkey = GlobalKey<FormState>();

  String email = "";
  String passwd = "";
  String repassword = "";
  String name = "";
  String phone = "";

  void sendSignUp() async {
    var url = Uri.parse("http://${baseApiUrl}/signup");
    var signinData = {
      "email": email,
      "passwd": passwd,
      // "repassword": repassword,
      "name": name,
      "phone": phone
    };
    var body = json.encode(signinData);
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
    return Form(
        key: _formkey,
        child: Column(children: [
          Column(
            children: [
              CommonRow(
                text: "아이디로 사용 할 이메일 주소 입력",
              ),
              Container(
                  height: 48,
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 22),
                  child: TextFormField(
                      onSaved: (value) {
                        setState(() {
                          // value = encryptModule(value as String);
                          email = value!;
                        });
                      },
                      // autovalidateMode: AutovalidateMode.always,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(241, 244, 248, 1.0),
                              )),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(241, 244, 248, 1.0),
                              )),
                          filled: true,
                          fillColor: const Color.fromRGBO(241, 244, 248, 1.0),
                          focusColor: const Color.fromRGBO(241, 244, 248, 1.0),
                          hoverColor: const Color.fromRGBO(241, 244, 248, 1.0),
                          hintText: "이메일 주소를 입력하세요.",
                          suffixIcon: Container(
                            padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                            child: SizedBox(
                                width: 102,
                                height: 32,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          const Color.fromRGBO(56, 8, 135, 1.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: const Text("이메일 인증"))),
                          )))),
              CommonRow(
                text: "비밀번호 입력",
              ),
              Container(
                  height: 48,
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 22),
                  child: TextFormField(
                      onSaved: (value) {
                        setState(() {
                          // value = encryptModule(value as String);
                          passwd = value!;
                        });
                      },
                      // autovalidateMode: AutovalidateMode.always,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter some text';
                        }
                        return null;
                      },
                      obscureText: true,
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
                        hintText: "영어, 숫자, 특수문자를 조합하여 8자 이상 입력",
                        suffixIcon: Image.asset('assets/ok.png'),
                      ))),
              CommonRow(
                text: "비밀번호 확인",
              ),
              Container(
                  height: 48,
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 22),
                  child: TextFormField(
                      onSaved: (value) {
                        setState(() {
                          repassword = value as String;
                        });
                      },
                      // autovalidateMode: AutovalidateMode.always,
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'Enter some text';
                      //   }
                      //   return null;
                      // },
                      obscureText: true,
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
                        hintText: "비밀번호를 다시 입력하세요.",
                        suffixIcon: Image.asset('assets/x.png'),
                      ))),
              CommonRow(
                text: "이름",
              ),
              Container(
                  height: 48,
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 22),
                  child: TextFormField(
                      onSaved: (value) {
                        setState(() {
                          name = value as String;
                        });
                      },
                      // autovalidateMode: AutovalidateMode.always,
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
                        hintText: "이름을 입력하세요.",
                        suffixIcon: null,
                      ))),
              CommonRow(
                text: "전화번호 입력",
              ),
              Container(
                  height: 48,
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 22),
                  child: TextFormField(
                      onSaved: (value) {
                        setState(() {
                          phone = value as String;
                        });
                      },
                      // autovalidateMode: AutovalidateMode.always,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(241, 244, 248, 1.0),
                              )),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(241, 244, 248, 1.0),
                              )),
                          filled: true,
                          fillColor: const Color.fromRGBO(241, 244, 248, 1.0),
                          focusColor: const Color.fromRGBO(241, 244, 248, 1.0),
                          hoverColor: const Color.fromRGBO(241, 244, 248, 1.0),
                          hintText: "전화번호 ‘-’ 없이 입력하세요.",
                          suffixIcon: null))),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                height: 54,
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
                              EdgeInsets.all(13)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: const BorderSide(
                                  color: Color.fromRGBO(56, 8, 135, 1.0)),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();
                            sendSignUp();
                            // GoRouter.of(context).go('/');
                            Navigator.pushNamed(context, '/');
                          }

                          print("이메일: " +
                              email +
                              "\n비밀번호: " +
                              passwd +
                              "\n비밀번호 확인: " +
                              repassword +
                              "\n이름: " +
                              name +
                              "\n전화번호: " +
                              phone);
                        },
                        child: Text('가입하기',
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
