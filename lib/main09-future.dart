import 'dart:io';

// import 'dart:io';
// 'dart:io' 는 socket 이나 http 통신처럼 외부랑 데이터 주고 받을 때 사용하는 라이브러리

// 이 파일은 "lib" 말고 "test" 디렉토리에서 돌려야 가상 디바이스에 안 올리고 실행만 함


// 개념 필기
// Future
// 약간 JavaScript 에서 Promise 같은 느낌인가 봄
// 미래에 무언가를 받을 거라는 약속 같은 거
// 예를 들어 우리가 햄버거 가게에 감. 키오스크에서 햄버거를 고르고 결제함.
// 그러면 영수증을 받고 주문 번호를 발급 받음.
// 우리는 미래에 주문 번호가 우리 차례까지 오면 우리가 주문했던 햄버거를 받게 되리라는 것을 알고 있음.
// 그래서 그동안 화장실도 다녀오고 노래도 듣고 게임도 하고 하면서 기다리기만 하면 됨.
// Future 도 비슷한 느낌.
// Future 를 사용하면 Future 라는 객체, 말하자면 그냥 빈 박스 같은 걸 하나 먼저 받음.
// 그리고 미래의 어느 시점에 그 박스를 열어 보면 그 안에 String 이든 Image 든 실제 뭔가가 들어 있음.
// 햄버거 영수증을 받으면 우리는 미래에 어떤 햄버거를 받게 될지 알고 있지.
// 그거처럼, Future 에서도 어떤 객체를 받게 될지 지정할 수 있음. Future<String>/Future<Image> 이런 식으로 제네릭처럼.
// async/await 는 뭐... JavaScript 랑 비슷한 듯


void main() {
  showData();
}

void showData() {
  startTask();
  // accessData1();
  // accessData2();
  accessData3();
  fetchData();
}

void startTask() {
  String info1 = "요청 수행 시작";
  print(info1);
}

void accessData1() {
  String info2 = "데이터에 접속 중";
  print(info2);
  // > 요청 수행 시작
  // > 데이터에 접속 중
  // > 잔액은 8,500원입니다
  // 걍 showData() 에서 지정한 순서대로 실행됨
}

void accessData2() {
  Duration time = Duration(seconds: 3);
  sleep(time);
  String info2 = "데이터에 접속 중";
  print(info2);
  // > 요청 수행 시작
  // (...3초 후...)
  // > 데이터에 접속 중
  // > 잔액은 8,500원입니다
  // Duration() => 그냥 지연시키는 객체. 얼마 만큼 오래 지연시킬지 정보를 객체로 들고 있음.
  // showData() 에서 accessData2() 를 실행할 때, sleep() 만큼 기다렸다가 실행 됨. setTimeOut 같은 건가 봐. 대신 동기임. setTimeOut 의 동기 버전.
}

void accessData3() {
  Duration time = Duration(seconds: 3);
  if(time.inSeconds > 2) {
    Future.delayed(time, () {
      String info2 = "데이터 처리 완료";
      print(info2);
    });
  } else {
    String info2 = "데이터를 바로 가져왔습니다";
    print(info2);
  }
  // > 요청 수행 시작
  // > 잔액은 8,500원입니다
  // > 데이터 처리 완료
  // 순서가 확 바꼈지.
  // showData() 에서는 startTask(); > accessData3(); > fetchData(); 순서로 실행했는데
  // 실제로는 startTask(); >  fetchData(); > accessData3(); 순서로 실행됐음.
  // accessData3() 에서는 Future.delayed(); 가 실행되면서 time 만큼 지난 뒤에 callBack 함수가 실행된다는 것을 약속함.
  // time 만큼 지난 미래에 callBack 함수가 실행된다는 것을 앎.
}

void fetchData() {
  String info3 = "잔액은 8,500원입니다";
  print(info3);
}