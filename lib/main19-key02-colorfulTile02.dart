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

// 이렇게 하면 이건 버튼을 눌렀을 때 색상이 잘 바뀜.
// 원래 안 바뀌어야 하는데...? 왜 잘 바뀌지?
// 아직 key 값을 넣어주지도 않았는데?
// 자세히 보면 타일의 색상을 결정하는 myColor 변수를 들고 있는 주체가 다르기 때문.
// final Color myColor;
// 이거를 이 변수를 선언하는 곳이 보면 아래 타일 클래스 자체임.
// class StatefulColorfulTile extends StatefulWidget { ... }
// 클래스 자체에서 들고 있으니까
// 리스트에서 하나씩 꺼내서 다시 넣어주는 과정에서 그 클래스 자체가 움직임
// List<Widget> tiles = [
//   StatefulColorfulTile(myColor: getRandomColor()),
//   StatefulColorfulTile(myColor: getRandomColor()),
// ];
// 클래스가 들고 있는 정보들이 다같이 움직이니까 색상도 같이 바뀜.
// 근데 타일의 색상을 결정하는 Color myColor 변수를 state 에서 들고 있는다면?
// 버튼을 아무리 눌러도 색상이 바뀌지 않음.
// 그 이유는 main19-key03-colorfulTile03.dart 에서 이어서


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
  StatefulColorfulTile({Key? key}) : super(key: key);
  Color myColor = getRandomColor();

  @override
  State<StatefulColorfulTile> createState() => _StatefulColorfulTileState();
}



class _StatefulColorfulTileState extends State<StatefulColorfulTile> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.myColor,
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