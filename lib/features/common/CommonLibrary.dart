import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonEProduct extends StatelessWidget {
  const CommonEProduct({Key? key, required this.field, required this.score})
      : super(key: key);

  final String field;
  final String score;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
        decoration: BoxDecoration(
          color: Color(0xffe5e7e9),
          borderRadius: BorderRadius.circular(12),
        ),
        // padding: EdgeInsets.fromLTRB(40, 30, 40, 36),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(12, 12, 20, 12),
                  child: Image(image: AssetImage("assets/layer14.png")),
                ),
                Container(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            child: Text(
                              "$score",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color.fromRGBO(46, 10, 106, 1.0),
                                  fontSize: 16,
                                  letterSpacing: -0.4),
                            ),
                          ),
                          Container(
                            child: Text('$field',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff6d727a),
                                )),
                          ),
                          Container(
                            height: 1,
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 7),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Image(
                                      image: AssetImage(
                                          "assets/iconClockCopy12.png")),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                                    child: Text(" 1일 전"),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 8, 10),
              height: 108,
              decoration: BoxDecoration(
                color: Color(0xffe5e7e9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 1.0),
                                  borderRadius: BorderRadius.circular(7)),
                              child: IconButton(
                                iconSize: 16,
                                icon: Image.asset(
                                  'triangle1694.png',
                                  color: Color.fromRGBO(56, 8, 135, 1.0),
                                ),
                                onPressed: () {
                                  GoRouter.of(context).go('/test');
                                },
                              ),
                            ),
                            Container(
                              width: 28,
                              height: 28,
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 1.0),
                                  borderRadius: BorderRadius.circular(7)),
                              child: IconButton(
                                iconSize: 16,
                                icon: Image.asset(
                                  'assets/ellipse2.png',
                                  color: Color.fromRGBO(56, 8, 135, 1.0),
                                ),
                                onPressed: () {
                                  print("ell test");
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class CommonMProduct extends StatelessWidget {
  const CommonMProduct({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffe5e7e9),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.fromLTRB(15, 19, 8, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$text',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        borderRadius: BorderRadius.circular(7)),
                    child: IconButton(
                      iconSize: 16,
                      icon: Image.asset(
                        'assets/ellipse2.png',
                        color: Color.fromRGBO(56, 8, 135, 1.0),
                      ),
                      onPressed: () {
                        print("ell test");
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('홍길동',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff6d727a),
                      )),
                  Container(margin: EdgeInsets.fromLTRB(0, 6, 0, 0)),
                ],
              ),
              Container(margin: EdgeInsets.fromLTRB(0, 22, 0, 0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/iconClockCopy.png'),
                      Text('14:50',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                    ],
                  ),
                  Container(margin: EdgeInsets.fromLTRB(31, 0, 0, 0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/iconCard.png'),
                      Text('40',
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      Text('/100',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffafb4b9),
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommonEBtn extends StatelessWidget {
  const CommonEBtn({Key? key, required this.text, required this.num})
      : super(key: key);
  final String text;

  final String? num;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        height: 60,
        child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all<Color>(Color(0xff380887)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xff380887)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/iconBook.png', color: Colors.white),
                Container(margin: EdgeInsets.fromLTRB(12, 0, 0, 0)),
                Text('$text ',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('[',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    Text('$num',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffffbc00))),
                    Text(']',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                )
              ],
            )),
      ),
    );
  }
}

class CommonMBtn extends StatelessWidget {
  const CommonMBtn({Key? key, required this.text, required this.num})
      : super(key: key);

  final String text;
  final String? num;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all<Color>(Color(0xffd4d8db)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xffd4d8db)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
            onPressed: () {
              print("test");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/iconDeck.png', color: Colors.white),
                Container(margin: EdgeInsets.fromLTRB(12, 0, 0, 0)),
                Text('$text',
                    style: TextStyle(fontSize: 20, color: Color(0xffe5e7e9))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('[',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffe5e7e9))),
                    Text('$num',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffe5e7e9))),
                    Text(']',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffe5e7e9))),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class CommonSearchBar extends StatelessWidget {
  const CommonSearchBar(
      {Key? key,
      required this.hintText,
      required this.suffixIcon,
      required this.prefixIcon})
      : super(key: key);

  final Widget prefixIcon;
  final Widget? suffixIcon;
  final String hintText;

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
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: "$hintText",
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

class CommonSmallBtn extends StatelessWidget {
  const CommonSmallBtn({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 32,
        child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
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
                Text('$text',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xffffbc00))),
                Text('E-Book ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xff380887))),
                Icon(Icons.add_circle_outline, color: Color(0xff380887)),
              ],
            )),
      ),
    );
  }
}
