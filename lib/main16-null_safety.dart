//
// // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// // Ctrl + a 전체 선택 후에 각주 해제 Ctrl + / 하고 나서 보기
// // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//
// // null safety 란?
// // 어떤 변수도 null 일 수 없다.
// // non-nullable 변수에는 null 값을 할당할 수 없다.
// // non-nullable 변수에는 null check 를 할 필요가 없다
// void main01() {
//   String name;
//   print(name);  // 아직 할당하지 않음. null 인데 print 하니까 error 남
//   int age = null;   // 어떤 변수든 null 을 할당할 수는 없음 error 남
//   print(age);
//   int num = 5;
//   if(num == null) {  // 어떤 변수도 null 일 수 없으므로 모든 변수는 null check 가 필요 없음
//     print('this is unnecessary');
//   }
// }
//
// class Person01 {
//   // 클래스 안에서 선언하는 멤버 변수는 반드시 선언하면서 바로 값을 할당해줘야 함.
//   int age = 20;
// }
//
// void main02 {
//   Person02 p = Person02();
//   print(p.changeName(p.name));
// }
//
//
// class Person02 {
//   String name;
//   String changeName(String name) {
//     this.name = name;
//     return name.toUpperCase();
//     // 위에 main02 에서 변수 p 만들면서 name 안 넣어 줌.
//     // 현재 name 초기화 안 된 상태임.
//     // 거기다가 toUpperCase() 붙이니까 에러나지.
//     // 그럼 위에 main02 에서 p.name 에 null check 걸어줘야지
//     // if(p.name == null) { print('there is no name'); } else ...
//   }
// }
//
//
// // 근데 그럼 null 을 아예 못 쓰는 거임...?
// // 진짜로 null 올 수도 있는 값일 수도 있잖아.
// // 모든 변수에 default 로 null 이 올 수 없도록 해 놓고,
// // 이거는 일부러 쓰는 거다, 라고 특정하는 경우에 null 을 쓸 수 있도록 명시하는 방법이 있음.
// // null 을 쓸 수 있도록 하는 여러 가지 방법이 있는데,
// // 첫 번째는 변수 자료형 뒤에 물음표 ? 를 박기.
// class Person03 {
//   // String name;
//   String? name;
//   // 위에서 name 변수는 String or null 타입임.
//   // 이거는 String 이랑은 또 다름.
//   // 자료형 String 이랑 String? 이랑 다르게 보는 듯.
//   // 그럼 changeName 에서 받아서 name 에 넣어주는 파라미터도 String? 이 되어야지.
//   // String changeName(String name) {
//   String changeName(String? name) {
//     this.name = name;
//     // 위에서 changeName 메소드가 받아주는 파라미터 name 이 String? 가 됐더니 아래 return 구문 name.toUpperCase(); 에서 컴파일 에러남.
//     // return name.toUpperCase();
//     // name 이 null 일 수도 있고 String 일 수도 있으니까 여기서는 null check 해줘야 함.
//     if(name == null) {
//       return 'no name';
//     } else {
//       return name.toUpperCase();
//     }
//   }
// }
//
// // null 을 허용하는 두 번째 방법.
// // late 키워드 사용하기.
// void main04() {
//   Person04 p = Person04();
//   print(p.sum(100, 50));
// }
//
// class Person04 {
//   // 위에서 말했듯이, 클래스 멤버 변수는 선언하면서 바로 값을 넣어줘야 함.
//   // 근데 이건 어때. 위에 main04 봐봐. Person04 > sum() 메소드 봐 봐.
//   // 이 특정한 메소드를 부를 때에만 비로소 age 변수에 값이 할당되면서 어떤 로직이 돌아가.
//   // 이렇게 초기화를 나중으로 미루고 싶을 때는 변수 선언할 때 자료형 앞에 late 키워드를 쓰면 됨
//   // 위에 거는 초기화 안 했다고 컴파일 에러 남. 밑에 거는 나중에 값 넣어주곘다고 명시적으로 말해 놨으니 late 를 붙여놨으니 그냥 넘어감.
//   // int age;
//   late int age;
//
//   int sum(int age, int num) {
//     this.age = age;
//     int total = age + num;
//     return total;
//   }
// }
//
//
//
// // null 을 허용하는 세 번째 방법.
// // 느김표 exclamation (or bang) mark 사용하기.
// void main05() {
//   int x = 50;
//   int? y;
//   if(x > 0) {
//     y = x;
//   }
//   // int value = y;
//   int value = y!;
//   print(value);
//   // 위에서 변수 y 를 선언할 때 자료형을 int? 로 줬어.
//   // 그럼 변수 y 는 이론상 int 일 수도 있고 null 일 수도 있지.
//   // 이거는 int 랑은 다르다고 했어. 자료형 int? 랑 int 랑은 다르다고 했지.
//   // 근데 지금 자료형이 int? 인 변수 y 를 자료형을 int 인 변수 value 에 넣으려고 해.
//   // 둘은 자료형이 다른디요? 저는 null 취급 안 하는디요?
//   // 바로 컴파일 에러 때림.
//   // 근데 로직상으로는 어때? y 는 상수야. y는 null 일 수 없어.
//   // 왜? x 에는 50 이라는 상수를 넣었고, 그 x 를 y 에 무조건 넣었기 때문에.
//   // 그래서 이걸 Dart 에다가 알려주는 거야.
//   // y 변수가 자료형만 int? 이지, 런타임에서는 사실상 int 나 다름 없다, 라고.
//   // "얘는 무조건 null 이 아니다", 라고 명시해주는 방벙이 느낌표 exclamation (or bang) mark 임.
// }
//
// // null 을 허용하는 네 번째 방법.
// // required 키워드 사용하기
// void main06() {
//   print(add06());
// }
//
// //위에 main06 에서 add06 부를 때 아무 파라미터도 넣어주지 않았음.
// //add06 메소드는 named argument 를 받고 있어.
// //named argument 는 파라미터를 꼭 넣어줘야 하는 건 아니고 지정해서 넣어주고 싶으면 넣어주고 아니면 말고야.
// //근데 밑에서 지금 int 자료형으로 연산 다 하고 있는데 이거 괜춚...?
// //그래서, 이 파라미터는 꼭 넣어주세요, 라는 의미로 파라미터 선언할 때 자료형 앞에 require 키워드를 붙여 줌.
// int add06({int a, int b}) {
//   int sum = a + b;
//   return sum;
// }
//
// //그럼 이번에는 required 넣어서 add07 메소드를 선언하고 main07 에서 호출해 보자.
// void main07() {
//   // print(add07(a: 4, b: 5));
//   print(add07(a: 4, b: null));
//   // 위에 거는 에러 안 나는데 밑에 거는 또 난리임.
//   // 넣어주기는 넣어주는데 null 을 넣어줌.
//   // 아니 파라미터를 아무 것도 안 넣어주면 null 되니까 null 되지 말라고 required 붙여줬더니,
//   // 넣어주기는 넣어주는데 null 을 넣어줌...;;;
//   // 그니까 아까부터 null 안 된다고 하잖아 지금
//   // "아니 근데 저는 진짜로 null 일 수도 있는데요?"
//   // 아 그래? 그러면 add08() 봐봐.
// }
//
// int add07({required int a, required int b}) {
//   int sum = a + b;
//   return sum;
// }
//
//
// void main08() {
//   // add08() 에서는 int 일 수도 있고 null 일 수도 있도록 자료형을 int? 로 선언했음.
//   // 그러면 파라미터를 넣어주기는 넣어주더라도 null 을 넣어줘도 되지.
//   print(add08(a: 4, b: null));
// }
//
// int add08({required int a, required int? b}) {
//   // 파라미터 b 를 진짜로 null 을 쓸 수도 있고 int 를 쓸 수도 있어.
//   // 그래서 null 을 허용하도록 자료형을 int? 로 선언했어.
//   // 그랬더니 b 가 int 일 수도 있고 null 일 수도 있게 됐음.
//   // 따라서 b 를 사용할 때는 null check 를 필수로 해줘야 함.
//   // 안 하면 컴파일 에러 남.
//   if( b == null ) {
//     return a;
//   }
//   int sum = a + b;
//   return sum;
// }
//
//
// //
// // 정리해 보자.
// // 1. 물음표 ?
// // > non-nullable 한 자료형으로 변수를 선언할 때 nullable 한 자료형으로 바꾸는 법
// // 변수 자체에 null 을 값으로 넣어줄 수도 있고, 다른 특정한 자료형도 넣어줄 수도 있고.
// // 그러면 변수를 선언할 때 자료형 뒤에 물음표 붙여주기
// // ex) int? num; / String? str;
// // //
// // 2. 느낌표 ! / exclamation (or bang) mark
// // > nullable 한 자료형의 변수를 사용할 때 이 변수는 무조건 null 이 아니라고 알려줌
// // 예를 들어서 name 이라는 변수를 선언할 때 자료형을 int 도 될 수 있고 null 도 될 수 있다고 알려줬어.
// // 그럼 내가 name 변수를 가져다 쓸 때는 null 인 경우를 항상 염두에 두고 써야겠지.
// // ex) String? name;
// //     > name.toUpperCase();
// // name 이 지금 null 일 수도 있다니까?
// // 그런데 이렇게 막 멤버 메소드 막 갖다 붙일 거야?
// // NullPointerException 이 두렵지 않나 자네?
// // 바로 컴파일 에러 때리지.
// // 근데 런타임에서는 name 에 절대로 null 이 들어갈 수 없는 로직이야.
// // 그러면 굳이 name 에 null check 를 걸어주기보다는, 그냥 간단하게 컴파일러한테 말해주는 거야.
// // "아, 얘는 100% null 이 아닙니다! 저를 믿으세요!"
// // 그럴 때 변수 뒤에다가 느낌표를 붙이는 것.
// // ex) String? name;
// //     > name!.toUpperCase();
// // //
// // 3. late 키워드
// // > 클래스 안에서 멤버 변수 선언할 때 이 변수는 좀 나중에 값을 넣어주겠다는 키워드
// // 클래스 안에서 선언하는 멤버 변수는 선언하면서 바로 값을 넣어주거나 생성자가 받아서 바로 넣어주거나.
// // 근데 다른 특정한 메소드를 호출할 때에야 비로소 값을 넣어주고 다른 특정한 로직을 탄다?
// // 그러면 변수 선언할 때 자료형 앞에서 late 키워드를 붙여 줌.
// // class Person {
// //   late String name;
// //   void callMyName(String name) {
// //     this.name = name;
// //     print('$name is here');
// //   }
// // }
// // //
// // 4. required 키워드
// // > 메소드 안에서 파라미터 변수 선언할 때 이 파라미터는 null 일 수 없으니 꼭 넣어달라는 키워드
// // Dart 에서는 메소드가 파라미터를 받아줄 때 속성 이름을 지정해서 넣어주는 기능이 있음. > named argument
// // 근데 어떤 변수만 빼고 넣어줄 수도 있잖아.
// // 그런 경우에는 그 변수가 null 인 상태에서 아래 로직들을 실행하게 됨.
// // main(){
// //   add(a: 5);
// // }
// // void add({int a, int b}) {
// //   print(a + b);
// // }
// // 이렇게 되면 main 에서 a 만 넣어주고 b 는 안 넣어줬음
// // 그럼 밑에서 b 는 null 인 채로 로직 실행하게 되는데...?
// // 이럴 때 파라미터 b 도 main 에서 꼭 받아오라고,
// // add() 메소드를 갖다 쓰려면 파라미터 이거, 이거, 이거는 null 일 수 없으니까 꼭 넣어주라고,
// // 하는 키워드가 requied