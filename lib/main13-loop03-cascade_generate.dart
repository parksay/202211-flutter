

// 이 파일은 "lib" 말고 "test" 디렉토리에서 돌려야 가상 디바이스에 안 올리고 실행만 함


// 여기서 한 번 더 응용하기.
// 무작위로 번호를 뽑는 게 for문/while문 돌면서 하나하나 뽑아서 이렇게 하고 저렇게 하고...
// 귀찮다
// 이런 기능을 List 자료형의 멤버 메소드를 활용하면 비교적 간단하게 구현할 수 있음.

void main07() {
  // List<>.generate(a, b); 함수를 이용하면 됨.
  // 인자를 두 개를 받는데, 하나는 길이임. length. 0부터 몇까지의 숫자를 가지고 꺼내올 건지
  // 다른 하나는 함수임. 0부터 꺼내오는 숫자들 가지고 어떤 처리를 할지
  final List<int> generatedList = List<int>.generate(45, (index) => index+1);
  // 0부터 44까지 해서 길이가 총 45개인데, 거기에 1씩 더해서 1부터 45
  generatedList.forEach( (ele){ print('generatedList = $ele'); });

}

void main08() {
  // List 객체에는 shiffle() 이라는 멤버 메소드가 있음.
  // 뭐... 대충 리스트 안에 들어 있는 요소들의 순서를 무작위로 섞어준다는 의미겠지.
  // 마침표 두 개  .. 붙여서 cascade 라는 문법을 사용할 수가 있음.
  // 예를 들어서 JavaScript 에서는 걍 마침표 . 하나만 찍어서 계속 이어서 쓸 수가 있지.
  // 그 return 값에다가 이어서 실행해달라는 뜻
  // response.myList.concat(newList).forEach(()=>{});
  // 근데 이게 Dart 에서는 마침표를 두 개씩 찍어야 하나 봄.
  final List<int> shuffled = List<int>.generate(45, (index) => index+1)..shuffle();
  shuffled.forEach( (ele){ print('shuffled = $ele'); });
  // 웃긴 게 또 아래 거는 안 됨. 에러남.
  // final List<int> shuffled = (List<int>.generate(45, (index) => index+1)).shuffle();
  // shuffle(); 자체는 return 값이 void 래. 그래서 변수에 받아서 쓸 수가 없대.
  // shuffle() 사용 예시 vv
  // final numbers =  [1, 2, 3, 4, 5];
  // numbers.shuffle();
  // print(numbers); // [1, 3, 4, 5, 2] OR some other random result.
}

void main09() {
  // List 객체에는 myList.sublist(a, b) 이라는 멤버 메소드가 있음.
  // 전달 인자는 1개 or 2개까지 받음
  // 첫 번째 인자는 start, 시작 위치 / 두 번쨰 인자는 end, 끝 위치
  // 해서 시작 위치와 끝 위치 사이에 있는 요소들을 가져옴.
  // a <= i < b // start 는 포함 + end 는 포함 안 함
  // 이걸 왜 이렇게 해놨지 헷갈리게..?
  // start 를 0부터 시작했을 때 end 가 곧 요소들의 갯수가 됨.
  // ex) myList.sublist(0, 10); // => 0부터 시작해서 10개를 가져오게 됨.
  final List<int> sublistedList = (List<int>.generate(45, (index) => index+1)..shuffle()).sublist(0,6);
  sublistedList.forEach( (ele){ print('sublisted = $ele'); });
  // 웃긴 게, 여기서는 또 (List<int>.....).sublist(0,6); 형태로 써지네.
  // cascade 문법에 대한 개념 정리가 아직 안 된 듯.
  // 아, cascade 이거인 듯?
  // person.name = 'James';
  // person.setAge(20);
  // person.show();
  // 이것들은 다 지금 return 값이 없음.
  // person 객체 하나에 붙여서 값도 넣고 메소드도 실행하고 이것 저것 하고 있는 중.
  // 그래서 person 객체를 여러 번 불러줘야 하는 상황.
  // 근데 위 구문을 아래처럼 한 번에 간단하게 바꿀 수 있음.
  // person..name = 'James'
  //       ..setAge(20)
  //       ..show();
  // person 은 한 번만 부르고, 대신 세미콜론 ; 을 안 찍은 채로 마침표 두 개 .. 를 붙여서 계속 이어주고 있음.
  // 그니까, 어떤 명령문을 실행하고 나서 그 return 값을 가지고 계속 이어나가는 개념이 아님.
  // 아까 불렀던 그 객체를 고정시켜 두고, 그 객체에 한 번 더 실행하겠다는 개념.
  // 마침표 . 하나는 return 값에다가 이어붙여주는 거고, 마침표 두 개 ..  는 인스턴스에 붙여주는 거고.
  // myData.hello().world(); // => 이러면 myData 에다가 hello() 를 실행하고, 그 hello() 가 던져주는 return 결과에다가 world() 를 실행함.
  // myData..hello()..world(); // => 이러면 myData 에다가 hello() 를 실행하고, 또 myData 에다가 world() 를 실행하고...
  // 이런 개념인가 봄.
}


// 위에서 배운 List<>.generate() 메소드와 myList.shuffle() 메소드와 myList.sublist() 메소드와 cascade 문법을 활용해서 로또 추첨 프로그램 다시 만들어보기.

// 로또 뽑기 final >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
main10() {
  List<int> lotteryNumList = getLotteryNumList();
  List<int> myNumList = getMyLotteryNumList();
  checkLottery10(lotteryNumList, myNumList);
}

List<int> getLotteryNumList() {
  // List<int>.generate(45, (index) => index++)
  // 단 주의할 점은 위처럼 안 쓰고 아래처럼 썼음.
  // List<int>.generate(45, (index) => ++index)
  // 전위 연산자 / 후위 연산자 / 일단 1부터 증가시키고 처리할지, 처리부터 먼저 하고 1을 증가시킬지
  List<int> numList = (List<int>.generate(45, (index) => ++index)..shuffle()).sublist(0,6);
  print('추첨 번호');
  print(numList);

  return numList;
}

List<int> getMyLotteryNumList() {
  List<int> myNumList = (List<int>.generate(45, (index) => ++index)..shuffle()).sublist(0,6);
  print('추첨 번호');
  print(myNumList);

  return myNumList;
}

void checkLottery10(lotteryNumList, myNumList) {
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
// 로또 뽑기 final >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// 우와 진짜 이렇게 바꾸니까 훨씬 깔끔해지고 가독성도 좋아지고 line 도 줄어들고
// 기능은 똑같지. 1부터 45까지 숫자를 만들고, 그 안에서 6개 숫자 뽑아오고, 두 리스트끼리 비교하고

