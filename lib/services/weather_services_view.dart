import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapiapp/model/weathermodel.dart';
// هذا ال (as) معناه اعطي اسم لكل شي ياتي من المبورت هذا . موعناه انو اي شي اريده من هذا الفايل لازم استدعية باسم (http)
// الفائده منها هو انو اذا نسيت بعض الفكشن او الخصائص داخل هذا الملف فاستخدم اسم (http) حتى يذكرني ويجيبلي كل شي بداخل هذا الفايل
// ويضا ... استطيع ان اكتب اي اسم اريده اي بدل (as http or as ali or as m) الاسم شي يكون بكيفك
class MyWeatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String keyUrl = 'cad190ad3cf541a09b970457220711';
  Future <WeatherModel?> gitweather ({required String CityName}) async {
    WeatherModel? weather;
    try{
      Uri url = Uri.parse('$baseUrl/forecast.json?key=$keyUrl&q=$CityName');
      http.Response response = await http.get (url);

      Map<String , dynamic> data = jsonDecode(response.body);
       weather = WeatherModel.fromjson(data);
    }
    catch(e){
      print ('==================>>>>>>>>>>>>>> $e');
    };

  /* WeatherModel weather = WeatherModel.fromjson(jsondata);
    WeatherModel(
     date: data['location']['localtime'],
     maxTemp: jsondata['day']['maxtemp_c'],
     minTemp: jsondata['day']['mintemp_c'],
     weatherstatename: jsondata['condition']['text']);
*/ // هنا تم استخدام كونستركتر العادي أما فوق وهو الافضل تم استخدام (name constracter)
    return weather;
  }
}