import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello My App',
      theme: ThemeData(
          primarySwatch: Colors.red
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App Bar'),
        // title 을 중앙 정렬
        centerTitle: true,
        elevation: 0.0,
        // 가장 앞쪽에 먼저 배치할 요소들
        // Scaffold 안에 appBar 속성 넣고 drawer 속성 넣으면, 자동으로 appBar 왼쪽에 햄버거 메뉴 생김.
        // 그래서 여기서 leading 속성을 안 써서 각주처리 해둠.
        // leading: IconButton(
        //   icon:Icon(Icons.menu),
        //   // IconButton 은 'onPressed' 라는 파라미터를 꼭 넣어줘야 함. 버튼 클릭했을 때 동작임.
        //   onPressed: (){
        //     print('button menu is clicked');
        //   },
        // ),
        // actions는 AppBar 위젯에 넣어주는 파라미터. AppBar의 'title' 요소 뒤에 나오늘 요소들
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.shopping_cart),
            // IconButton 은 'onPressed' 라는 파라미터를 꼭 넣어줘야 함. 버튼 클릭했을 때 동작임.
            onPressed: (){
              print('button shopping_cart is clicked');
            },
          ),
          IconButton(
            icon:Icon(Icons.search),
            // IconButton 은 'onPressed' 라는 파라미터를 꼭 넣어줘야 함. 버튼 클릭했을 때 동작임.
            onPressed: (){
              print('button search is clicked');
            },
          ),
        ],
      ),
      // drawer 메뉴는 버튼 누르면 서랍장처럼 왼쪽에서 스르륵 열리는 사이드 메뉴 바.
      // drawer 속성 넣어주면 appBar 에 자동으로 햄버거 메뉴 버튼이 생김.
      drawer: Drawer(
        child: ListView(
          // 여백이 필요 없음
          padding: EdgeInsets.zero,
          // ListView 는 목록을 보여주는 위젯이기 때문에 children 으로 <Widget>[] 위젯들의 배열이 들어감.
          children: <Widget>[
            // drawer 메뉴 헤더에 유저 정보 넣기
            UserAccountsDrawerHeader(
                // 유저 정보 - 이름
                accountName: Text("hello"),
                // 유저 정보 - 이메일
                accountEmail: Text("world"),
                currentAccountPicture: CircleAvatar(
                  // backgroundImage: AssetImage('./../assets/kakaotalk.png'),
                  backgroundColor: Colors.white,
                ),
              // drawer 메뉴 헤더 안에 아래로 자세히 보기 삼각형 버튼이 생김
              onDetailsPressed: () { print("userAccount header button clicked"); },
              // 꾸미기 속성
              decoration: BoxDecoration(
                // 색깔 지정
                color: Colors.red[200],
                // 곡률 지정 > 어디에 얼마 만큼 곡선 줄지
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                )
              ),
            )
          ],
        ),

      ),
    );
  }
}
