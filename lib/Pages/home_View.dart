import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:provider/provider.dart';
import 'package:weatherapiapp/Pages/search_View.dart';
import 'package:weatherapiapp/cubits/cubit_weathercubit.dart';
import 'package:weatherapiapp/cubits/cubit_weatherstate.dart';
import 'package:weatherapiapp/model/weathermodel.dart';
//import 'package:weatherapiapp/provider/weather_provier.dart';

class My_Home_App extends StatelessWidget {
WeatherModel? weatherModel;
 @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title:const Text("Weather App"),
        actions: [
          IconButton(
              onPressed: (){ Navigator.push(context,
                  MaterialPageRoute(builder: (context){return My_Search_App();}));
              },
              icon:const Icon(Icons.search))
        ]
      ),
      body: BlocBuilder<WeatherCubit , WeatherState>(
          builder: (context, state) {
        if(state is WeatherLoading){
         return Center(child: LinearProgressIndicator(),);
        }
        else if (state is WeatherSuccess){
         return SuccessBody(weatherModel: state.weatherModel);
        }
        else if (state is WeatherFailure){
         return Center(child: Text('The Search in mistake'),);
        }
        else {
          return  Defaultbody();

          }
      }
      ),
    );
  }
}

class Defaultbody extends StatelessWidget {
  const Defaultbody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Padding(
        padding:  EdgeInsets.only(left: 14 , right: 14),
        child:  Center(
            child: Text('There is on weather 😊 start searching now 🔍', style: TextStyle(
              fontSize: 25,
            ),)),
      ),
    );
  }
}

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
         // هذا الوجد (LinearGradient) تعمل لتدريجة الالوان
           gradient: LinearGradient(
             colors: [
               weatherModel!.gettheme()![300]!,
               weatherModel!.gettheme()![100]!,
               weatherModel!.gettheme()![50]!,
             ],
             begin:Alignment.topCenter ,
             end: Alignment.bottomCenter,
           )),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         mainAxisSize: MainAxisSize.min,
         children: [
           const Spacer(flex: 3),
           Text(BlocProvider.of<WeatherCubit>(context).CityName!
             ,style:const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
           const SizedBox(height: 10,),
           Text(" ${weatherModel!.date.year} / ${weatherModel!.date.month} / ${weatherModel!.date.day}"
             ,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),),
           const SizedBox(height: 10,),
           Text(" ${weatherModel!.date.hour} : ${weatherModel!.date.minute}"
             ,style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold ),),
           const Spacer(),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               Image.asset('${weatherModel!.getweath()}' , width: 75,), // , width: 75),
               Text("${weatherModel!.Temp.toInt()}",style:const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
               Column(
                 children: [
                   Text("max : ${weatherModel!.maxTemp.toInt()}",style:const TextStyle(fontSize: 12,fontWeight: FontWeight.bold ),),
                   Text("min : ${weatherModel!.minTemp.toInt()}",style:const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                 ],)
             ],),
           const Spacer(
           ),
           Text(weatherModel!.weatherstatename,style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold ),),
           const Spacer(flex: 5),

         ],
       ),
     );
  }
}

// هذا بطريقة ال Provider
/*
class My_Home_App extends StatelessWidget {
  My_Home_App({super.key});
  *//*
  1- نقوم بتحويل هذا الكلاس الى (full widget) حتى استطيق استخدام (setState()) .
  2- اجعل في بيج السيرج متغير من نوع لوكر حتى تستطيع كل البيجات ان تره .
  3- نعمل فكشن تحتوي على السيت ستيت وجعل بيج السيرج تطلب فكشن .
  4- حتى عند عمل ادخال في السييرج تستطيع بيج السيرج ان تقوم ب سيت ستيت للبيت هوم.
  5- حتى تقوم هذا الفكشن بتحديث (build) وعمل التغير .
  6- هاي العمليه تسمى (lifting at setup) اي ابعث ستي ستيت الى الوجد لي محتاجه
  *//*
  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    weatherModel =Provider.of<MyProviderWeather>(context).weatherprovider;
    return Scaffold(
      appBar: AppBar(
          title:const Text("Weather App"),
          actions: [
            IconButton(
                onPressed: (){ Navigator.push(context,
                    MaterialPageRoute(builder: (context){return My_Search_App();}));
                },
                icon:const Icon(Icons.search))
          ]
      ),
      body:weatherModel == null ?
      const Padding(
        padding:  EdgeInsets.only(left: 14 , right: 14),
        child:  Center(
            child: Text('There is on weather 😊 start searching now 🔍', style: TextStyle(
              fontSize: 25,
            ),)),
      ) :
      Container(
        decoration: BoxDecoration(
          // هذا الوجد (LinearGradient) تعمل لتدريجة الالوان
            gradient: LinearGradient(
              colors: [
                weatherModel!.gettheme()![300]!,
                weatherModel!.gettheme()![100]!,
                weatherModel!.gettheme()![50]!,
              ],
              begin:Alignment.topCenter ,
              end: Alignment.bottomCenter,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(flex: 3),
            Text(Provider.of<MyProviderWeather>(context).NameCityCity!
              ,style:const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Text(" ${weatherModel!.date.year} / ${weatherModel!.date.month} / ${weatherModel!.date.day}"
              ,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),),
            const SizedBox(height: 10,),
            Text(" ${weatherModel!.date.hour} : ${weatherModel!.date.minute}"
              ,style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold ),),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('${weatherModel!.getweath()}' , width: 75,), // , width: 75),
                Text("${weatherModel!.Temp.toInt()}",style:const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                Column(
                  children: [
                    Text("max : ${weatherModel!.maxTemp.toInt()}",style:const TextStyle(fontSize: 12,fontWeight: FontWeight.bold ),),
                    Text("min : ${weatherModel!.minTemp.toInt()}",style:const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                  ],)
              ],),
            const Spacer(
            ),
            Text(weatherModel!.weatherstatename,style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold ),),
            const Spacer(flex: 5),

          ],
        ),
      ),
    );
  }
}
*/
