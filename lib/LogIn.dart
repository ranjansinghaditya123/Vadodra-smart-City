import 'package:flutter/material.dart';
import 'package:login_app/Api.dart';
import 'package:login_app/ForgetPassword.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_app/Dashboard.dart';

class LogIn extends StatefulWidget {

  LogIn({Key key , this.title}) : super(key : key);

  final String title;

  SharedPreferences sharedPreferences;

  @override

  _LogInState createState() => _LogInState();

}

class _LogInState extends State<LogIn>{

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 'N' ;
    if(value == 'Y'){
      Route route = MaterialPageRoute(builder:  (context)=> Dashboard());
      Navigator.pushReplacement(context, route);
    }
  }

  Api api = new Api();
  String msgStatus = '';

  final TextEditingController _useridController =  TextEditingController();
  final TextEditingController _passwordController =  TextEditingController();

  _onPressed() async {
    var username = _useridController.text.trim().toLowerCase();
    var password = _passwordController.text.trim();
    if(username.isNotEmpty && password.isNotEmpty ){
      final requestData = await api.login(username, password);

      if(requestData) {
        api.save("Y", username, password);
        Route route = MaterialPageRoute(builder:  (context)=> Dashboard());
        Navigator.pushReplacement(context, route);
      } else{
        _showDialog();
      }
    }
    setState(() {

    });
  }

  void _showDialog(){
    showDialog(
        context:context ,
        builder:(BuildContext context){
          return AlertDialog(
            title:  Text('Failed'),
            content:   Text('Check your email or password'),
            actions: <Widget>[
               RaisedButton(
                child:  Text(
                  'Close',
                ),
                onPressed: (){
                  Navigator.of(context).pop();
                },

              ),
            ],
          );
        }
    );
  }

  Container TextSection(){
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: TextFormField(
              controller: _useridController,
              decoration: InputDecoration(
                icon: Icon(Icons.mail),
                hintText: 'User ID',
                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextFormField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                hintText: 'Password',
                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );

  }

  Column SignInButton(){
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgetPassword()),
                    );
                  },
                  child: Text('Forget Password?',style: TextStyle(color: Colors.blue,),),
                ),
              ),
              Container(
                height: 50,
                width: 100,
                color: Colors.blue,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: FlatButton(
                  onPressed: _onPressed,
                  child: Text('Sign In',style: TextStyle(color: Colors.white,),),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 130, 10, 10),
          child: Text('© VSCDL, Version 1.2, August 2020',style: TextStyle(fontSize: 13,color: Colors.black),),
        )
      ],
    );
  }


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    read();
  }



  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
            body: SafeArea(
              child: GestureDetector(
                onTap: (){
                  FocusScope.of(context).unfocus();
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: Colors.grey,
                    ),
                    Positioned(
                      top: 30,
                      right: 30,
                      left: 50,
                      bottom: 500,
                      child: Container(
                        child: Text('CCC Mobile App For Field Officer',style: TextStyle(color: Colors.black,fontSize: 22),),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      bottom: 18,
                      right: 30,
                      left: 30,
                      child: Container(
                        color: Colors.white,
                        child:  ListView(
                          children: <Widget>[
                            HeaderSection(),
                            TextSection(),
                            SignInButton(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}

Container HeaderSection(){
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(20,10, 20, 10),
          child: Text('Login Here',style: TextStyle(color: Colors.black,fontSize:30),),
        ),
        Container(
          height: 120,
          width: 120,
          margin: EdgeInsets.fromLTRB(20, 0, 30, 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('images/logo.jpg')
            ),
            shape: BoxShape.circle,
          ),
        ),
      ],
    ),
  );
}




