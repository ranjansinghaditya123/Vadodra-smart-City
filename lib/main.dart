import 'dart:async';
import 'package:flutter/material.dart';
import 'LogIn.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/LogIn': (BuildContext context) => new LogIn()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds:2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/LogIn');
  }

  var lat ;
  var long;

  _getCurrentLocation() async{

    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState((){
        lat =position.latitude.toString();
        long = position.longitude.toString();
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
    _getCurrentLocation();

  }

  @override
  Widget build(BuildContext context) {



    return new Scaffold(
      body: Container(
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'images/logo.jpg',
                    )),
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
            ),
            Container(
              child: Text(
                'CCC Mobile App',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 10,
              width: double.infinity,
            ),
            Container(
              child: Text(
                'For Field Officer',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


