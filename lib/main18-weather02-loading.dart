import 'package:flutter/material.dart';
import 'main18-weather03-location.dart';
import 'main18-weather04-http.dart';
import 'main18-weather05-weatherScreen.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  late double latitudeData;
  late double longitudeData;

  @override
  void initState() {
    super.initState();
    print('run initState');
    getLocation();
  }


  void getLocation() async {
      MyLocation myLocation = MyLocation();
      await myLocation.getMyCurrentLocation();
      // getMyCurrentLocation() 메소드가 async 니까 다 끝날 때까지 기둘
      latitudeData = myLocation.myLatitude;
      longitudeData = myLocation.myLongitude;
      print('loading data');
      print(latitudeData);
      print(longitudeData);

      String appid = '0d0cc1131b44cd6ea0027e60e69dc007';
      String url = 'https://api.openweathermap.org/data/2.5/weather?units=metric&lat=$latitudeData&lon=$longitudeData&appid=$appid';
      MyNetwork myNetwork = MyNetwork(url);


      // getMyJsonData() 메소드가 async 니까 return 줄 때까지 끝까지 기다리기
      var weatherData = await myNetwork.getMyJsonData();
      print('weatherData');
      print(weatherData);

      // 정보 다 받아왔으면 이제 그 정보를 화면에 출력해주기
      // 그러면 정보를 보여주는 화면으로 넘어가기 + 그 화면으로 데이터 넘겨주기
      // 1) 화면 넘어가기
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WeatherScreen(parseWeatherData: weatherData,);
      }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            getLocation();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          child: const Text('get my location',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
