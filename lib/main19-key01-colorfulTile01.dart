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


// 색상만 다르고 똑같은 타일이 두 개가 놓여 있음.
// 이 두 타일끼리 색깔이 바뀌는 버튼을 만듦.
// 타일은 하나의 클래스이고, 그 클래스는 색상 정보를 클래스 변수에 가지고 있음.
// 타일 클래스를 두 개 만들어서 리스트에 넣어줌.
// 타일을 만들 때 그 타일 클래스가 지니고 있을 색상은 랜덤하게 뽑아서 만들어 줌.
// 이제 버튼을 누르면 리스트에서 타일0 을 빼고 다시 리스트에 넣음.
// 리스트에서 타일0 이 빠졌으니 타일1 이 타일0 자리로 감.
// 그리고 타일0 을 다시 리스트에 넣었으니 타일0 이 타일1 자리로 감.
// 결과적으로 두 타일이 자리가 바뀜.

class PositionedTile extends StatefulWidget {
  const PositionedTile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PositionedTileState();
}

class _PositionedTileState extends State<PositionedTile> {
  List<Widget> tiles = [
    StatelessColorfulTile(),
    StatelessColorfulTile(),
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

class StatelessColorfulTile extends StatelessWidget {
  StatelessColorfulTile({Key? key}) : super(key: key);
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