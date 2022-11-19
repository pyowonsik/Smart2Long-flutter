import 'package:flutter/material.dart';

class CommonTextInput extends StatelessWidget {
  const CommonTextInput({
    Key? key,
    required this.hintText,
    required this.suffixIcon,
  }) : super(key: key);

  final String hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 22),
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
                suffixIcon: suffixIcon
                // suffix: suffix,
                // suffix: SizedBox(
                //     width: 102,
                //     height: 32,
                //     child: ElevatedButton(
                //         onPressed: () {},
                //         style: ElevatedButton.styleFrom(
                //             primary: const Color.fromRGBO(56, 8, 135, 1.0)),
                //         child: const Text("이메일 인증"))),
                )));
  }
}
