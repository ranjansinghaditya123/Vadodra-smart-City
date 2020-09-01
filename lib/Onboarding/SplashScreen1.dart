
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen1 extends StatefulWidget{
  @override
  _SplashScreen1State createState() => _SplashScreen1State();

}

class _SplashScreen1State extends State<SplashScreen1>{

  @override

  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.amber,
      statusBarBrightness: Brightness.dark,
    ));

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('images/back6.jpg')
          )
      ),
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
              'GREAT FACILITY',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: 10,
            width: double.infinity,
          ),
          Container(
            child: Text('City accomodation',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                )),
          ),
          Container(
            child: Text(' Good transportation facility ',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                )),
          ),
          Container(
            child: Text('To xplore beautifull city and its culture', style: TextStyle(
              fontSize: 20,
              color: Colors.deepOrange,
            )),
          ),
          Container(
            color: Colors.blue,
            margin: EdgeInsets.all(20),
            height: 50,
            width: double.infinity,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(26))),
              child: Text('GET STARTED',style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}