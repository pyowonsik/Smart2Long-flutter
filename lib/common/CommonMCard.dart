import 'package:flutter/material.dart';
import 'package:s2longapp/common/CommonTextInput.dart';

class CommonProblem extends StatelessWidget {
  const CommonProblem({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 17, 24, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: Color.fromRGBO(56, 8, 135, 1.0),
                    ),
                    height: 19,
                    width: 44,
                    child: Image.asset('assets/?.png', color: Colors.white),
                  ),
                  Container(margin: EdgeInsets.fromLTRB(5, 0, 0, 0)),
                  Text('$text',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(56, 8, 135, 1.0),
                        fontWeight: FontWeight.bold,
                      )),
                  Container(margin: EdgeInsets.fromLTRB(0, 18, 0, 0)),
                  Container(margin: EdgeInsets.fromLTRB(0, 8, 0, 0)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommonHint extends StatelessWidget {
  const CommonHint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: FloatingActionButton(
        backgroundColor: Color.fromRGBO(255, 188, 0, 1.0),
        child: Text('Hint',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            )),
        onPressed: () {},
      ),
    );
  }
}

class CommonResult extends StatelessWidget {
  const CommonResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 46,
      child: FloatingActionButton(
        backgroundColor: Color.fromRGBO(56, 8, 135, 1.0),
        child: Text('정답',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            )),
        onPressed: () {},
      ),
    );
  }
}

class CommonExample extends StatelessWidget {
  const CommonExample({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 32,
        child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(243, 239, 253, 1.0)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(243, 239, 253, 1.0)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: const BorderSide(
                      color: Color.fromRGBO(243, 239, 253, 1.0)),
                ),
              ),
            ),
            onPressed: () {
              print("test");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$text',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color.fromRGBO(56, 8, 135, 1.0))),
                Container(margin: EdgeInsets.fromLTRB(0, 0, 12, 0)),
              ],
            )),
      ),
    );
  }
}

class CommonQuestion extends StatelessWidget {
  const CommonQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Color.fromRGBO(56, 8, 135, 1.0),
      ),
      height: 19,
      width: 44,
      child: Image.asset('assets/?.png', color: Colors.white),
    );
  }
}

class CommonTextInput extends StatelessWidget {
  const CommonTextInput(
      {Key? key,
      required this.prefixText,
      required this.hintText,
      required this.suffixIcon})
      : super(key: key);

  final String? prefixText;
  final String hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 22),
      child: SizedBox(
          height: 48,
          child: TextFormField(
              decoration: InputDecoration(
            hintStyle: const TextStyle(
              height: 2.9,
              color: Color.fromRGBO(56, 8, 135, 1.0),
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

            prefixText: '$prefixText',
            prefixStyle: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(56, 8, 135, 1.0),
            ),
            hintText: "$hintText",

            suffixIcon: suffixIcon,

            // suffix: suffix,
            // suffix: SizedBox(
            //     width: 102,
            //     height: 32,
            //     child: ElevatedButton(
            //         onPressed: () {},
            //         style: ElevatedButton.styleFrom(
            //             primary: const Color.fromRGBO(56, 8, 135, 1.0)),
            //         child: const Text("이메일 인증"))),
          ))),
    );
  }
}

class CommonBottomBtn extends StatelessWidget {
  const CommonBottomBtn({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xff380887)),
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(21)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(
                          color: Color.fromRGBO(56, 8, 135, 1.0)),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text("$text",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonRowIcon extends StatelessWidget {
  const CommonRowIcon({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            child: Row(
              children: [
                Image.asset("assets/iconDot.png"),
                Container(margin: const EdgeInsets.fromLTRB(9, 0, 0, 0)),
                Text(
                  "$text",
                  style: TextStyle(
                    color: Color.fromRGBO(43, 46, 60, 1.0),
                    fontSize: 18,
                    letterSpacing: -0.45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [Image.asset('assets/iconHelp.png')],
        )
      ],
    );
  }
}

class CommonRow extends StatelessWidget {
  const CommonRow({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("assets/iconDot.png"),
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            margin: const EdgeInsets.fromLTRB(9, 0, 0, 0),
            child: Text(
              "$text",
              style: TextStyle(
                color: Color.fromRGBO(43, 46, 60, 1.0),
                fontSize: 18,
                letterSpacing: -0.45,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CommonRowTBtn extends StatelessWidget {
  const CommonRowTBtn({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            child: Row(
              children: [
                Image.asset("assets/iconDot.png"),
                Container(
                  margin: const EdgeInsets.fromLTRB(9, 0, 0, 0),
                ),
                Text(
                  "$text",
                  style: TextStyle(
                    color: Color.fromRGBO(43, 46, 60, 1.0),
                    fontSize: 18,
                    letterSpacing: -0.45,
                  ),
                ),
                Text('(문제출제시 적용)',
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: -0.45,
                      color: Color.fromRGBO(175, 180, 185, 1.0),
                    )),
              ],
            ),
          ),
        ),
        Row(
          children: [
            ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(56, 8, 135, 1.0)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(56, 8, 135, 1.0)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(color: Color(0xff380887)),
                    ),
                  ),
                ),
                onPressed: () {
                  print("test");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('핵심 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xffffbc00))),
                    Text('키워드 추출 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color.fromRGBO(255, 255, 255, 1.0))),
                  ],
                )),
          ],
        )
      ],
    );
  }
}

class CommonTextInputOri extends StatelessWidget {
  const CommonTextInputOri(
      {Key? key, required this.hintText, required this.suffixIcon})
      : super(key: key);

  final String hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 22),
      child: SizedBox(
          height: 48,
          child: TextFormField(
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
            hintText: "$hintText",
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Image.asset("assets/iconPlus.png"),
            ),

            // suffix: suffix,
            // suffix: SizedBox(
            //     width: 102,
            //     height: 32,
            //     child: ElevatedButton(
            //         onPressed: () {},
            //         style: ElevatedButton.styleFrom(
            //             primary: const Color.fromRGBO(56, 8, 135, 1.0)),
            //         child: const Text("이메일 인증"))),
          ))),
    );
  }
}

class CommonBottomBtn1 extends StatelessWidget {
  const CommonBottomBtn1({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
        height: 54,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xff380887)),
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(21)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(
                          color: Color.fromRGBO(56, 8, 135, 1.0)),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text("$text",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonBottomBtn3 extends StatelessWidget {
  const CommonBottomBtn3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
        height: 54,
        child: Row(
          children: [
            Container(
              child: Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(175, 151, 215, 1.0)),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(21)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(
                            color: Color.fromRGBO(175, 151, 215, 1.0)),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("취소",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
              ),
            ),
            Container(
              width: 2,
            ),
            Container(
              child: Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff380887)),
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
                  onPressed: () {},
                  child: Text("완료",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
              ),
            ),
            Container(
              width: 2,
            ),
            Container(
              child: Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff380887)),
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
                  onPressed: () {},
                  child: Text("다음카드",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayBtn extends StatelessWidget {
  const PlayBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all<Color>(Color.fromRGBO(56, 8, 135, 1.0)),
          backgroundColor:
              MaterialStateProperty.all<Color>(Color.fromRGBO(56, 8, 135, 1.0)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: const BorderSide(color: Color.fromRGBO(56, 8, 135, 1.0)),
            ),
          ),
        ),
        onPressed: () {},
        child: Image.asset('triangle1694.png'),
      ),
    );
  }
}

class PlayInfo extends StatelessWidget {
  const PlayInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 131,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromRGBO(56, 8, 135, 1.0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.fromLTRB(17, 13, 16, 10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('M-Deck Player [2/7] 영어 독립 365',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset('closeCopy.png')),
                      ],
                    )),
              ),
            ],
          ),
          Container(margin: EdgeInsets.fromLTRB(0, 8, 0, 0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(175, 151, 215, 1.0)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(175, 151, 215, 1.0)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(
                            color: Color.fromRGBO(175, 151, 215, 1.0)),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset('triangle1764Copy.png'),
                      Container(margin: EdgeInsets.fromLTRB(8, 0, 0, 0)),
                      Text('Play',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(56, 8, 135, 1.0),
                          )),
                    ],
                  )),
              Container(margin: EdgeInsets.fromLTRB(4, 0, 0, 0)),
              ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(255, 255, 255, 1.0)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(255, 255, 255, 1.0)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 1.0)),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset('stop.png'),
                      Container(margin: EdgeInsets.fromLTRB(8, 0, 0, 0)),
                      Text('Stop',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(56, 8, 135, 1.0),
                          )),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
