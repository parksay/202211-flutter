import 'package:flutter/material.dart';
import 'main08-login04-myButton.dart';

class MyLogIn extends StatelessWidget {


  // 이 파일/클래스/위젯은 여기서 혼자 쓰는 게 아니고 "main08-login02-after.dart" 파일에서 불러다가 쓰는 부품임.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text(
              'Here My Login App Title',
              style: TextStyle(color: Colors.white),
            )
        ),
        body: _buildMyButton(),
    );
  }

  // Dart 언어에서 앞에 _ 언더바를 붙이면 접근 제어자 private 이 된다고 했지.
  // 언더바 붙으면 그 파일 안에서만 접근가능하다고 했어.
  // 괜히 접근해서 값 함부로 바꾸거나 하지 못하게 막으려고 설정하는 접근제어자.
  // "main06-modifier-const_and_final.dart" 파일 보고 와
  // final IsPrivate testInstance = new IsPrivate();
  // testInstance._thisIsPriavte(); // 이거는 에러남. 자동 완성으로 찾아오지도 못 함.
  // testInstance.thisIsNotPriavte(); // 이거는 에러 안 남. 자동 완성에도 뜸.
  Widget _buildMyButton() {
    return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyButton(
                myImage: Image.asset('assets/kakaotalk.png',
                  width: 30.0,
                ),
                myText: Text('login button - kakao',
                    style: TextStyle(
                      color:Colors.black87,
                      fontSize: 15.0,
                    )
                ),
                myColor: Colors.yellowAccent,
                myRadius: 4.0,
                myOnPressed: (){ print('hello');},
              ),
              SizedBox(
                height: 10.0,
              ),
              MyButton(
                  myImage: Image.asset('assets/instagram.png',
                    width: 30.0,
                  ),
                  myText: Text('login button - instagram',
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 15.0,
                      )
                  ),
                  myColor: Colors.lightBlueAccent,
                  myRadius: 4.0,
                  myOnPressed: (){ print('hello');},
              ),
              SizedBox(
                height: 10.0,
              ),
              // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
              // 여기 위까지가 우리가 "main11-login-myButton.dart" 파일에서 따로 만들어 둔 MyButton() 컴포넌트를 불러와서 쓰고 있는 부분.
              // 아래부터는 원래 있던 ButtonTheme() 부터 하나하나 다 넣어줘서 만들어야 했던 부분.
              // 이렇게 다 한 파일에 풀어헤치다 보면 코드 엄청 길어지고 지저분해지고 복잡해지고 뎁스 지옥 생김.
              // 계속 불러다 써야 하는 요소인 경우에는 위처럼 따로 컴포넌트를 만들어두자.
              // 그럼 그때그때 바뀌는 값만 최소한으로 넣어서 여러 번 불러다 써도 가독성도 좋고 편함.
              ButtonTheme(
                  height: 50.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: (){ print('hello');},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset('assets/instagram.png',
                          width: 30.0,
                        ),
                        Text('login button - instagram',
                            style: TextStyle(
                              color:Colors.black87,
                              fontSize: 15.0,
                            )
                        ),
                        Opacity(
                          opacity: 0.0,
                          child: Image.asset('assets/instagram.png',
                            width: 30.0,
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          )
      );
  }
}