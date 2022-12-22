
import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double Temp;
  double maxTemp;
  double minTemp;
  String weatherstatename;
  String namecity;
  String country;


  WeatherModel(
      { required this.date,
        required this.Temp,
        required this.maxTemp,
        required this.minTemp,
        required this.weatherstatename,
        required this.namecity,
        required this.country,
        });

  // هذا ال (factory) يسمح لي بان اقوم برجاع اي اعمل (return) في الكونستركتر
  // ويضاً استطيع ان اقوم بالارجاع قيم من الكلاس ترث من الكلاس التي فيها الكونستركتر من نوع فاكتري
  // ويضا استفاد من هذا لاالطريقه في هذا الحاله التي انا فيها هو ان اجعل الخصائص التي عندي ان لاتكون بقيمه فارغه من خلا الكونستركتر العادي اقوم برجاعه في الكونستركتر من نوع فاكتر
////////////////////////////////// Note (ملاحضه مهم جدا) /////////////////////////////////////////////////
  //هذا الترتيب لي قمت بيه من فكتر ومن كونستركتر مسما وكل التعديلات تعتبر افضل تعديلات عند جلب بيانات من api
 factory WeatherModel.fromjson(dynamic data ){
    var jsondata = data['forecast']['forecastday'][0];
    // date = data['location']['localtime'];
    // Temp = jsondata['day']['avgtemp_c'];
    // maxTemp = jsondata['day']['maxtemp_c'];
    // minTemp = jsondata['day']['mintemp_c'];
    // weatherstatename = jsondata['condition']['text'];
    return WeatherModel(
      namecity : data['location']['name'],
        country: data['location']['country'],
        date: DateTime.parse( data['location']['localtime']),
        Temp: jsondata['day']['avgtemp_c'],
        maxTemp: jsondata['day']['maxtemp_c'],
        minTemp: jsondata['day']['mintemp_c'],
        weatherstatename: jsondata['day']['condition']['text']);
    }

    String? getweath (){
   if (weatherstatename == 'Patchy rain possible' || weatherstatename == 'Patchy rain' || weatherstatename == 'light rain') {
     return 'assets/Images/rainy-day.png';
   } else if (weatherstatename == 'Partly cloudy' || weatherstatename == 'Partly cloud') {
     return 'assets/Images/cloudy.png';
   } else if (weatherstatename == 'Clear' || weatherstatename == 'Sunny') {
     return 'assets/Images/sunny.png';
   } else if (weatherstatename == 'rain' || weatherstatename == 'heavy rain' || weatherstatename == 'rainy day') {
     return 'assets/Images/rain.png';
   } else if (weatherstatename == 'snow' || weatherstatename == 'cold') {
     return 'assets/Images/snow.png';
   } else if (weatherstatename == 'storm' || weatherstatename == 'thunder') {
     return 'assets/Images/storm.png';
   } else {
     return 'assets/Images/sunny.png';
   }
    }


  MaterialColor? gettheme (){
    if (weatherstatename == 'Patchy rain possible' || weatherstatename == 'Patchy rain' || weatherstatename == 'light rain'
     || weatherstatename == 'Partly cloudy' || weatherstatename == 'Partly cloud'|| weatherstatename == 'heavy rain' || weatherstatename == 'rainy day') {
      return Colors.blue;
    } else if (weatherstatename == 'Clear' || weatherstatename == 'Sunny') {
      return Colors.purple;
    } else {
      return Colors.brown;
    }
  }
  }



