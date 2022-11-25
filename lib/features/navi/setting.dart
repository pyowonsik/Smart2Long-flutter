import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import '/features/common/CommonAppBar.dart';
import '/features/common/CommonRow.dart';
import '/features/common/CommonTextInput.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SettingPage());
  }

  @override
  State<StatefulWidget> createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage> {
  var fontSize = 0;
  var spanSpace = 0;
  var paraSpace = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GrayBlueAppBar(
          appBar: AppBar(),
          title: "Setting",
          center: true,
          backgroundColor: const Color.fromRGBO(56, 8, 135, 1.0),
          //  backgroundColor: const Color.fromRGBO(175, 180, 185, 1.0),
          key: null,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(41, 10, 12, 10),
                child: CommonRow(text: "알림 설정"),
              ),
              Container(
                height: 1,
                margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                color: Color(0xffe5e7e9),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(41, 10, 30, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(13, 0, 0, 0),
                        ),
                        Text('Push 알림',
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: -0.45,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('소리',
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: -0.45,
                            )),
                        Switch(
                          value: false,
                          onChanged: (value) {},
                          activeTrackColor: Color(0xffe5e7e9),
                          activeColor: Color(0xffafb4b9),
                          inactiveThumbColor: Color(0xff380887),
                        ),
                        Text('진동',
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: -0.45,
                            )),
                        Switch(
                          value: false,
                          onChanged: (value) {},
                          activeTrackColor: Color(0xffe5e7e9),
                          activeColor: Color(0xffafb4b9),
                          inactiveThumbColor: Color(0xff380887),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                height: 1,
                margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                color: Color(0xffe5e7e9),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(41, 10, 30, 10),
                child: CommonRowSwitchNi(text: "Today's M-Deck 알림"),
              ),

              Container(
                height: 1,
                margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                color: Color(0xffe5e7e9),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(41, 10, 30, 10),
                child: CommonRowSwitchNi(text: "공지사항 알림"),
              ),

              Container(
                height: 1,
                margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                color: Color(0xffe5e7e9),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(41, 10, 30, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/iconDot.png"),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(9, 0, 0, 0),
                        child: Text(
                          "폰트설정",
                          style: TextStyle(
                            color: Color.fromRGBO(43, 46, 60, 1.0),
                            fontSize: 18,
                            letterSpacing: -0.45,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff380887)),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(20)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: const BorderSide(
                                  color: Color.fromRGBO(56, 8, 135, 1.0)),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            fontSize = 0;
                            spanSpace = 0;
                            paraSpace = 0;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/iconRe.png'),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                            ),
                            Text('초기화',
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: -0.38,
                                )),
                          ],
                        )),
                  ],
                ),
              ),

              Container(
                height: 1,
                margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                color: Color(0xffe5e7e9),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(41, 10, 30, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(13, 0, 0, 0),
                        ),
                        Text("폰트 사이즈",
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: -0.45,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                              border: Border.all(
                                color: Color.fromRGBO(56, 8, 135, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(7)),
                          child: IconButton(
                            iconSize: 16,
                            icon: Image.asset(
                              'assets/-.png',
                              color: Color.fromRGBO(56, 8, 135, 1.0),
                            ),
                            onPressed: () {
                              setState(() {
                                fontSize--;
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 27, 0),
                        ),
                        Text('$fontSize',
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: -0.45,
                            )),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
                        ),
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                              border: Border.all(
                                color: Color.fromRGBO(56, 8, 135, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(7)),
                          child: IconButton(
                            iconSize: 16,
                            icon: Image.asset(
                              'assets/+.png',
                              color: Color.fromRGBO(56, 8, 135, 1.0),
                            ),
                            onPressed: () {
                              setState(() {
                                fontSize++;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                height: 1,
                margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                color: Color(0xffe5e7e9),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(41, 10, 30, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(13, 0, 0, 0),
                        ),
                        Text("줄 간격",
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: -0.45,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                              border: Border.all(
                                color: Color.fromRGBO(56, 8, 135, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(7)),
                          child: IconButton(
                            iconSize: 16,
                            icon: Image.asset(
                              'assets/-.png',
                              color: Color.fromRGBO(56, 8, 135, 1.0),
                            ),
                            onPressed: () {
                              setState(() {
                                spanSpace--;
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 27, 0),
                        ),
                        Text('$spanSpace',
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: -0.45,
                            )),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
                        ),
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                              border: Border.all(
                                color: Color.fromRGBO(56, 8, 135, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(7)),
                          child: IconButton(
                            iconSize: 16,
                            icon: Image.asset(
                              'assets/+.png',
                              color: Color.fromRGBO(56, 8, 135, 1.0),
                            ),
                            onPressed: () {
                              setState(() {
                                spanSpace++;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                height: 1,
                margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                color: Color(0xffe5e7e9),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(41, 10, 30, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(13, 0, 0, 0),
                        ),
                        Text("문단 간격",
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: -0.45,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                              border: Border.all(
                                color: Color.fromRGBO(56, 8, 135, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(7)),
                          child: IconButton(
                            iconSize: 16,
                            icon: Image.asset(
                              'assets/-.png',
                              color: Color.fromRGBO(56, 8, 135, 1.0),
                            ),
                            onPressed: () {
                              setState(() {
                                paraSpace--;
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 27, 0),
                        ),
                        Text('$paraSpace',
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: -0.45,
                            )),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
                        ),
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                              border: Border.all(
                                color: Color.fromRGBO(56, 8, 135, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(7)),
                          child: IconButton(
                            iconSize: 16,
                            icon: Image.asset(
                              'assets/+.png',
                              color: Color.fromRGBO(56, 8, 135, 1.0),
                            ),
                            onPressed: () {
                              setState(() {
                                paraSpace++;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                height: 1,
                margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                color: Color(0xffe5e7e9),
              ),

              // Padding(
              //   padding: EdgeInsets.fromLTRB(41, 10, 30, 10),
              //   child: CommonRowBtn(text: "암기 설정"),
              // ),

              Container(
                height: 1,
                margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                color: Color(0xffe5e7e9),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(41, 10, 30, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(13, 0, 0, 0),
                        ),
                        Text("TTS 듣기 속도",
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: -0.45,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 135,
                          height: 32,
                          padding: EdgeInsets.fromLTRB(74, 0, 0, 0),
                          decoration: BoxDecoration(
                            color: Color(0xffe5e7e9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButton(
                              underline: SizedBox.shrink(),
                              hint: Text(
                                "보통",
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: -0.38,
                                  color: Color(0xff380887),
                                ),
                              ),
                              items: [
                                DropdownMenuItem(
                                  child: Text("보통"),
                                  value: 1,
                                ),
                              ],
                              onChanged: (value) {}),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                height: 1,
                margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                color: Color(0xffe5e7e9),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(41, 10, 30, 10),
                child: CommonRowSwitchNi(text: "암기주기"),
              ),

              Container(
                height: 1,
                margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                color: Color(0xffe5e7e9),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(41, 10, 30, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(41, 0, 0, 0),
                        ),
                        Text("따라하기 횟수",
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: -0.45,
                            )),
                        Container(margin: EdgeInsets.fromLTRB(7, 0, 0, 0)),
                        Image.asset('assets/iconHelp.png'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 135,
                          height: 32,
                          padding: EdgeInsets.fromLTRB(74, 0, 0, 0),
                          decoration: BoxDecoration(
                            color: Color(0xffe5e7e9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButton(
                              underline: SizedBox.shrink(),
                              hint: Text(
                                "1회",
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: -0.38,
                                  color: Color(0xff380887),
                                ),
                              ),
                              items: [
                                DropdownMenuItem(
                                  child: Text("1회"),
                                  value: 1,
                                ),
                              ],
                              onChanged: (value) {}),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                height: 1,
                margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                color: Color(0xffe5e7e9),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(41, 10, 30, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(41, 0, 0, 0),
                        ),
                        Text("따라하기 시간",
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: -0.45,
                            )),
                        Container(margin: EdgeInsets.fromLTRB(7, 0, 0, 0)),
                        Image.asset('assets/iconHelp.png'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 135,
                          height: 32,
                          padding: EdgeInsets.fromLTRB(74, 0, 0, 0),
                          decoration: BoxDecoration(
                            color: Color(0xffe5e7e9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButton(
                              underline: SizedBox.shrink(),
                              hint: Text(
                                "보통",
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: -0.38,
                                  color: Color(0xff380887),
                                ),
                              ),
                              items: [
                                DropdownMenuItem(
                                  child: Text("보통"),
                                  value: 1,
                                ),
                              ],
                              onChanged: (value) {}),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                height: 1,
                margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                color: Color(0xffe5e7e9),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(41, 10, 30, 10),
                child: CommonRowSwitch(text: "M-DeckPlayer"),
              ),

              Container(
                height: 1,
                margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                color: Color(0xffe5e7e9),
              ),

              // 모달 팝업 테스트버튼
              Container(
                margin: EdgeInsets.all(10),
              ),
            ],
          ),
        ));
  }
}

// 모달 팝업
void settingModal1(BuildContext context) {
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
                    Text('TEXT',
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
            child:
                Text('가나다라마바사아자차카파타하가나다라마바사아자차카파타하가나다라마바사아자차카파타하가나다라마바사아자차카파타하',
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
                    width: 158,
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color(0xffaf97d7),
                    ),
                    child: TextButton(
                      child: Text('TEXT',
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
                  Container(margin: EdgeInsets.fromLTRB(2, 0, 0, 0)),
                  Container(
                    width: 158,
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color(0xff380887),
                    ),
                    child: TextButton(
                      child: Text('TEXT',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                      onPressed: () {
                        print('modal test');
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      });
}

// 모달 팝업
void settingModal2(BuildContext context) {
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
                    Text('Tip',
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
            child: Text('M-Card 앞면과 뒷면을 반복 듣고 따라하기 횟수를 지정합니다.',
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
