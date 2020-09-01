import 'package:flutter/material.dart';
import 'package:login_app/LogIn.dart';
import 'package:login_app/Onboarding/Onboarding.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      //set logIn()
      home: Onboarding(),
    );
  }
}


