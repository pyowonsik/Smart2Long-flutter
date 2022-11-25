import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../common/commonBottomBtn.dart';
import '/features/common/CommonAppBar.dart';
import '/features/common/CommonRow.dart';
import '/features/common/CommonTextInput.dart';

void main() {
  runApp(const GuidePage());
}

class GuidePage extends StatelessWidget {
  const GuidePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => GuidePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GrayBlueAppBarIq(
          appBar: AppBar(),
          title: "이용가이드",
          center: true,
          backgroundColor: const Color.fromRGBO(56, 8, 135, 1.0),
          // backgroundColor: const Color.fromRGBO(175, 180, 185, 1.0),
          key: null,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/emoji00Copy.png'),
              Container(
                margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              ),
              Text('이용가이드가 없습니다.'),
            ],
          ),
        ));
  }
}

class GrayBlueAppBarIq extends StatelessWidget implements PreferredSizeWidget {
  const GrayBlueAppBarIq(
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
