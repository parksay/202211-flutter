import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String resultText = 'no Data found';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold() 위젯은 3단계로 나뉜다고 했지.
      // 머리/가슴/배 나뉘는 것처럼 상단 바/메인 화면/하단 메뉴
      // 순서대로 appBar/body/bottom
      appBar: AppBar(
        // 상단 바에 들어갈 제목 문자열
        title: Text('Future test'),
        // 제목을 상단 바의 가운데로 박아주세요
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          // 그냥 top/right/bottom/left 사방으로 padding 주고 싶어서 Padding() 위젯으로 감싸 줌.
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: (){
                    // 버튼 클릭하면 fetchTextValue 함수 실행
                    // fetchTextValue01();
                    fetchTextValue02();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Future test',
                    ),
                  ),
              ),
              SizedBox(
                // 그냥 버튼이랑 아래 안내 문구 사이에 어느 정도 간격 주려고 빈 박스 하나 만듦.
                height: 20.0,
              ),
              Text(resultText,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.redAccent,
                ),
              ),
              Divider(
                height: 20.0,
                thickness: 2.0,
              ),
              FutureBuilder(
                // FutureBuilder 위젯은 비동기 메소드인 Future 를 이용해서 화면 UI 를 그려야 할 때 쉽게 해주는 기능
                // FutureBuilder 위젯은 builder 속성이 필수값임.
                // 내용물 까 보면 아래와 같은 코드가 있음
                // Widget Function(BuildContext context, AsyncSnapshot<T> snapshot);
                // 이걸 보면 builder 에 넣어주는 함수는 전달 인자로 두 가지를 받을 수 있음.
                // 하나는 context / 다른 하나는 snapshot
                // 여기서 snapshot 이란, 특정 시점에서 데이터나 관련 정보들을 담고 있는 객체
                builder: (context, snapshot) {
                  // ConnectionState 는 future 가 어느 정도 단계까지 실행됐는지에 대한 상태 정보임.
                  // ex) ConnectionState.none/ConnectionState.waiting/ConnectionState.done...
                  if(snapshot.connectionState == ConnectionState.done) {
                    // snapshot 상태가 done 끝났을 경우에만 text 를 받아온 정보로 바꿔서 출력해 줌.
                    return Text(snapshot.data.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                      ),
                    );
                  }
                  // 끝난 경우가 아닌 모든 경우에는 그냥 로딩 화면 보여줌
                  return CircularProgressIndicator();
                },
                future: myFuture(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void fetchTextValue01() {
    // Future 는 비동기라서 event loop 에 예약 걸어두고 일단 넘어가기로 함.
    // Duration 3초가 지날 때까지 기다렸다가 .then 구문 실행
    Future.delayed(Duration(seconds: 3))
        .then((value){
          // then 이 실행되면서 안에 setState 메소드 실행함.
          // 클래스 변수 resultText 의 값을 바꿈.
          setState(() {
            this.resultText = 'The data is fetched successfully';
          });
    });
    // 위에 있는 Future 는 비동기라서 event loop 에 예약 걸어두고 일단 넘어왔음.
    // print 가 먼저 실행됨.
    print('Here ends first');
  }
  void fetchTextValue02() async {
    print('Here first');
    // Future 는 비동기라서 원래는 event loop 에 예약만 걸어두 일단 넘어가야 하는데, 여기서는 앞에 await 키워드가 붙어서 Future 내용물이 모두 끝날 때까지 기다렸다가 넘어감.
    // Duration 3초가 지날 때까지 기다렸다가 .then 구문 실행
    await Future.delayed(Duration(seconds: 3))
        .then((value){
          // 위에서 3초 기다렸다가 print 실행
          print('Here second');
          // then 이 실행되면서 안에 setState 메소드 실행함.
          // 클래스 변수 resultText 의 값을 바꿈.
          setState(() {
            this.resultText = 'The data is fetched successfully';
            print('Here third');
          });
    });
    // 위에 있는 Future 는 앞에 await 가 붙어 있어서 비동기지만 동기처럼 다 기다렸다가 넘어옴
    // 위 로직 모두 실행되고 나서 마지막에 실행됨.
    print('Here ends fourth');
  }

  // async 키워드가 붙어서 상위 메소드에서는 이 메소드를 기본적으로 비동기로 실행함.
  // async 키워드가 붙어서 return 자료형이 Future / void
  // 진짜 data 의 자료형은  <> 안에 generic 으로 선언해 줌
  Future<String> myFuture() async {
    await Future.delayed(Duration(seconds: 2));
    // string
    return 'myFuture completed';
  }
}
