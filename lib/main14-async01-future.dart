

// 이 파일은 "lib" 말고 "test" 디렉토리에서 돌려야 가상 디바이스에 안 올리고 실행만 함


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

void main01() {
  // 1. 동기로 가장 먼저 실행
  print('Before the Future');
  // 2. 일단 Future 에 달려 있는 거 다 event loop 에 넣어둠 >>>>>>>>
  Future(() {
    // 4. 동기로 돌릴 수 있는 코드가 모두 끝나고 이제 event loop 에 넣어뒀던 Future 실행하러 옴
    print('Running the Future');
  }).then((_){
    // 5. Future 실행 후에 딸려 있는 then 실행
    print('Future is complete');
  });
  // 2. 일단 Future 에 달려 있는 거 다 event loop 에 넣어둠 <<<<<<<<
  // 3. 그 다음 동기로 다음 명령문 실행
  print('After the Future');

  // result
  // Before the Future
  // After the Future
  // Running the Future
  // Future is complete
}


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


// 메소드에 async 키워드를 붙이면?
// 그 메소드가 반환하는 결과물은 Future 객체가 됨.
// 그 메소드 안에서는 코드들이 synchronous 방식으로 실행됨.
// 코드를 쭉쭉 내려가다가 await 키워드를 만나면 그 키워드가 붙은 Future 가 완료될 때까지 기다림.
// Future 가 완료되고 나서 다음 코드들을 그대로 synchronous 방식으로 이어서 진행함.
void main02() async {
  // 1. 동기로 가장 먼저 실행
  print('Before the Future');
  // 2. 원래는 Future 라서 event loop 에 넣어두면 되는데 await 키워드가 있어서 Future 내용물을 동기로 바로 실행함.
  await Future(() {
    // 3. 동기로 Future 실행
    print('Running the Future');
  }).then((_){
    // 4. Future 에 딸려 있는 then 실행
    print('Future is complete');
  });
  // 5. 동기로 Future 를 실행하고 나서 마지막으로 동기로 print 실행
  print('After the Future');

  // result
  // Before the Future
  // Running the Future
  // Future is complete
  // After the Future
}


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


void main03() {
  // 1. 일단 동기로 print 함수 실행
  print('Fetching user order...');
  // 2. 동기로 다음 print 함수 암에 있는 createOrderMessage03 함수 실행
  print(createOrderMessage03());
  // 6. return 받은 문자열 출력.

  // result
  // Fetching user order...
  // Your order is: Instance of 'Future<String>'
}

String createOrderMessage03() {
  // 3. 동기로 들어와서 fetchUserOrder03 함수 실행.
  var order = fetchUserOrder03();
  // 5. fetchUserOrder03 함수에서 상자(Future 객체)만 받아들고서 일단 다음 명령문 return 을 실행.
  // $order 에 지금 Future 가 들어 있으니까 제대로 출력될 리가 없음.
  // "Your order is: Instance of 'Future<String>'" 라는 문자열을 return 함.
  return 'Your order is: $order';
}

Future<String> fetchUserOrder03() {
  // 4. 동기로 실행할 때는 일단 상자(Future 객체)를 즉시 반환한다고 했음.
  // 나중에 Future 안이 실행되고 나서야 그 상자 안을 실제 값으로 채워준다고 했음.
  return Future.delayed(
    Duration(seconds: 2),
      ()=> 'latte ice',
  );
}


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


// main04() 메소드에 async 가 붙었음.
// main04() 가 return 할 수 있는 값은 Future<> 객체 or void
// main04() 안을 기본적으로는 synchronous 방식으로 진행함.
// 대신 main04() 메소드 안에서 await 키워드를 사용할 수 있음.
// await 키워드를 사용하면 그 키워드가 붙은 asynchronous 명령문이 끝날 때까지 기다림
void main04() async {
  // 1. 일단 동기로 print 함수 실행
  print('Fetching user order...');
  // 2. 동기로 다음 print 함수 안에 있는 createOrderMessage04 함수 실행
  // createOrderMessage04() 메소드는 async 가 붙은 비동기 메소드임.
  // 원래 비동기 메소드는 그 즉시 Future<> 객체를 임시로 받아 들고서 다음 명령문으로 넘어가는데,
  // await 가 붙었으니까 createOrderMessage04 메소드 안의 명령문들이 모두 끝날 때까지 기다리기로 함.
  print(await createOrderMessage04());
  // 6. return 받은 문자열 출력.

  // result
  // Fetching user order...
  // Your order is: latte ice
}


// createOrderMessage04() 메소드에 async 가 붙었음.
// createOrderMessage04() 가 return 할 수 있는 값은 Future<> 객체 or void
// createOrderMessage04() 안에서는 기본적으로는 synchronous 방식으로 진행함.
// 대신 createOrderMessage04() 메소드 안에서 await 키워드를 사용할 수 있음.
// await 키워드를 사용하면 그 키워드가 붙은 asynchronous 명령문이 끝날 때까지 기다림
Future<String> createOrderMessage04() async {
  // 3. 동기로 들어와서 fetchUserOrder04 함수 실행.
  // fetchUserOrder04 메소드는 async 가 붙어서 비동기 함수임.
  // 원래 비동기 메소드는 그 즉시 Future<> 객체를 임시로 받아 들고서 다음 명령문으로 넘어가는데,
  // await 가 붙었으니까 fetchUserOrder04 메소드 안의 명령문들이 모두 끝날 때까지 기다리기로 함.
  var order = await fetchUserOrder04();
  // 5. fetchUserOrder04 안의 로직이 모두 끝날 때까지 기다렸다가 문자열 "latte ice" 를 받아옴.
  // 위에서 받아온 문자열을 채워 넣어서
  // "Your order is: latte ice" 라는 문자열을 return 함.
  return 'Your order is: $order';
}


// fetchUserOrder04() 메소드에 async 가 붙었음.
// fetchUserOrder04() 가 return 할 수 있는 값은 Future<> 객체 or void
// fetchUserOrder04() 안에서는 기본적으로는 synchronous 방식으로 진행함.
// 대신 fetchUserOrder04() 메소드 안에서 await 키워드를 사용할 수 있음.
// await 키워드를 사용하면 그 키워드가 붙은 asynchronous 명령문이 끝날 때까지 기다림
Future<String> fetchUserOrder04() async {
  // 4. 동기로 들어와서 return 실행.
  // return 하는 Future 는 비동기임.
  // 원래대로라면 그 즉시 Future<> 객체를 임시로 return 하고 나중에 그 안에 실제 값을 넣어주는데,
  // await 가 붙었으니까 Future<> 안의 내용을 다 끝낼 때까지 기다림.
  // 2초를 기다리고 문자열 "latte ice" 를 return 함.
  return await Future.delayed(
    Duration(seconds: 2),
      ()=> 'latte ice',
  );
}

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


// main05() 메소드에 async 가 붙었음.
// main05() 가 return 할 수 있는 값은 Future<> 객체 or void
// main05() 안을 기본적으로는 synchronous 방식으로 진행함.
// 대신 main05() 메소드 안에서 await 키워드를 사용할 수 있음.
// await 키워드를 사용하면 그 키워드가 붙은 asynchronous 명령문이 끝날 때까지 기다림
void main05() async {
  // 1. 일단 기본적으로 synchronous 방식으로 함수 진행함. methodA() 실행.
  methodA();
  // 3. methodB() 는 async 키워드가 붙은 비동기 메소드임.
  // 그 앞에 await 키워드가 붙었으므로 methodB() 안의 내용 코드가 모두 끝날 때까지 기다림.
  await methodB();
  // 9. methodC 메소드는 async 키워드가 붙은 비동기 메소드임.
  // 근데 앞에 await 키워드가 붙었으므로 methodC 메소드 안의 로직이 모두 끝날 때까지 기다렸다가 synchronous 방식으로 이어서 진행함.
  await methodC('main');
  // 13. 일단 기본적으로 synchronous 방식으로 함수 진행함. methodD() 실행.
  methodD();
  // 15. main05() 메소드 안에서 실행할 수 있는 모든 synchronous 로직이 끝났음.
  // 이제 event loop 에 예약 걸어 뒀던 애들 꺼내와서 실행해야 함.
  // methodC 에서 예약 걸어둔 게 많았으니 그리로 내려감.

  // A
  // B start
  // C start from B
  // C end from B
  // B end
  // C start from main
  // C end from main
  // D
  // C running Future from B
  // C end of Future from B
  // C running Future from main
  // C end of Future from main
}


// methodA 는 그냥 보통 메소드. async 키워드도 붙어 있지 않음.
// 기본적으로 synchronous 방식으로만 진행하고 끝내면 됨
methodA() {
  // 2. 그냥 synchronous 방식으로 print 실행하고 끝냄.
  print('A');
}


// methodB() 메소드에 async 가 붙었음.
// methodB() 가 return 할 수 있는 값은 Future<> 객체 or void
// methodB() 안을 기본적으로는 synchronous 방식으로 진행함.
// 대신 methodB() 메소드 안에서 await 키워드를 사용할 수 있음.
// await 키워드를 사용하면 그 키워드가 붙은 asynchronous 명령문이 끝날 때까지 기다림
methodB() async {
  // 4. 기본적으로 synchronous 방식으로 print 실행함.
  print('B start');
  // 5. methodC 메소드는 async 키워드가 붙은 비동기 메소드임.
  // 근데 앞에 await 키워드가 붙었으므로 메소드 안의 로직이 모두 끝날 때까지 기다렸다가 synchronous 방식으로 이어서 진행함.
  await methodC('B');
  print('B end');
}


// methodC() 메소드에 async 가 붙었음.
// methodC() 가 return 할 수 있는 값은 Future<> 객체 or void
// methodC() 안을 기본적으로는 synchronous 방식으로 진행함.
// 대신 methodC() 메소드 안에서 await 키워드를 사용할 수 있음.
// await 키워드를 사용하면 그 키워드가 붙은 asynchronous 명령문이 끝날 때까지 기다림
methodC(String from) async {
  // 6. 기본적으로 synchronous 방식으로 print 실행함.
  // 10. 기본적으로 synchronous 방식으로 print 실행함.
  print('C start from $from');

  // 7. Future 는 asynchronous 메소드임.
  // Future 안의 내용은 진행하지 않고 from 변수에 "B" 만 채워서 일단 event loop 에 예약만 걸어둠.
  // 그리고 다음 로직을 synchronous 방식으로 이어서 진행함.
  // 11. Future 는 asynchronous 메소드임.
  // Future 안의 내용은 진행하지 않고 from 변수에 "main" 만 채워서 일단 event loop 에 예약만 걸어둠.
  // 그리고 다음 로직을 synchronous 방식으로 이어서 진행함.
  Future(() {
    // 16. main05() 메소드에서 실행할 수 있는 모든 synchronous 로직이 끝나고 이제 event loop 에 예약 걸어 뒀던 애들 실행하러 옴.
    // from 변수에 "B" 채워놨던 Future 꺼내와서 synchronous 방식으로 print 실행
    // 18. main05() 메소드에서 실행할 수 있는 모든 synchronous 로직이 끝나고 이제 event loop 에 예약 걸어 뒀던 애들 실행하러 옴.
    // from 변수에 "main" 채워놨던 Future 꺼내와서 synchronous 방식으로 print 실행
    print('C running Future from $from');
  }).then((_){
    // 17. future 실행이 끝나고 거기에 딸려 있는 then 실행.
    // from 변수에 "B" 채워놨던 Future 꺼내와서 synchronous 방식으로 print 실행
    // 19. future 실행이 끝나고 거기에 딸려 있는 then 실행.
    // from 변수에 "main" 채워놨던 Future 꺼내와서 synchronous 방식으로 print 실행
    print('C end of Future from $from');
  });

  // 12. 기본적으로 synchronous 방식으로 print 실행함.
  print('C end from $from');
}


// methodA 는 그냥 보통 메소드. async 키워드도 붙어 있지 않음.
// 기본적으로 synchronous 방식으로만 진행하고 끝내면 됨
methodD() {
  // 14. 기본적으로 synchronous 방식으로 print 실행함.
  print('D');
}