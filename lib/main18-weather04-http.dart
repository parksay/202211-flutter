import 'package:http/http.dart' as http;
import 'dart:convert';


// >> import http
// https://pub.dev/packages/http
// 위 사이트 가보면 http 어떻게 쓰는지 나와 있음.
// pubspec.yaml 에다가 dependencies 추가해 주고
//   http: ^0.13.5
// dart 파일에다가 import 해주고
// import 'package:http/http.dart' as http;
// 끝에 as http; 붙이는 이유는 어떤 패키지에서 불러오는 건지 명확하게 짚어주려고.
// 프로젝트가 커지면 import 하는 패키지만 수십 개가 될 텐데, 메소드를 여기저기서 부르면
// 이게 어디서 온 거고 저게 어디서 온 거고 헷갈리게 됨.
// 그래서 패키지에 별칭 붙여 줌. 밑에서 부를 때도 패키지를 접두어로 붙여 줌
// 아래 코드에서는 어떤 자료형이나 메소드가 어떤 패키지로부터 불러오는 건지 헷갈리게 되기 때문.
// 접근 권한 추가해주시고
//  <uses-permission android:name="android.permission.INTERNET" />
// 접근 권한은 위 구문을 아래 파일에
// android > app > src > main > AndroidManifest.xml

// >> import convert
// import 'dart:convert';
// json 데이터 파싱할 때 필요
// var myJson = jsonDecode(jsonData);


class MyNetwork {
  // 이것도 main16-null_safety.dart 에서 배웠지.
  // final 변수는 그 자리에서 바로 값을 넣어주거나, 생성자에서 받아서 넣어주거나
  final String url;
  final String urlAir;

  // url 은 날씨 정보
  // urlAir 는 대기질 정보
  MyNetwork(this.url, this.urlAir);


  // jsonDecode() 메소드의 return 자료형 자체가 dynamic 임.
  // 뭐가 던져질지 모르는 상태임.
  // 일단 dynamic 임.
  // 게다가 async 임.
  // 그럼 Future 로 한 번 감싸서 Future<dynamic> 임.
  Future<dynamic> getMyJsonData() async {
    // 기존방법 : Response response = await get('URL 주소');
    // 변경방법 : Response response = await get(Uri.parse(// 'URL 주소'));
    http.Response response = await http.get(Uri.parse(url));
    // http.Response response = http.get(Uri.parse(url));
    // 위처럼 await 안 쓰면 아래 같은 에러 남
    // value of type 'Future<Response>' can't be assigned to a variable of type 'Response'.
    // get() 메소드는 비동기 async 함수고, async 함수는 return 값이 Future<> 임. 그래서 아래처럼 써도 에러는 안 나긴 함.
    // Future<http.Response> response = http.get(Uri.parse(url));
    // 근데 Future 갖다가 뭘 하냐고. 빈 상자라고.
    // await 붙이면 Future 상자를 한 번 까줘서 그 안에 들어 있는 진짜 값을 던져줌.
    // http.Response response = await http.get(Uri.parse(url));
    print('fetchDataWeather');
    print(response);
    // 위에처럼 get 해서 받아온 response 를 출력하니까 "Instance of 'Response'" 이렇게만 나옴
    // 이 Response 가 뭐임? 그 안에 들어 있는 데이터들 꺼내려면 어떻게 해야 함?
    // https://pub.dev/documentation/http/latest/http/Response-class.html
    // 위는 document
    // response > body/contentLength/headers/isRedirect/request/statusCode .... 다양한 속성들 들어 있으니 알아서 꺼내서 쓰면 됨
    // JSON 을 파싱하는 법을 배울 거야
    // JSON 이란? JavaScript Object Notation
    // 데이터 자료형 중 하나. 특징: key:value map 으로 돼 있음

    if(response.statusCode == 200) {
      String jsonData = response.body;
      print('response > body');
      print(jsonData);
      // jsonDecode() 메소드 뜯어 보면 return 자료형이 dynamic 임.
      var parsingData = jsonDecode(jsonData);
      return parsingData;

    }
  }

  Future<dynamic> getMyJsonDataAir() async {
    http.Response response = await http.get(Uri.parse(urlAir));
    if(response.statusCode == 200) {
      String jsonData = response.body;
      print('response air > body');
      print(jsonData);
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}