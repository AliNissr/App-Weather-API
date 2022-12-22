import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:provider/provider.dart';
import 'package:weatherapiapp/cubits/cubit_weathercubit.dart';
//import 'package:weatherapiapp/model/weathermodel.dart';
//import 'package:weatherapiapp/model/weathermodel.dart';
//import 'package:weatherapiapp/provider/weather_provier.dart';
import 'package:weatherapiapp/services/weather_services_view.dart';
import 'Pages/home_View.dart';

void main() {
  runApp( BlocProvider(
    create: (BuildContext context) {
      return WeatherCubit(MyWeatherServices());
    },
    child:  WeatherApp(),
  ));
}
class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
       debugShowCheckedModeBanner: false,
   theme: ThemeData(
      primarySwatch: BlocProvider.of<WeatherCubit>(context).weathermodel == null ? Colors.blue
          : BlocProvider.of<WeatherCubit>(context).weathermodel!.gettheme()),
    home: My_Home_App(),
    );
  }
}
// هذا طريقة ال provider
/*void main() {
  runApp( ChangeNotifierProvider(
    create: (BuildContext context) {
      return MyProviderWeather();
    },
    child:  WeatherApp(),
  ));
}
class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      theme: ThemeData( // brightness: Brightness.dark, // هنا استطيع اجعل التطبيق بحالتين المضلم والمضيئ
        //  هذا (scaffoldBackgroundColor) تقوم بتغير لون البدي فقط ما تلون (AppBar)
        //  هذا (primarySwatch) تقوم بتغير لون (AppBar) فقط
        // scaffoldBackgroundColor: Provider.of<MyProviderWeather>(context).weatherprovider == null ? Colors.white
        //       : Provider.of<MyProviderWeather>(context ).weatherprovider!.gettheme()),
          primarySwatch: Provider.of<MyProviderWeather>(context).weatherprovider == null ? Colors.blue
              : Provider.of<MyProviderWeather>(context ).weatherprovider!.gettheme()),
      home: My_Home_App(),
    );
  }
}*/
