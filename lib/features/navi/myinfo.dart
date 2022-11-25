import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import '/features/common/CommonAppBar.dart';
import '/features/common/CommonRow.dart';
import '/features/common/CommonTextInput.dart';

class MyInfoPage extends StatelessWidget {
  const MyInfoPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => MyInfoPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GrayBlueAppBarMi(
        appBar: AppBar(),
        title: "내정보",
        center: true,
        backgroundColor: const Color.fromRGBO(56, 8, 135, 1.0),
        //  backgroundColor: const Color.fromRGBO(175, 180, 185, 1.0),
        key: null,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(41, 22, 30, 10),
            child: CommonRowNext(
                nextbtn: IconButton(
                  icon: Image.asset('assets/iconChevronRCopy3.png'),
                  onPressed: () {
                    // GoRouter.of(context).go('/changepassword');
                    Navigator.pushNamed(context, '/changepw');
                  },
                ),
                text: '비밀번호 변경'),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
            height: 1,
            color: Color(0xffe5e7e9),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(41, 10, 30, 10),
            child: CommonRowNext(
                nextbtn: IconButton(
                  icon: Image.asset('assets/iconChevronRCopy3.png'),
                  onPressed: () {
                    GoRouter.of(context).go('/inquiry');
                  },
                ),
                text: '나의 학습 기록'),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
            height: 1,
            color: Color(0xffe5e7e9),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(41, 10, 30, 10),
            child: CommonRowNext(
                nextbtn: IconButton(
                  icon: Image.asset('assets/iconChevronRCopy3.png'),
                  onPressed: () {
                    // GoRouter.of(context).go('/secession');
                    Navigator.pushNamed(context, '/secession');
                  },
                ),
                text: '회원탈퇴'),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
            height: 1,
            color: Color(0xffe5e7e9),
          ),
        ],
      ),
    );
  }
}

class GrayBlueAppBarMi extends StatelessWidget implements PreferredSizeWidget {
  const GrayBlueAppBarMi(
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
          // GoRouter.of(context).go('/main');
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
