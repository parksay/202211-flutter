

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
// Async/await 는 뭐... JavaScript 랑 비슷한 듯


void main() {
  // showData1();   // > synchronous
  showData2();    // > asynchronous
}

void showData1() {
  startTask();
  String account = accessData4();
  fetchData(account);
}

void showData2() async {
  startTask();
  String account = await accessData5();
  fetchData(account);
}

void startTask() {
  String info1 = "요청 수행 시작";
  print(info1);
}

String accessData4() {
  //
  String account = "0";
  //
  Duration time = Duration(seconds: 3);
  //
  Future.delayed(time, () {
    account = "8,500";
    print(account);
  });
  //
  return account;
  // 요청 수행 시작
  // 잔액은 0만 원입니다
  // (...3초 후...)
  // 8,500
  // showData1(); 가 의도한 실행 순서는 아래와 같음.
  // startTask(); 를 먼저 실행하고, 그 다음 accessData4(); 를 실행해서 return 값 받고, 그 받은 return 값을 다시 fetchData(); 에 넣어줌. fetchData(); 가 데이터 포매팅해서 출력함.
  // 근데 실제로 보니까 어때? 여전히 startTask(); >  fetchData(); > accessData4(); 순서로 실행됐음.
  // 이 문제를 해결하는 게 accessData5()
  // method 의 return 값을 String 이 아니라 Future<String> 으로 해주고, async/await 제어자를 활용하는 것.
}

Future<String> accessData5() async {
  //
  String account = "0";
  //
  Duration time = Duration(seconds: 3);
  //
  await Future.delayed(time, () {
    account = "8,500";
    print(account);
  });
  //
  return account;
  // 요청 수행 시작
  // (...3초 후...)
  // 8,500
  // 잔액은 8,500만 원입니다
  // 드디어 원하던 대로 나옴.

}

void fetchData(String account) {
  String info3 = "잔액은 $account만 원입니다";
  print(info3);
}

// Future 클래스는 비동기 작업을 할 때 사용함
// Future 는 일정한 시간이 지난 뒤에 실제 데이터를 넣어주거나 중간에 실패하면 에러를 반환함
// async 제어자가 붙은 class 는 await method 를 가지고 있음