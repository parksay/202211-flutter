import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class WeatherModel {

  Widget getWeatherIcon(int condition) {
    print('getWeatherIcon');
    print('$condition');
    if(condition < 300) {
        return SvgPicture.asset(
            'assets/assets_weather/climacon-cloud_rain.svg',
            color:Colors.black87,
        );
    } else if(condition < 600) {
      return SvgPicture.asset(
        'assets/assets_weather/climacon-cloud_snow_alt.svg',
        color:Colors.black87,
      );
    } else if(condition == 800) {
      return SvgPicture.asset(
        'assets/assets_weather/climacon-sun.svg',
        color:Colors.black87,
      );
    } else if(condition <= 804) {
      return SvgPicture.asset(
        'assets/assets_weather/climacon-cloud_sun.svg',
        color:Colors.black87,
      );
    } else {
      return SvgPicture.asset(
        'assets/assets_weather/climacon-sun.svg',
        color:Colors.black87,
      );
    }
  }


  Widget getAirIcon(int index) {
    print('getWeatherIcon');
    print('$index');
    if(index == 1) {
      return Image.asset(
        'assets/assets_weather/good.png',
        width: 37.0,
        height: 35.0,
      );
    } else if(index == 2) {
      return Image.asset(
        'assets/assets_weather/fair.png',
        width: 37.0,
        height: 35.0,
      );
    } else if(index == 3) {
      return Image.asset(
        'assets/assets_weather/good.png',
        width: 37.0,
        height: 35.0,
      );
    } else if(index == 4) {
      return Image.asset(
        'assets/assets_weather/fair.png',
        width: 37.0,
        height: 35.0,
      );
    } else {
      return Image.asset(
        'assets/assets_weather/good.png',
        width: 37.0,
        height: 35.0,
      );
    }
  }

  Widget getTextAir(int index) {
    print('getWeatherIcon');
    print('$index');
    if(index == 1) {
      return Text(
        '매우 좋음',
        style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
        ),
      );
    } else if(index == 2) {
      return Text(
        '좋음',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if(index == 3) {
      return Text(
        '보통',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if(index == 4) {
      return Text(
        '나쁨',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Text(
        '매우 나쁨',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

}