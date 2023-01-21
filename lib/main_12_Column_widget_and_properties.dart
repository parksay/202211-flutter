import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello My Snack Bar',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: MyPage(),
    );
  }
}


// class MyPage extends StatelessWidget {
//   const MyPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.teal,
//         body: SafeArea(
//           // emulator 에서 앱 요소들의 border line 보여주기 기능
//           // flutter inspector 켜서 우측 상단에 설정 아이콘 모음 있음.  거기 있는 아이콘 버튼들 중에 guideline 어쩌구 클릭하면 됨. 다른 버튼들도 유용한 기능.
//           // 이거 켜고 보면 아래 Column 요소가 UI 상에서 어떻게 그려지는지 알 수 있음. Column 위젯은 세로로 차지할 수 있는 공간을 최대로 쭉 가져가면서 그 안에 있는 children 들을 세로로 나열함.
//           child: Column(
//             children: <Widget>[
//               Container(
//                 width: 100,
//                 height: 100,
//                 color: Colors.white,
//                 child: Text('Container 1'),
//               ),
//               Container(
//                 width: 100,
//                 height: 100,
//                 color: Colors.red,
//                 child: Text('Container 2'),
//               ),
//               Container(
//                 width: 100,
//                 height: 100,
//                 color: Colors.blue,
//                 child: Text('Container 3'),
//               ),
//             ],
//           ),
//         ),
//     );
//   }
// }
//

// 잠시 Center 가 어떤 역할을 하는지 조금 보자면
// class MyPage extends StatelessWidget {
//   const MyPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.teal,
//       // 이렇게 해서 inspector > layout guideline 보면 Center 위젯을 중심으로 위/아래/좌/우 에서 가운데로 밀어주고 있는 걸 볼 수 있움.
//       body: Center(
//         child: Text('Text Here', style:TextStyle(backgroundColor: Colors.white)),
//       ),
//     );
//   }
// }



// 다시 위의 코드로 돌아와서. Column 위젯의 여러 속성에 대해 알아보자. (아래에서 Column 위젯에 대해 알아보는 사항들은 Row 위젯에 대해서도 똑같이 적용됨)
// Scaffold > SafeArea > Column 위젯을 Center 위젯으로 감싸기
class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Center(
            // Column 위젯을 Center 위젯으로 감싸게 되니까 모양이 어떻게 됨?
            // Column 위젯은 위아래로 길쭉하게 공간을 차지하고, Center 위젯은 좌우에서 밀어주니까 중간에 기둥 하나가 박힌 모양이 됨
            child: Column(
              // 뭐하러 굳이 이렇게하나? 결과적으로 contents 들이 가운데에 모이게 됐는데, 걍 처음부터 Center 에 넣으면 안 되나? ㄴㄴ. Center 위젯은 single child 위젯, 즉 자식 요소를 하나만 가질 수 있는 요소라서. Column 은 여러 child 를 가질 수 있고, 위아래로 정렬하고 싶을 때
              // Column > mainAxisAlignment - 주축을 기준으로 (Column 위젯은 위아래로, 세로가 주축이지) 정렬을 어떻게 할지 지정
              // mainAxisAlignment: MainAxisAlignment.center,  //  Column 위젯을 Center 로 감싸면서 좌우 중앙이 되었고, 거기서 Column 위젯에 mainAxisAlignment 속성을 center 로 주면서 가운데로 정렬하게 됨
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,  //  web 에서 css 줄 때 "style" 속성에 "display" 는 "flex" 로 주고 "justify-content" 를 "space-evenly" 로 주는 거랑 똑같음. 단, 공간 차지를 취소화하고 위아래로 눌러주는 속성을 삭제해야 함. "mainAxisSize: MainAxisSize.min,"

              // Column > mainAxisSize - 주축을 기준으로 공간을 얼마나 차지할지. Column 위젯은 원래 위아래로 세로로 모든 공간을 차지함. 근데 딱 필요한 공간까지만 차지하도록 만들려면? 주축(Column 위젯에서는 세로)으로 크기를 min 으로 주기
              mainAxisSize: MainAxisSize.min, // 이 속성이 생기는 순간 guideline 보면 좌우만 눌러주고 있다가 위아래로도 눌러주는 선이 생김
              // Column > verticalDirection - 주축을 기죽으로 정렬하는 순서를 어떻게 할지? default 는 down 인데 위에서 아래로 내려옴. up 으로 바꾸면 아래에서 위로 올라옴.
              verticalDirection: VerticalDirection.up,

              // Column > crossAxisAlignment - 보조축을 기준으로 요소들 정렬을 어디부터 시작할지
              crossAxisAlignment: CrossAxisAlignment.end, // web 에서 css 줄 때 "style" 속성에 "display" 는 "flex" 로 주고 "align-content" 를 "flex-end" 로 주는 거랑 똑같음. default 는 center 인 듯.
              // 이 Column > crossAxisAlignment 속성을 응용하면 요소들을 왼쪽 끝이나 오른쪽 끝으로 붙게 만들 수 있음. 눈에 보이지 않는 Container(invisible container) 하나를 가로로 꽉 차게 만들면 됨. 그러면 Column 위젯의 너비가 화면을 꽉차게 되겠지. 아래에 children 안에 예시 만듦.
              // Column > crossAxisAlignment 속성의 값을 CrossAxisAlignment.stretch 이렇게 주고, 밑에 children 들의 width 속성을 없애면 요소들을 가로로 꽉차게 그려줌.

              children: <Widget>[
                Container(
                  width: 50,
                  height: 100,
                  color: Colors.white,
                  child: Text('Container 1'),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: Text('Container 2'),
                ),
                // 요소들 사이에 간격을 주고 싶을 떄? 빈 박스를 만들어주기 - SizedBox
                SizedBox(height: 20,),

                Container(
                  width: 200,
                  height: 100,
                  color: Colors.blue,
                  child: Text('Container 3'),
                ),
                // Container(  // 이런 Container 를 invisible container 라고 부름. 너비는 있는데 높이가 없어서 화면상으로는 보이지 않음. inspector 의 guideline 상으로 보면 그냥 가로로 하나의 선만 보임. 보고 싶으면 height 속성을 20 정도 줘 봐.
                //   width: double.infinity,
                //   color: Colors.amberAccent,
                //   // height: 20,
                // )
              ],
            ),
          ),
        ),
    );
  }
}

// flutter 레이아웃 예제 사이트
// https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e