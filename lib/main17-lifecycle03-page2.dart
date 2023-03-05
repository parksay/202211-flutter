import 'package:flutter/material.dart';

class MyNavigatorPage2 extends StatefulWidget {
  const MyNavigatorPage2({Key? key}) : super(key: key);

  @override
  State<MyNavigatorPage2> createState() => _MyNavigatorPage2State();
}

class _MyNavigatorPage2State extends State<MyNavigatorPage2> {

  @override
  void initState() {
    super.initState();
    // React.js 에서 componentDidMount() 같은 느낌인 듯
    // 마우스 올려서 설명 보면 이렇게 나와 있음
    // Called when this object is inserted into the tree.
    // The framework will call this method exactly once for each State object it creates.
    print('MyNavigatorPage2 > initState');
  }


  @override
  void dispose() {
    super.dispose();
    // React.js 에서 componenWillUmount() 같은 느낌인 듯
    // 마우스 올려서 보면 이런 설명 나와 있음
    // Called when this object is removed from the tree permanently.
    // The framework calls this method when this State object will never build again.
    print('MyNavigatorPage2 > dispose');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ScreenB'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                ElevatedButton(
                  onPressed: (){
                    // Navigator.pushNamed(context, routeName);
                    Navigator.pushNamed(context, '/page3');
                  },
                  child: Text('go to page3'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                ),
              ],
            )
        )
    );
  }
}

