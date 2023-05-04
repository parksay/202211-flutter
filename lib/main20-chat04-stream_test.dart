import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "This is stream test app",
      home: StreamTest(),
    );
  }
}


// Stream 이란 무엇인가?
// 예를 들어서 이런 상황.
// 비행기에서 내리면 수화물을 찾지.
// 알람이 울리면 수화물이 나오고 컨베이어 벨트에 올라와서 흘러감.
// 여기서 컨베이어 벨트가 stream 이라면 수화물은 data 임. 알람은 subscribe.
// 내가 어떤 stream 을 subscribe 하고 있으면
// 그 stream 안에 있는 data 에 변화가 생길 때마다
// 그 순간을 snapshot 으로 찍어서 받아옴.
// 강가에 서서 강물에 떠내려오는 거 지켜보고 있는 느낌.
// 강물에 뭐 떠내려오면 그거 snapshot 으로 찍어서 열어보고
// 근데 int 자료형은 그 자체로 하나가 끝이지만 Stream<int> 는 int 자료형이 자꾸 떠내려오는 것

//            |   즉시 사용   |  기다렸다 사용
// 단일 데이터  |  int        | Future<int>
// 복수 데이터  |  List<int>  | Stream<int>


class StreamTest extends StatefulWidget {
  const StreamTest({Key? key}) : super(key: key);

  @override
  State<StreamTest> createState() => _StreamTestState();
}

class _StreamTestState extends State<StreamTest> {

  int totalNum = 2000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("this is counter app for stream test"),
      ),
      body: StreamBuilder(
        stream: streamAddCounter(),
        builder: (context, snapshot) {
          final snapshotNum = snapshot.data.toString();
          return Center(
            child: Text("current snapshotNum is $snapshotNum"),
          );
        },
      ),
    );
  }

  Stream<int> streamAddCounter() {
    return Stream<int>.periodic(
      Duration(seconds: 1),
        (counterNum) {
          print(counterNum);
          return totalNum + counterNum;
        }
    );
  }

}
