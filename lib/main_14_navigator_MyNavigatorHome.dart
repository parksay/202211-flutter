import 'package:flutter/material.dart';
import 'main_14_navigator_MyNavigatorPage1.dart';
import 'main_14_navigator_MyNavigatorPage2.dart';
import 'main_14_navigator_MyNavigatorPage3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp >  initialRoute - 'home' 속성이랑 비슷함. 가장 먼저 띄워져 있을 화면을 말함. 단, 'home' 속성이랑 'initialRoute' 속성이랑 둘 다 선언되어 있으면 에러남.
      initialRoute: '/page1',
      // MaterialApp > routes - 내가 띄울 페이지들을 정의하는 속성. map 자료구조로 넣고 읽음. json 자료형처럼 {key: value, key: value} 형대로 들어감. 대신 key 는 'myStr', value 는 () {} 빌더 함수가 들어감.
      // 여기서 '/page1' 이라는 key 로 MyPage1(); 라는 위젯을 넣어뒀으면, 다른 데에서 Navigator 로 부를 때도 '/page1' 이렇게 부르고 MyPage1 이 화면에 띄워짐.
      routes: {
        // key: builder 함수
        '/page1': (context){ return MyNavigatorPage1(); },
        '/page2': (context){ return MyNavigatorPage2(); },
        '/page3': (context){ return MyNavigatorPage3(); },
      },
    );
  }
}

// 조금 복잡한 Navigator 구조를 가지는 앱을 구성해 보자.
// 아래 파일을 각각 따로 만들어 두기.
// MyNavigatorPage1 / MyNavigatorPage2 / MyNavigatorPage3 / MyNavigatorPage4
// 그리고 모든 파일들은 각각 import 'package:flutter/material.dart'; 해줘야 함.
// 각자 페이지는 각각 파일 안에서 구현해 놓기.
// 한 파일에서 다른 파일에서 구현해 놓은 페이지 쓰려면 그 파일도 import 해줘야 함.
