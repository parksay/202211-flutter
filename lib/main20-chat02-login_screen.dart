import 'package:first_app/config-chat-palette.dart';
import 'package:flutter/material.dart';



class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  // Log in 탭과 Sign up 탭 중에 어느 탭이 활성화돼 있는지 상태 변수
  bool isSignupScreen = true;
  // form 필드에 넣어줄 key 변수 - FormState 를 받아옴
  final _formKey = GlobalKey<FormState>();
  // 사용자 입력 값들을 임시로 넣어둘 문자열 변수
  String userName = "";
  String userEmail = "";
  String userPassword = "";
  // 로그인 버튼 클릭하면 실행될 함수
  void _tryValidation() {
    // _formKey 를 여러 군데 Form 위젯에 key 속성으로 넣어 놨는데
    // _formKey.currentState 그 중에 현재 활성화돼 있는 Form 위젯에서
    // validator 를 작동시켜보고
    // 그 결과 값은 isValid 에 저장하기
    final isValid = _formKey.currentState!.validate();
    if(isValid) {
      // 만약 validator 가 유효했다면
      _formKey.currentState!.save();
      // 모든 TextFormField 가 가지고 있는 onSaved() 메소드를 작동시킴

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/assets_chat/background_chat.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: 90,
                    left: 20
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Welcome ",
                        style: TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: isSignupScreen ? "to Chat App!" : "Back!",
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      isSignupScreen ? "Sign up to continue" : "Sign in to continue",
                      style: TextStyle(
                        letterSpacing: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedPositioned( // Positioned 랑 똑같은 위젯인데 애니메이션 기능이 추가된 Positioned
              duration: Duration(milliseconds: 500),  // AnimatedPositioned 에서는 duration 속성을 꼭 넣어줘야 함.
              curve: Curves.easeIn,
              top: 180.0,
              child: AnimatedContainer( // Container 랑 똑같은 위젯인데 애니메이션 기능이 추가된 Container
                duration: Duration(milliseconds: 500),  // AnimatedContainer 에서는 duration 속성을 꼭 넣어줘야 함.
                curve: Curves.easeIn,
                padding: EdgeInsets.all(20.0),
                height: isSignupScreen ? 280.0 : 230.0,
                width: MediaQuery.of(context).size.width - 40.0,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text("Log in",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen ? Palette.textColor1 : Palette.activeColor ,
                                ),
                              ),
                              if(!isSignupScreen)
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text("Sign up",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen ? Palette.activeColor : Palette.textColor1,
                                ),
                              ),
                              if(isSignupScreen)
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if(isSignupScreen)
                      Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Form(
                        key: _formKey, // 클래스 변수로 만들어 두었던 formKey
                        child: Column(
                          children: [
                            TextFormField(
                              key: ValueKey(1), // TextFormField 위젯이 여러 개 있는 중에 이 특정한 위젯을 구별하는 고유한 key 값
                              validator: (value) {
                                // validaiton 이 TextFormField 위젯 안에 자체적으로 가지고 있네!
                                if(value == null || value.isEmpty || value.length < 4) {
                                  return "Please input name at least 4 characters";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                if(value == null) {
                                  return;
                                }
                                userName = value;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle,
                                color: Palette.iconColor
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(35.0),),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                  color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(35.0),),
                                ),
                                hintText: "user name",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Palette.textColor1,
                                ),
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              key: ValueKey(2),
                              validator: (value) {
                                // validaiton 이 TextFormField 위젯 안에자체적으로 가지고 있네!
                                if(value == null || value.isEmpty || !value.contains("@")) {
                                  return "Please input a valid email address";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                if(value == null) {
                                  return;
                                }
                                userEmail = value;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email,
                                    color: Palette.iconColor
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(35.0),),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(35.0),),
                                ),
                                hintText: "email",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Palette.textColor1,
                                ),
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              key: ValueKey(3),
                              validator: (value) {
                                // validaiton 이 TextFormField 위젯 안에자체적으로 가지고 있네!
                                if(value == null || value.isEmpty || value.length < 6) {
                                  return "Please input password at least 6 characters";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                if(value == null) {
                                  return;
                                }
                                userPassword = value;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock,
                                    color: Palette.iconColor
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(35.0),),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(35.0),),
                                ),
                                hintText: "password",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Palette.textColor1,
                                ),
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if(!isSignupScreen)
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Form(
                        key: _formKey, // 클래스 변수로 만들어 두었던 formKey
                        child: Column(
                          children: [
                            TextFormField(
                              key: ValueKey(4),
                              validator: (value) {
                                // validaiton 이 TextFormField 위젯 안에자체적으로 가지고 있네!
                                if(value == null || value.isEmpty || !value.contains("@")) {
                                  return "Please input a valid email address";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                if(value == null) {
                                  return;
                                }
                                userEmail = value;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email,
                                    color: Palette.iconColor
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(35.0),),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(35.0),),
                                ),
                                hintText: "email",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Palette.textColor1,
                                ),
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              key: ValueKey(5),
                              validator: (value) {
                                // validaiton 이 TextFormField 위젯 안에자체적으로 가지고 있네!
                                if(value == null || value.isEmpty || value.length < 6) {
                                  return "Please input password at least 6 characters";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                if(value == null) {
                                  return;
                                }
                                userPassword = value;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock,
                                    color: Palette.iconColor
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(35.0),),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(35.0),),
                                ),
                                hintText: "password",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Palette.textColor1,
                                ),
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            top: isSignupScreen ? 430 : 380,
            right: 0,
            left: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(15),
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: GestureDetector(
                  onTap: () {
                    _tryValidation();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange,
                          Colors.red,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Icon(Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 125,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text(isSignupScreen ? "or Sign Up With" : "or Log In With"),
                SizedBox(
                  height: 10,
                ),
                TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    minimumSize: Size(155, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Palette.googleColor,
                  ),
                  icon: Icon(Icons.add),
                  label: Text("Google"),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
