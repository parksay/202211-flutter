import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PositionedTile(),
    );
  }
}


// 여기에서는 버튼을 눌러도 타일의 색상이 바뀌지 않음.
// 그 이유는 타일의 색상을 결정하는 변수를 state 가 들고 있기 떄문.
// Color myColor = getRandomColor();
// 위처럼 타일의 색상을 랜덤한 색상을 받아와서 넣어주고 있는데, 이 색상 변수를 어디에서 들고 있느냐?
// class StatefulColorfulTile extends StatefulWidget { ... }
// 위처럼 클래스에서 들고 있을 때는 버튼을 누르면 타일 색상이 잘 변했지.
// 하지만 아래처럼 state 에서 들고 있을 때는 버튼을 눌러도 타일 색상이 변하지 않아.
// class _StatefulColorfulTileState extends State<StatefulColorfulTile> { ... }
// 왜 state 에서 들고 있으면 색이 안 바뀌나?
// 리스트에서 앞에 있는 타일을 뽑아서 뒤에다 다시 박았어.
// 그러면 예전에는 색상 변수가 클래스 변수로 선언되어 있어서 그 객체 안에 색상 변수가 포함되어 있었기 때문에 타일 위치를 바꾸면 색상도 같이 바꼈어.
// 근데 이제는 클래스는 똑같아.
// 리스트 안에는 똑같은 클래스 StatefulColorfulTile 두 개가 들어 있어.
// 그 클래스 안에는 아무 정보도 없고, 색상 정보는 그 클래스와 연동되어 있는 state 가 들고 있어.
// 이 상태에서 리스트에서 앞에 있는 클래스 객체를 뽑아다가 뒤에다 다시 박아줬다고 해보자.
// 이때, 객체는 이리저리 위치를 바꾸지만 그에 연동된 state 까지 데리고 다니지는 않아.
// state 는 그 자리에 머물러 있고, 객체만 왔다갔다 하는 거.
//      widget tree         element tree
//      /     \               /       \
//  class1    class2      class1    class2
//    |         |           |           |
//  state1    state2      state1    state2
//  ===============================================
//      widget tree         element tree
//      /     \               /       \
//  class2    class1      class2    class1
//    |         |           |           |
//  state1    state2      state1    state2
// 자리가 바뀌고 나면 state 는 class 부터 우선 확인해.
// 내가 generic 으로 상속받고 있는 클래스가 맞는지. (클래스 뒤에 extends State<..?> 있지)
// class 가 바꼈다면 위젯 트리에서 내가 상속받고 있는 클래스 위치를 따라가.
// 근데 class 가 안 바꼈으면 state 는 엘리멘트 트리 안에서 움직이지 않고 그 자리에 있어.
// 근데 색상이 어디에 있다고? 이 state 에 있다고.
// 그래서 리스트 안에서 클래스는 바뀌고 객체가 바뀌어도 색상은 안 바뀌는 거.
// 그럼 이럴 땐 어떻게 해야 하는가?
// 클래스에다가 이름을 지어줘. 너는 개똥이, 너는 철수.
// 그럼 state 는 내가 연동되어 있는 개똥이, 내가 상속 받았던 철수를 따라 다님.
// 이름을 짓는 게 바로 클래스에 key 를 붙여 주는 것.
// 먼저 class 를 확인하고, 그 다음에 key 까지 확인함.
// key 를 붙이는 법 아래
// List<Widget> tiles = [
//     StatefulColorfulTile(key: UniqueKey()),
//     StatefulColorfulTile(key: UniqueKey()),
// ];
// 여태까지 생성자에서 key 받고 있던 게 다 이거였음 ㅋㅋ
// const PositionedTile({Key? key}) : super(key: key);

class PositionedTile extends StatefulWidget {
  const PositionedTile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PositionedTileState();
}

class _PositionedTileState extends State<PositionedTile> {
  List<Widget> tiles = [
    StatefulColorfulTile(),
    StatefulColorfulTile(),
  ];
  // key 를 붙이기
  // List<Widget> tiles = [
  //     StatefulColorfulTile(key: UniqueKey()),
  //     StatefulColorfulTile(key: UniqueKey()),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: tiles,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.double_arrow_rounded),
        onPressed: () {
          swapTiles();
        },
      ),
    );
  }

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
    // 0번에 있던 애를 remove 하고, 지운 애를 return 받아서 다시 1번에다가 insert 한다.
    // 즉, 밑의 돌 빼서 위에다가 받는 거임. 자리가 바뀌는 것

  }
}

class StatefulColorfulTile extends StatefulWidget {
  const StatefulColorfulTile({Key? key}) : super(key: key);

  @override
  State<StatefulColorfulTile> createState() => _StatefulColorfulTileState();
}



class _StatefulColorfulTileState extends State<StatefulColorfulTile> {
  Color myColor = getRandomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColor,
      child: Padding(
        padding: EdgeInsets.all(70.0),
      )
    );
  }

}

getRandomColor() {
  var r = Random();
  Color myColor = Color.fromRGBO(255, r.nextInt(255), r.nextInt(255), 1);
  return myColor;
}