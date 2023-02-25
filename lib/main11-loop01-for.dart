import 'dart:math';

// 이 파일은 "lib" 말고 "test" 디렉토리에서 돌려야 가상 디바이스에 안 올리고 실행만 함


// 가장 클래식한 for 구문.
// 가장 row level 언어라고 평가받는 C 언어에서부터 내려오는 전통적인 스타일 문법
// Java 에서도 똑같이 쓰지. 아 JavaScript 도 똑같이 쓸 수 있기는 하지.
void main01() {
  for(int i=0; i<6; i++) {
    print('$i번째 실행입니다');
  }
}

// 이렇게 숫자들을 조작해서 원하는 대로 작동하도록 커스터마이징 할 수 있지
// 밑에는 3의 배수만 출력
void main02() {
  for(int i=0; i<11; i+=3) {
    print('$i번째 실행입니다');
  }
}

// 약간 응용하자면 이렇게 조건식을 변수화 해서 사용할 수도 있음.
void main03() {
  main03Move(5);
}
void main03Move(move) {
  for(int i=1; i<move; i++) {
    print('$i칸 이동했습니다');
  }
}

// 배열 객체 가지고 반복문 돌리는 여러 가지 방법
void main04() {
  // 이런 배열이 있어. 이 안에 요소들을 하나씩 꺼내와서 각각 어떤 작업을 하고 싶어.
  List<String> rainbow = ['빨','주','노','초','파','남','보'];
  // 아래 있는 게 이게 가장 클래식한 방법이긴 하지.
  for(int i=0; i<rainbow.length; i++) {
    print('for 구문 ' + rainbow[i]);
  }
  // 근데 일단 봐도 복잡시러. 저거 i=0 부터야 i=1 부터야? i<=rainbow.length; 야? i<rainbow.length 야?
  // 그럼 아래 거를 보자. 위에 거는 for 구문이고 for-in 구문이야.
  for(String x in rainbow) {
    print('for-in 구문 ' + x);
  }
  // 기능상으로는 똑같지. 근데 딱 봐도 너무 깔끔해. 가독성도 너무 좋아. 사고하는 방식이랑도 잘 맞아. 직관적이야.
  // "in rainbow" => rainbow 라는 배열 안에서 요소들을 하나씩 꺼내 오겠다
  // "String x" => 그 요소들은 변수 x 에 하나씩 담아서 다룰 거다.
  // => String x in rainbow
  // 지금까지 위에서 봤던 게 for-in 구문. 아래에서는 forEach 구문을 한번 보자
  // forEach 구문은 for-in 구문과 기능상으로 완전히 같다고 봐도 됨.
  // 대신 성능이 for-in 보다는 forEach 가 조금 더 좋다는 평이 많음.
  rainbow.forEach( (ele){ print('forEach 구문 ' + ele);} );
  // 뭐... for 구문/ for-in 구문/ forEach 구문 모두 새로울 게 없지.
  // 다 Java 나 JavaScript 에서 그대로 쓰던 거라서.
  // 그냥 Dart 에서도 그대로 쓴다구~~~
  // 실습 활용이나 한번 해보자. 로또 번호 뽑기~
}

// 로또 뽑기 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
main05() {
  List<int> lotteryNumList = getLotteryNumList();
  List<int> myNumList = getMyLotteryNumList();
  checkLottery(lotteryNumList, myNumList);
}

List<int> getLotteryNumList() {
  // 난수 생성해 주는 객체 생성
  var random = Random();
  List<int> numList = [];
  var num;
  for(int i=0; i<6; i++) {
    // 난수를 int 로 생성해주는데, 45개 숫자 중에서 뽑아 줘.
    // 근데 프로그래밍은 숫자가 0부터 시작하지.
    // 즉, 0부터 44까지야. 그니까 뽑아준 난수에다가 +1 더해줌.
    num = random.nextInt(45) + 1;
    numList.add(num);
  }
  print('추첨 번호');
  print(numList);

  return numList;
}

List<int> getMyLotteryNumList() {
  var random = Random();
  List<int> numList = [];
  var num;
  for(int i=0; i<6; i++) {
    num = random.nextInt(45) + 1;
    numList.add(num);
  }
  print('내 번호');
  print(numList);

  return numList;
}

void checkLottery(lotteryNumList, myNumList) {
  // for(int lotteryNum in lotteryNumList) {
  //   for(int myNum in myNumList) {
  //     print('추첨 번호 = $lotteryNum');
  //     print('내 번호 = $myNum');
  //   }
  // }
  // 이렇게 위처럼 냅다 출력해 버리면 추첨 번호 6개, 내 번호 6개 해서 6x6 = 36번 출력되겠지. 정신없음
  // 아래처럼 바꾸면, 당첨된 번호랑 당첨된 갯수만 해가지고 깔끔하게 출력
  int match = 0;
  for(int lotteryNum in lotteryNumList) {
    for (int myNum in myNumList) {
      if (lotteryNum == myNum) {
        print('당점 번호 = $lotteryNum');
        match++;
      }
    }
  }
  print('당첨 갯수 = $match');
}
// 로또 뽑기 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
