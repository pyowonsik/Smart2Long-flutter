import 'package:flutter/material.dart';

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

class CommonRowBtn extends StatelessWidget {
  const CommonRowBtn({Key? key, required this.text}) : super(key: key);

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
        ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xff380887)),
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side:
                      const BorderSide(color: Color.fromRGBO(56, 8, 135, 1.0)),
                ),
              ),
            ),
            onPressed: () {
              print("login test");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('iconRe.png'),
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
    );
  }
}

class CommonRowSwitch extends StatelessWidget {
  const CommonRowSwitch({Key? key, required this.text}) : super(key: key);

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
        Switch(
          value: false,
          onChanged: (value) {},
          activeTrackColor: Color(0xffe5e7e9),
          activeColor: Color(0xffafb4b9),
          inactiveThumbColor: Color(0xff380887),
        ),
      ],
    );
  }
}

class CommonRowSwitchNi extends StatelessWidget {
  const CommonRowSwitchNi({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
        Switch(
          value: false,
          onChanged: (value) {},
          activeTrackColor: Color(0xffe5e7e9),
          activeColor: Color(0xffafb4b9),
          inactiveThumbColor: Color(0xff380887),
        ),
      ],
    );
  }
}

class CommonRowNext extends StatelessWidget {
  const CommonRowNext({Key? key, required this.text, required this.nextbtn})
      : super(key: key);

  final String text;
  final Widget nextbtn;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
        // IconButton(
        //   icon: Image.asset('assets/iconChevronRCopy3.png'),
        //   onPressed: (){
        //     print("test ");
        //   },
        // )
        nextbtn
      ],
    );
  }
}
