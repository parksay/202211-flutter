import 'package:geolocator/geolocator.dart';


// >> import geolocator
// https://pub.dev/packages/geolocator
// 위에 가 보면 geolocator api 어떻게 쓰는지 나와 있음.
// pubspec.yaml 에다가 dependencies 추가해 주고
// document 보면서 현재 위치 가져오는 법 보고 따라 쓰기
// 위치 정보 사용해도 되는지 사용자한테 동의 얻어야 함.
// document 에서 Readme 에 Permission 부분 가져오기
// <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
// 위 구문 아래 경로에 붙여넣기
// android > app > src > main > AndroidManifest.xml


class MyLocation {
  // double myLatitude;
  // double myLongitude;
  // Non-nullable instance field 'myLongitude' must be initialized
  // late 안 쓰니까 위 에러 남 ㅋㅋ 우리 배웠지. 'main16-null_safety.date' 에서!
  // null-safety 인데 선언만 하고 값 할당 안 해주면 에러 난다고.
  // 나중에 할당해줄 테니까 기다리라고 late 써줌.
  late double myLatitude;
  late double myLongitude;

  Future<void> getMyCurrentLocation() async {
    // 예외처리 해놓기 > try-catch 구문 > 이거는 그냥 Java 랑 똑같음
    // 우리가 위치 정보를 받아오려고 했는데, 사용자가 권한을 허용해주지 않거나 갑자기 데이터 통신이 끊기거나...
    // 예상치 못한 상황들이 발생할 수 있음 > 앱이 멈추거나 팅김 > 예외 처리를 꼼꼼히 해주기
    // try {
    //    // 예외가 날 수 있는 명령문
    // } catch(e) {
    //    //  예외 발생 시에 실행할 명령문
    // }

    try {
      // 사용자로부터 위치 정보 사용해도 되냐고 허용 선택창 띄우기
      LocationPermission permission = await Geolocator.requestPermission();
      // 위치 받아오기
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print('position');
      print(position);
      myLatitude = position.latitude;
      myLongitude = position.longitude;
    } catch(e) {
      print('cannot get location');
    }

  }
}