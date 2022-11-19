import 'package:flutter/material.dart';

class CommonBottomBtn1 extends StatelessWidget {
  const CommonBottomBtn1(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff380887)),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(21)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(color: Color.fromRGBO(56, 8, 135, 1.0)),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text("$text",
          style: TextStyle(
            fontSize: 20,
          )),
    );
  }
}

class CommonBottomBtn2 extends StatelessWidget {
  const CommonBottomBtn2({Key? key, required this.text}) : super(key: key);

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
                  child: Text("$text",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
              ),
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
                  child: Text("$text",
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
