import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  // 아 이게 생성자였네.. key 를 받거나 안 받아도 되고, 그 앞에 메소드 이름이 클래스 생성자였네
  // 여기다가 final 변수 받아줌.
  const WeatherScreen({required this.parseWeatherData, Key? key, }) : super(key: key);

  final dynamic parseWeatherData;
  // final parseWeatherData;
  // 이렇게 선언해줘도 dynamic 이라고 암묵적으로 넘어감.
  // 근데 웬만하면 자료형 dynamic 명시해주라고 dart 가 지적함.


  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}


// 오케이.
// 그럼 상위 화면에서 Navigator 로 이쪽으로 쏴줄 때 데이터 생성자로 넘겨준다고?
// 오케이 알았어.
// 이쪽에서는 WeatherScreen 생성자가 parseWeatherData 받아서 잘 들고 있음.
// 아니 근데 가만 보니까 그거는 WeatherScreen 클래스에서 들고 있는 거 아님?
// WeatherScreen 가 받아서 들고 있는 값들을 _WeatherScreenState 클래스에서는 어떻게 씀?
// 결국 화면 Text 출력하고 하는 거는 다 _WeatherScreenState 클래스 쪽에 있잖아.
// state 관리하면서.
// 그럴 때는 _WeatherScreenState 클래스에서 widget.parseWeatherData 이렇게 접근하면 됨.
// _WeatherScreenState 클래스를 선언할 때를 자세히 보셈.
// class _WeatherScreenState extends State<WeatherScreen> {
// 끝에 보면 State<WeatherScreen>
// WeatherScreen 를 generics 타입으로 가지고 State 만들어버림.
// 그래서 WeatherScreen 클래스의 인스턴스에도 접근할 수가 있는데, 그게 바로 widget 변수

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName;
  late int temperature;

  @override
  void initState() {
    super.initState();
    print('class _WeatherScreenState > parseWeatherData');
    print(widget.parseWeatherData);
    // Loading 클래스 생성 > _LoadingState 클래스 생성 > _LoadingState.initState() 실행
    // > _LoadingState.getLocation() 실행 > WeatherScreen 클래스 생성 >
    // > _WeatherScreenState 클래스 생성 > _WeatherScreenState.initState() 실행
    //
    updateData(widget.parseWeatherData);
  }


  void updateData(dynamic weatherData) async {
    double tempWeather = weatherData['main']['temp'];
    String nameWeather = weatherData['name'];
    // temperature = tempWeather.toInt(); // 캐스팅해서 int 로 뽑든가
    temperature = tempWeather.round();  // 반올림해서 int 로 뽑든가
    cityName = nameWeather;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('$cityName',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              SizedBox(height: 20.0,),
              Text('$temperature',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
