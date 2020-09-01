import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:Text('CCC Mobile App For Field Officer',style: TextStyle(color: Colors.white,fontSize: 22),),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(25, 100, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0,0,0,10),
                  child: Text('For any issue related to login issues,',style: TextStyle(color: Colors.black,fontSize: 25))),
              Container(
                  child: Text('please contact: CCC Supervisor :0265-XXXX',style: TextStyle(color: Colors.black,fontSize: 25))),
              Container(
                child: Row(
                  children: <Widget>[
                    Text('Email :',style: TextStyle(color: Colors.black,fontSize: 25)),
                    FlatButton(
                      onPressed: () => launch('supervisor_ccc@vmc.gov.in'),
                        child: Text(' supervisor_ccc@vmc.gov.in',style: TextStyle(color: Colors.green,fontSize: 20))),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 250, 10, 10),
                child: Text('© VSCDL, Version X.Y, August 2020',style: TextStyle(fontSize: 16,color: Colors.black),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
