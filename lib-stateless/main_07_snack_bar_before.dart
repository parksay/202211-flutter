import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello My Snack Bar',
      theme: ThemeData(
          primarySwatch: Colors.red
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  // 여기서 문법을 한번 잘 뜯어 보자. class 이름은 MyPage 야.
  // 이 클래스는 StatelessWidget 를 extends 했어.
  // StatelessWidget 를 extends 하면서 override 해야 하는 함수가 생겼지.
  // 그게 바로 @override Widget build(BuildContext context) {
  // 이 부분을 잘 한번 봐바.
  // 함수 이름은 "build" 이고, return type 은 Widget 이지.
  // 그리고 항상 기본적으로 받아오는 parameter 가 있어.
  // "BuildContext context" 바로 이 부분.
  // 여기서 context 라는 건 변수 이름인데, 그 자료형인 BuildContext 는 대체 뭘까..?
  // 항상 파라미터로 받는 거 보면 뭔가 중요한 거 같은데 말야.
  // BuildContext 는 내 Widget 이 지금 어디에 있는지, Widget 트리 안에서 어느 계층에 존재하는지 위치를 확인하는 요소 같은 거야.
  // 예를 들어서 Scaffold.of(context) 이렇게 하면 context 부터 시작해서, 그 위로 쭉 타고 올라가면서 가장 가까이 있는 Scaffold 자료형의 Widget 을 찾지.
  // 근데 쓰기가 어려운 점이 뭐냐면, 이 context 는 뭔가 인식하기로 내가 있는 바로 그 지점부터 시작해야 할 것 같은데 그게 아니야.
  // return 할 때 던져주는 context 의 부모 Widget 이 들고 있는 context 를 기준으로 들고 와.
  // 그래서 바로 찾으면 없다고 나오는 Widget 도 있고 엉뚱한 걸 찾기도 하지.
  // 그래서 편법으로 쓰는 방법이 있지. builder 써 가지고. 지금부터 보자.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Here is My Snack Bar'),
        // title 을 중앙 정렬
        centerTitle: true,
      ),
      body: Center(
        // 다음 세 버튼은 자주 쓰이는데 모양은 조금 다르지만 기능상으로는 큰 차이는 없음 : RaisedButton / FloatingActionButton / FlatButton (Flutter 가 업데이트되면서 FlatButton 은 TetxtButton 으로, RaisedButton 은 ElevatedButton 이름이 바뀜)
        child: TextButton(
          // TextButton > chile - 버튼에는 필수로 (텍스트 + 눌렀을 때 동작)
          child: Text('click here',
              // text 에 스타일 주기
              style: TextStyle(
                // 텍스트 색상은 하얀색
                color: Colors.white
              ),
          ),
          // TextButton > onPressed - 버튼에는 필수로 (텍스트 + 눌렀을 때 동작)
          onPressed: (){
            print('button clicked');
            // Scaffold.of(context).showSnackBar(SnackBar(content: Text('This is your message'),),);  // 원래 쓰던 게 이거였는데 추후 업데이트에서 deprecated 되면서 아래처럼 씀.
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This is your message'),),);  //
          },
          // TextButton > style - 버튼에 스탕일 주기
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
        ),
      ),
    );
  }
}
