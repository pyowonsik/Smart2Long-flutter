import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:s2longapp/features/common/CommonBottomBtn.dart';

String finalEmail = '';

class MenuBar extends StatefulWidget {
  const MenuBar({Key? key}) : super(key: key);

  // getSharedPre() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.getString('email');
  // }

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => MenuBar());
  }

  @override
  State<MenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  void initState() {
    getValidationData();
    super.initState();

    // "ref"는 StatefulWidget의 모든 생명주기 상에서 사용할 수 있습니다.
  }

  Future getValidationData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email').toString();
    setState(() {
      finalEmail = email;
    });
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Stack(
      children: [
        ListView(
          padding: EdgeInsets.zero,
          children: ListTile.divideTiles(context: context, tiles: [
            Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.fromLTRB(28, 40, 0, 50),
                height: 180,
                color: Color.fromRGBO(56, 8, 135, 1.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/s2Long_color.png"),
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Image.asset("assets/iconMenu.png")),
                      ],
                    ),
                    Row(
                      children: [
                        Image(image: AssetImage("assets/iconUser.png")),
                        Container(
                          margin: EdgeInsets.fromLTRB(9, 0, 0, 0),
                          child: Text(
                            finalEmail,
                            // getEmail(),
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1.0),
                                fontSize: 20),
                          ),
                        )
                      ],
                    )
                  ],
                )),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromRGBO(255, 255, 255, 0.0),
                child: Image(image: AssetImage("assets/iconUserinfo.png")),
              ),
              title: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 3.5),
                child: Text(
                  '내정보',
                  style: TextStyle(
                      color: Color.fromRGBO(56, 8, 135, 1.0), fontSize: 18),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/myinfo');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromRGBO(255, 255, 255, 0.0),
                child: Image(image: AssetImage("assets/iconSetting.png")),
              ),
              title: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 3.5),
                child: Text(
                  '설정',
                  style: TextStyle(
                      color: Color.fromRGBO(56, 8, 135, 1.0), fontSize: 18),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/setting');
                ;
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromRGBO(255, 255, 255, 0.0),
                child: Image(image: AssetImage("assets/iconNoti.png")),
              ),
              title: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 3.5),
                child: Text(
                  '공지사항',
                  style: TextStyle(
                      color: Color.fromRGBO(56, 8, 135, 1.0), fontSize: 18),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/notice');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromRGBO(255, 255, 255, 0.0),
                child: Image(image: AssetImage("assets/iconStarECopy5.png")),
              ),
              title: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 3.5),
                child: Text(
                  '이벤트',
                  style: TextStyle(
                      color: Color.fromRGBO(56, 8, 135, 1.0), fontSize: 18),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/event');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromRGBO(255, 255, 255, 0.0),
                child: Image(image: AssetImage("assets/iconHelp.png")),
              ),
              title: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 3.5),
                child: Text(
                  '이용 가이드',
                  style: TextStyle(
                      color: Color.fromRGBO(56, 8, 135, 1.0), fontSize: 18),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/guide');
              },
            ),
            ListTile()
          ]).toList(),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.fromLTRB(28, 0, 28, 83),
          child: Text(
            "Ver.0.1",
            style: TextStyle(
                color: Color.fromRGBO(175, 180, 185, 1.0), fontSize: 14),
          ),
        ),
        Container(
            margin: EdgeInsets.fromLTRB(28, 0, 28, 16),
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                width: 264,
                height: 56,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    side: BorderSide(color: Color.fromRGBO(86, 18, 199, 1.0)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () async {
                    // GoRouter.of(context).push('/');
                    Navigator.pushNamed(context, '/');
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    prefs.clear();
                  },
                  icon: Image.asset("assets/iconLogout.png"),
                  label: Text(
                    "로그아웃",
                    style: TextStyle(
                        height: 1.25,
                        color: Color.fromRGBO(56, 8, 135, 1.0),
                        fontSize: 18),
                  ),
                ))),
      ],
    ));
  }
}
