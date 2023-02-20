import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';


// 이거는 main 으로 띄워서 올리면 안 올라가고 230220-login-3.dart 먼저 올려서 validation 통과하면 여기로 넘어옴
class Dice extends StatefulWidget {
  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  //
  int dice1 = 1;
  int dice2 = 1;

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Dice game'),
      ),

      // before >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           Image(width: 180.0, image:AssetImage('assets/assets_login/dice1.png')),
      //           Image(width: 180.0, image:AssetImage('assets/assets_login/dice2.png')),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      // before <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      // //
      // 위도 아래도 주사위 위치를 화면 중앙으로 가져오는 기능임.
      // 위쪽은 mainAxisAlignment 속성만으로 만든 거고, 아래는 mainAxisAlignment 속성 플러스 Padding, Expanded 등의 위젯
      // 위쪽보다 아래쪽이 좋은 이유는 위쪽은 Image 위젯 요소에다가 width / height 속성을 하드코딩으로 지정해주고 있음. => Image(width: 180.0, image:...)
      // 아래쪽은 Image 위젯 요소에 직접 width 나 height 속성을 넣어주지 않고 expanded 같은 위젯으로 감쌈으로써 이미지가 바껴도 동적으로 작동함.
      // //
      // after >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Row() 를 바로 넣어줬었는데, 그러면 이미지들이 너무 화면 가장 자리에 딱 달라붙어 있어서 어색함
            // Row() 를 Padding() 위젯으로 한 번 감싸고, 그 Padding Widget 안에 child 로 원래 이던 Row() 를 넣어줌.
            // 그리고 Padding() 위젯에 padding 속성을 32만큼 넣어줌.
            Padding(
              padding: EdgeInsets.all(32.0),
              child: Row(
                children: <Widget>[
                  // Expanded: 영어 의미 그대로 child 로 받는 요소를 넓히는 위젯
                  // Expanded > flex: 그냥 web 개발할 때 css 에서 flex 비율 정하는 거랑 비슷함. 하나는 flex:2 주고 하나는 flex:1 주면 두개끼리 크기가 2:1 비율로 확장됨.
                  // 이미지 간결하게 부르기 > Image(image:AssetImage('assets/myImage.png')) ==>> Image.asset('assets/myImage.png')
                  Expanded(
                      // flex: 2,
                      child: Image.asset('assets/assets_login/dice$dice1.png'),
                  ),
                  // 두 이미지 사이에 공간 조금 만들어주려고 비어 있는 박스 하나 꼽사리로 끼워넣음.
                  SizedBox(width: 20,),
                  Expanded(
                      // flex: 1,
                      child: Image.asset('assets/assets_login/dice$dice2.png'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60,),
            ButtonTheme(
              minWidth: 100.0,
              height: 60.0,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                  ),
                  onPressed: (){
                    // setState() 는 그냥 이렇게 아무 데서나 부르면 되네
                    setState(() {
                      dice1 = Random().nextInt(6) + 1;
                      dice2 = Random().nextInt(6) + 1;
                    });
                    int total = dice1 + dice2;
                    // 와... Dart 에서는 JavaScript 의 template literal 문법을 그냥 기본적으로 제공해버리네
                    showToastMsg("Left dice: $dice1, Right dice: $dice2, tottal: $total");
                  },
                  child: Icon(Icons.play_arrow,
                      color:Colors.white,
                      size: 50.0,
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showToastMsg(message) {
  // showToast > gravity: 어디에서 나타날 건지
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      toastLength: Toast.LENGTH_SHORT,
      gravity:ToastGravity.BOTTOM,
  );
}