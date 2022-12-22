import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:provider/provider.dart';
import 'package:weatherapiapp/cubits/cubit_weathercubit.dart';
//import 'package:weatherapiapp/model/weathermodel.dart';
//import 'package:weatherapiapp/provider/weather_provier.dart';
//import '../services/weather_services_view.dart';


class My_Search_App extends StatelessWidget {
  // My_Search_App(this.update);
  // VoidCallback? update;
  String? name;
  My_Search_App({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title:const Text("Search a City"),
      ),
      body:Center(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 14),
          child: TextField(
            decoration:  InputDecoration(
                hintText: "Enter The City",
                //label:Text( "search"),
                labelText: "search",
                labelStyle:const TextStyle(color: Colors.red),
                border:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                contentPadding:const EdgeInsets.symmetric(horizontal: 12 , vertical: 30),
                suffix: GestureDetector(
                    onTap: () async{
                      BlocProvider.of<WeatherCubit>(context).getweather(CityName: name!);
                      BlocProvider.of<WeatherCubit>(context).CityName = name;
                      Navigator.pop(context);
                    },
                    child:const Icon(Icons.search))),

            onChanged: (text){
              name = text;
            }, // هذا تقوم بارسال كل حرف اقوم بادخالة من دون عمل ارسال
            onSubmitted: (text) async // هذا تقوم براسال عندما اعطي ارسال
                {
                  BlocProvider.of<WeatherCubit>(context).getweather(CityName: name!);
                  BlocProvider.of<WeatherCubit>(context).CityName = name;
                  Navigator.pop(context);
              // name = text;
              // MyWeatherServices searchweather = MyWeatherServices();
              // WeatherModel?  weather = await searchweather.gitweather(CityName: name!);
              // Provider.of<MyProviderWeather>(context , listen: false).weatherprovider = weather;
              // Provider.of<MyProviderWeather>(context , listen: false).NameCityCity = name;
              // Navigator.pop(context);
            } ,
          ),
        ),
      ),
    );
  }
}


// هذا في حالة provider
/*

class My_Search_App extends StatelessWidget {
  // My_Search_App(this.update);
  // VoidCallback? update;
String? name;
  My_Search_App({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title:const Text("Search a City"),
      ),
      body:Center(
       child: Padding(
         padding:const EdgeInsets.symmetric(horizontal: 14),
         child: TextField(
           decoration:  InputDecoration(
             hintText: "Enter The City",
             //label:Text( "search"),
             labelText: "search",
             labelStyle:const TextStyle(color: Colors.red),
             border:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
               contentPadding:const EdgeInsets.symmetric(horizontal: 12 , vertical: 30),
               suffix: GestureDetector(
                 onTap: () async{
                   MyWeatherServices searchweather = MyWeatherServices();
                   WeatherModel?  weather = await searchweather.gitweather(CityName: name!);
                   Provider.of<MyProviderWeather>(context , listen: false).weatherprovider = weather;
                   Provider.of<MyProviderWeather>(context , listen: false).NameCityCity = name;
                   Navigator.pop(context);
                 },
                   child:const Icon(Icons.search))),

           onChanged: (text){
             name = text;
           }, // هذا تقوم بارسال كل حرف اقوم بادخالة من دون عمل ارسال
           onSubmitted: (text) async // هذا تقوم براسال عندما اعطي ارسال
          {
             name = text;
             MyWeatherServices searchweather = MyWeatherServices();
         WeatherModel?  weather = await searchweather.gitweather(CityName: name!);
           Provider.of<MyProviderWeather>(context , listen: false).weatherprovider = weather;
           Provider.of<MyProviderWeather>(context , listen: false).NameCityCity = name;
            Navigator.pop(context);
           } ,
         ),
       ),
      ),
    );
  }
}
// هذا لوكل فاريبل كل البيجات تكدر اتشوفه
*/
