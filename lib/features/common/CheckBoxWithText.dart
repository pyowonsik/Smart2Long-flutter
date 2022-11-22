import 'package:flutter/material.dart';

class CheckBoxWithText extends StatefulWidget {
  final String checkText;

  CheckBoxWithText({Key? key, required this.checkText}) : super(key: key);

  @override
  State<CheckBoxWithText> createState() => _CheckBoxWithText(checkText);
}

class _CheckBoxWithText extends State<CheckBoxWithText> {
  bool isChecked = false;
  String checkText;
  _CheckBoxWithText(this.checkText);

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      return Color.fromRGBO(56, 8, 135, 1.0);
    }

    return Row(children: [
      Checkbox(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
      Container(
        margin: EdgeInsets.fromLTRB(7, 0, 0, 3),
        child: Text("$checkText",
            style: TextStyle(
              fontSize: 18,
              letterSpacing: -0.45,
            )),
      ),
    ]);
  }
}
