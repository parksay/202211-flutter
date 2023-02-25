import 'dart:math';

// 이 파일은 "lib" 말고 "test" 디렉토리에서 돌려야 가상 디바이스에 안 올리고 실행만 함


// 아래는 'main11-loop01-for.dart' 파일에서 가져온 로또 뽑기 프로그램.
// 이 프로그램은 치명적인 단점이 있음.
// 중복이 허용된다는 것. 예를 들어 아래와 같은 경우
// 추첨 번호
// [15, 27, 44, 22, 37, 22]
// 내 번호
// [7, 15, 28, 9, 13, 36]
// 추첨 번호 봐봐. 22 가 2번 들어가 있는디요..?
// 요소들 간의 중복을 허락하지 않는 자료형이 있음.
// 바로 set.
// 자료형 바꾸는 건 쉬움. 그냥 대활호 [] 를 중괄호 {} 로 바꿔주기만 하면 됨.
// 근데 문제는 갯수를 맞추는 일.
// 중복은 허용하지 않게 됐지만 갯수가 그만큼 줄겠지.
// List<int> lotteryNumList = [15, 27, 44, 22, 37, 22]
// Set<int> lotteryNumSet => {15, 27, 44, 22, 37}
// 이때 쓰는 게 while() 문.
// while(a < 10000) {   // a < 10000 조건을 만족하는 동안에 계속 반복해서 실행하라
//    // do something
//    a += 1000;
// }
// 대신 while 문은 조건문을 잘못 넣으면 무한 루프 돌아서 차라리 for 문 쓰라고 많이들 함.
//


// 로또 뽑기 before >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
main05() {
  List<int> lotteryNumList = getLotteryNumList();
  List<int> myNumList = getMyLotteryNumList();
  checkLottery05(lotteryNumList, myNumList);
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

void checkLottery05(lotteryNumList, myNumList) {
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
// 로또 뽑기 before >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// 그럼 아래에 Set 과 while 문을 이용해서 로또 번호를 뽑는 방식으로 수정해보자.
// 로또 뽑기 after >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
main06() {
  Set<int> lotteryNumSet = getLotteryNumSet();
  Set<int> myNumSet = getMyLotteryNumSet();
  checkLottery06(lotteryNumSet, myNumSet);
}

Set<int> getLotteryNumSet() {
  // 난수 생성해 주는 객체 생성
  // 이건 const 야 final 이야..? 지금 우리가 그 객체 안의 내용을 알아? 아니면 실행 할 때 넣어줘? 헷갈리면 'main06-modifier-const_and_final.dart' 다시 보고 오셈.
  final random = Random();
  final Set<int> numSet = {};
  var num;
  // numSet 안에 들어가 있는 숫자들의 갯수가 총 6개라는 조건을 만족할 때까지 계속 반복하기.
  while(numSet.length < 6) {
    // 난수를 int 로 생성해주는데, 45개 숫자 중에서 뽑아 줘.
    // 근데 프로그래밍은 숫자가 0부터 시작하지.
    // 즉, 0부터 44까지야. 그니까 뽑아준 난수에다가 +1 더해줌.
    num = random.nextInt(45) + 1;
    numSet.add(num);
  }
  print('추첨 번호');
  print(numSet);

  return numSet;
}

Set<int> getMyLotteryNumSet() {
  final random = Random();
  final Set<int> numSet = {};
  var num;
  while(numSet.length < 6) {
    num = random.nextInt(45) + 1;
    numSet.add(num);
  }
  print('내 번호');
  print(numSet);

  return numSet;
}

void checkLottery06(lotteryNumList, myNumList) {
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
// 로또 뽑기 after >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
