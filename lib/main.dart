import 'package:burc_rehber/burc_detayi.dart';
import 'package:burc_rehber/burc_listesi.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burç Rehberi',
      debugShowCheckedModeBanner: false,

      initialRoute: "/burcListesi",

      routes: {
        "/" : (context)=>BurcListesi(),
        "/burcListesi" : (context)=>BurcListesi(),
      },

      onGenerateRoute: (RouteSettings settings){
        List<String> pathElements = settings.name.split("/");
        if(pathElements[1] == 'burcDetayi'){
          return MaterialPageRoute(builder: (context)=> BurcDetayi(int.parse(pathElements[2])));
        }
        return null;
      },

      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}