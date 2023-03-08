import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'main18-weather06-weatherModel.dart';

// >> import 'package:google_fonts/google_fonts.dart';
// 폰트 사용하는 법 (구글 폰트 사용)
// >> import 'package:flutter_svg/flutter_svg.dart';
// svg 파일 사용하는 법
// >> import 'package:timer_builder/timer_builder.dart';
// 시간 정보 불러오기
// TimerBuilder.periodic() 이 여기서 가져온 거
// >> import 'package:intl/intl.dart';
// 시간 정보 데이터 타입을 다루려면 필요하대;
// DateFormat 이 intl 에서 가져온 거

class WeatherScreen extends StatefulWidget {
  // 아 이게 생성자였네.. key 를 받거나 안 받아도 되고, 그 앞에 메소드 이름이 클래스 생성자였네
  // 여기다가 final 변수 받아줌.
  const WeatherScreen({
    required this.parseWeatherData,
    required this.parseAirData,
    Key? key,
  }) : super(key: key);

  final dynamic parseWeatherData;
  final dynamic parseAirData;

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
  var nowDate = DateTime.now();
  late int condition;
  String desc = "";
  int index = 0;  // 대기질 지수
  double dust1 = 0;  // 미세먼지
  double dust2 = 0;  // 초미세먼지

  @override
  void initState() {
    super.initState();
    print('class _WeatherScreenState > parseWeatherData');
    print(widget.parseWeatherData);
    print('class _WeatherScreenState > parseAirData');
    print(widget.parseAirData);

    // Loading 클래스 생성 > _LoadingState 클래스 생성 > _LoadingState.initState() 실행
    // > _LoadingState.getLocation() 실행 > WeatherScreen 클래스 생성 >
    // > _WeatherScreenState 클래스 생성 > _WeatherScreenState.initState() 실행
    //
    updateData(widget.parseWeatherData, widget.parseAirData);
  }

  void updateData(dynamic weatherData, dynamic airData, ) async {
    print('updateData');
    print(weatherData);
    double tempWeather = weatherData['main']['temp'];
    String nameWeather = weatherData['name'];
    int idWeather = weatherData['weather'][0]['id'];
    String description = weatherData['weather'][0]['description'];
    int index = airData['list'][0]['main']['aqi'];
    double pm10 = airData['list'][0]['components']['pm10'];
    double pm25 = airData['list'][0]['components']['pm2_5'];
    // temperature = tempWeather.toInt(); // 캐스팅해서 int 로 뽑든가
    temperature = tempWeather.round(); // 반올림해서 int 로 뽑든가
    cityName = nameWeather;
    condition = idWeather;
    desc = description;
    index = index;
    dust1 = pm10;
    dust2 = pm25;
  }

  String getSystemTime() {
    return DateFormat("h:mm a").format(nowDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: const Text(''),
          // 투명하게 만들고 싶어서 Colors.transparent 로 넣음
          backgroundColor: Colors.transparent,
          // Colors.transparent 넣었는데 아직 메인 테마 색상이 바탕에 남음. elevation 을 0으로 넣어주면 됨. 약간 z-index 같은 건가?
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.near_me),
            onPressed: () {},
            iconSize: 30.0,
            color: Colors.orangeAccent,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.location_searching,
              ),
              onPressed: () {},
              iconSize: 30.0,
              color: Colors.orangeAccent,
            ),
          ],
        ),
        body: Container(
          child: Stack(
            children: [
              Image.asset(
                'assets/assets_weather/background.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150.0,
                            ),
                            Text(
                              '$cityName',
                              style: GoogleFonts.lato(
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                TimerBuilder.periodic(Duration(minutes: 1),
                                    builder: (context) {
                                  var sysTime = getSystemTime();
                                  print('$sysTime');
                                  // hh:mm AM 형태로 포맷해서 출력하기 - 함수로부터 받아오기
                                  return Text('$sysTime',
                                      style: GoogleFonts.lato(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ));
                                }),
                                // 요일 정보 출력하기 - 인라인으로 바로
                                Text(
                                  DateFormat(' - EEEE').format(nowDate),
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  DateFormat('d MMM, yyy').format(nowDate),
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$temperature\u2103',
                              style: GoogleFonts.lato(
                                fontSize: 85.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                WeatherModel().getWeatherIcon(condition),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('$desc',
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
                    Column(
                      children: [
                        Divider(
                          height: 15.0,
                          thickness: 2.0,
                          color: Colors.white30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text('대기질 지수',
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                WeatherModel().getAirIcon(index),
                                SizedBox(
                                  height: 10.0,
                                ),
                                WeatherModel().getTextAir(index),
                              ],
                            ),
                            Column(
                              children: [
                                Text('미세먼지',
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('$dust1',
                                  style: GoogleFonts.lato(
                                    fontSize: 24.0,
                                    color:Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('㎍/m3',
                                  style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text('초미세먼지',
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('$dust2',
                                  style: GoogleFonts.lato(
                                    fontSize: 24.0,
                                    color:Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('㎍/m3',
                                  style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
