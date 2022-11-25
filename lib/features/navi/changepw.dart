import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/commonBottomBtn.dart';
import 'package:go_router/go_router.dart';
import '/features/common/CommonAppBar.dart';
import '/features/common/CommonRow.dart';
import '/features/common/CommonTextInput.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

const baseApiUrl = String.fromEnvironment('BASE_URL');

String finalEmail = '';

class ChangePwPage extends StatelessWidget {
  const ChangePwPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ChangePwPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GrayBlueAppBarCp(
          appBar: AppBar(),
          title: "비밀번호 변경",
          center: true,
          backgroundColor: const Color.fromRGBO(56, 8, 135, 1.0),
          // backgroundColor: const Color.fromRGBO(175, 180, 185, 1.0),
          key: null,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 0),
          child: RePasswordForm(),
        ));
  }
}

class GrayBlueAppBarCp extends StatelessWidget implements PreferredSizeWidget {
  const GrayBlueAppBarCp(
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
          // GoRouter.of(context).go('/myinfo');
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
void CompletionCp(BuildContext context) {
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
                    Text('비밀번호 변경 완료',
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
            child: Text('비밀번호 변경이 완료 되었습니다. 확인 버튼을 누르세요.',
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
                        // print('modal test');
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

class RePasswordForm extends ConsumerStatefulWidget {
  const RePasswordForm({Key? key}) : super(key: key);

  @override
  RePasswordFormState createState() => RePasswordFormState();
}

class RePasswordFormState extends ConsumerState<RePasswordForm> {
  @override
  void initState() {
    super.initState();
    sendUserPw();
  }

  Future getValidationData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email').toString();
    setState(() {
      finalEmail = email;
    });
    print(finalEmail);
  }

  final formkey = GlobalKey<FormState>();

  String passwd = "";
  String newpasswd = "";
  String renewpasswd = "";

  void sendUserPw() async {
    if (baseApiUrl.isEmpty) {
      throw AssertionError('BASE_URL is not set');
    }

    var url = Uri.parse("http://${baseApiUrl}/signin/changepasswd");
    var postData = {
      "email": finalEmail,
      "passwd": passwd,
      "newpasswd": newpasswd,
      "renewpasswd": renewpasswd,
    };

    var body = json.encode(postData);

    http.Response res = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
        body: body);
  }

  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
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
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xfff1f4f8),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.password,
                          color: Color(0xffafb4b9),
                        ),
                        hintText: '현재 비밀번호 입력')),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        newpasswd = value!;
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
                          Icons.password,
                          color: Color(0xffafb4b9),
                        ),
                        hintText: '변경할 비밀번호 입력')),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        renewpasswd = value!;
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
                          Icons.password,
                          color: Color(0xffafb4b9),
                        ),
                        hintText: '변경할 비밀번호 다시 입력')),
              )
            ],
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
                      onPressed: () {
                        if (newpasswd == renewpasswd) {
                          sendUserPw();
                          CompletionCp(context);
                        } else {
                          print('비밀번호가 일치 하지 않습니다.');
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
    );
  }
}
