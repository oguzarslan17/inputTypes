import 'package:flutter/material.dart';
import 'package:flutter_app_inputtypes/stepper.dart';
import 'NavigatorLessons.dart';
import 'form_input.dart';


void main() {
  runApp(
    MaterialApp(
      title: "Flutter Dersleri",
      initialRoute: "/StepperSample", //uygulama ilk açıldığında gidilecek sayfa

      routes: {
        "/FormInput" : (context) => FormInput(),
        "/StepperSample" : (context) => StepperSample(),
        "/"      : (context) => ASayfasi(),
        "/CPage" : (context) => CSayfasi("C SAYFASI NAMED ROUTE"),
        "/DPage" : (context) => DSayfasi(),
        "FPage"  : (context) => FSayfasi(),
      },
      onGenerateRoute: (RouteSettings settings){
        List<String> path = settings.name.split("/");
        if(path[1] == "detay"){
          return MaterialPageRoute(builder: (context)=> ListeDetay(int.parse(path[2])));
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) => MaterialPageRoute(builder: (context)=> DSayfasi()), //verilen rotayı bulamazsa otomatik olarak d sayfasına yönlendiriyoruz
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),

      /*home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Listeler",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        //drawer: ,
        //body: ASayfasi(),
      ),*/
    ),
  );
}
