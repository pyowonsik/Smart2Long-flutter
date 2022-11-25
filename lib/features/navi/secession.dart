import 'package:flutter/material.dart';
import '../common/commonBottomBtn.dart';
import 'package:go_router/go_router.dart';
import '/features/common/CommonAppBar.dart';
import '/features/common/CommonRow.dart';
import '/features/common/CommonTextInput.dart';

void main() {
  runApp(const SecessionPage());
}

class SecessionPage extends StatelessWidget {
  const SecessionPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SecessionPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GrayBlueAppBarCp(
          appBar: AppBar(),
          title: "회원 탈퇴",
          center: true,
          backgroundColor: const Color.fromRGBO(56, 8, 135, 1.0),
          // backgroundColor: const Color.fromRGBO(175, 180, 185, 1.0),
          key: null,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CommonRow(
                text: "비밀번호 입력",
              ),
              CommonTextInput(
                hintText: "비밀번호를 입력하세요.",
                suffixIcon: null,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                  height: 54,
                  child: Row(
                    children: [
                      Expanded(
                        child: CommonBottomBtn1(
                          text: "확인",
                          onPressed: () {
                            CompletionSc(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class GrayBlueAppBarCp extends StatelessWidget implements PreferredSizeWidget {
  const GrayBlueAppBarCp(
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
          // GoRouter.of(context).go('/myinfo');
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

// 모달 팝업
void CompletionSc(BuildContext context) {
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
                    Image.asset('iconHelpCopy2.png'),
                    Container(margin: EdgeInsets.fromLTRB(8, 0, 0, 0)),
                    Text('회원 탈퇴 완료',
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
                        icon: Image.asset('close.png')),
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
            child: Text('회원 탈퇴가 완료되었습니다. 확인 버튼을 누르세요.',
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
                        GoRouter.of(context).go('/');
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
