import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:login_app/LogIn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'AssignedCasesSmall.dart';
import 'MycasesSmall.dart';


class Dashboard extends StatefulWidget {

  Dashboard({Key key, this.title}) :super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();

}

class _DashboardState extends State<Dashboard> {

  String count = "";
  String count1 = "";
  String loggedInUser ="";

  GetDateAndTime()
  {
    var now = new DateTime.now();
    print(new DateFormat("dd-MM-yyyy").format(now));
    print(new DateFormat("H:m:s").format(now));
    return now.toString();
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);

  }

  // Mycases(assignedcases)

  _assignedcases () async {
    final prefs = await SharedPreferences.getInstance();
    final username = await prefs.getString('userID');
    final password = await prefs.getString('password');

    final header = {'Accept':'application/json', "Content-Type" : "application/json"};
    final body =  {
      "UID": username,
      "PASS" : password,
    };
    var data =  await http.post("http://117.197.122.139:3000/getPastEventCount", headers: header, body: json.encode(body));
    print('Printing....');
    print(data);
    var jsondata = json.decode(data.body);
    setState(() {
      count = jsondata["count"];
      print('A'+count);
    }
    );
  }

  // Assigned Cases(Mycases)

  _Mycases () async {
    final prefs = await SharedPreferences.getInstance();
    final username = await prefs.getString('userID');
    final password = await prefs.getString('password');
    final header = {'Accept':'application/json', "Content-Type" : "application/json"};
    final body =  {
      "UID": username,
      "PASS" : password,
    };
    var data =  await http.post("http://117.197.122.139:3000/getOpenEventCount", headers: header, body: json.encode(body));

    var jsondata = json.decode(data.body);

    setState(() {
      count1 = jsondata["count"];
      print('my'+count1);
      loggedInUser = jsondata["loggedInUser"];

    }
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _assignedcases();
    _Mycases();
   GetDateAndTime();
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


  movetoMyCasesPage()async{
   final response=  await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>  Casessmall(),));
   _Mycases();

  }

  movetoAssignedCases()async{
    final response = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>Assignedsmall(),));
    _assignedcases();
  }

  @override
  Widget build(BuildContext context) {



    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              Expanded(child: FlatButton(child: Text('CCC Tickets Dashboard',style: TextStyle(color: Colors.white,fontSize: 20),),)),
            ],
          ),
          body: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(30,20,20,10),
                    child: Row(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text('User Name: ',style: TextStyle(color: Colors.black,fontSize: 15)),
                            ),
                            Container(
                              child: Text(loggedInUser,style: TextStyle(color: Colors.green,fontSize: 15)),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(30,0,20,10),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: Text('User Logged Since: ',style: TextStyle(color: Colors.black,fontSize: 15)),
                            ),
                            Container(
                              child: Text(GetDateAndTime(),style: TextStyle(color: Colors.green,fontSize: 15)),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),

                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: movetoMyCasesPage,
                          child: Container(
                            color: Colors.orange,
                            height: 200,
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Completed Tickets',style: TextStyle(color: Colors.white,fontSize: 20),),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(count, style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: movetoAssignedCases,
                          child: Container(
                            color: Colors.green,
                            height: 200,
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Assigned Tickets',style: TextStyle(color: Colors.white,fontSize: 20),),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(count1, style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 250,20,20),
                    height: 50,
                    width:double.infinity ,
                    child: FlatButton(
                      onPressed: (){
                        _save('N');
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>  LogIn(
                            ),
                          ),
                        );
                      },
                      color: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0))),
                      child: Text('Log Out',style: TextStyle(color: Colors.white,fontSize: 20),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}







