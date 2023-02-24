import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  // const MyButton({Key? key}) : super(key: key);
  //
  // 이 파일/클래스/위젯은 여기서 혼자 쓰는 게 아니고 "main08-login03-myLogIn.dart" 파일에서 불러다가 쓰는 부품임.
  //
  // 상위 페이지로부터 값을 입력받아서 커스터마이징할 수 있는 요소들을 final 붙여서 내부 변수로 선언
  final Widget myImage;
  final Widget myText;
  final Color myColor;
  final double myRadius;
  final VoidCallback myOnPressed;

  // final 은 선언할 때 바로 값을 넣어주거나, 생성자에서 받아서 넣어주거나, 이 두 방법만 가능하다고 했지.
  // 모르겠으면 "main06-modifier-const_and_final.dart" 파일 다시 보고 오셈
  // final 붙여서 내부 변수로 선언했던 애들은 생성자로 다 받아서 넣어주기
  MyButton({required this.myImage, required this.myText, required this.myColor, required this.myRadius, required this.myOnPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        height: 50.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(myRadius),
          ),
        ),
        child: ElevatedButton(
          onPressed: myOnPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(myColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              myImage,
              myText,
              Opacity(
                opacity: 0.0,
                child: Image.asset('assets/instagram.png',
                  width: 30.0,
                ),
              ),
            ],
          ),
        )
    );
  }

}


class IsPrivate {

  Widget _thisIsPriavte() {
    return Container();
  }
  Widget thisIsNotPriavte() {
    return Container();
  }

}