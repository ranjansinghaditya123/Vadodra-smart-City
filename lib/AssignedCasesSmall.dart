
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'AssignedCases.dart';
import 'Dashboard.dart';



class Assignedsmall extends StatefulWidget {

  @override

  _AssignedsmallState createState() => _AssignedsmallState();

}

class _AssignedsmallState extends State<Assignedsmall> {

  SharedPreferences sharedPreferences;

  String title = "";
  String desc = "";
  String type = "";
  String landmark = "";
  String lati = "";
  String longi = "";
  String priority = "";
  String date = "";
  String time = "";
  String chimpby = "";
  String id = "";
  String imgurl = "";
  String chresby = "";

  List Assignedcases = [];



  _assigned () async {

    final prefs = await SharedPreferences.getInstance();
    final username = await prefs.getString('userID');
    final password = await prefs.getString('password');

    final header = {'Accept':'application/json', "Content-Type" : "application/json"};

    final body =  {

      "UID": username,
      "PASS" : password,

    };
    var data =  await http.post("http://117.197.122.139:3000/getOpenEventDetails", headers: header, body: json.encode(body));
    var jsondata = json.decode(data.body);

    print('Printing...');

    print(jsondata);

    setState((){

      Assignedcases = jsondata;

    }
    );
  }





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _assigned();
  }

  @override
  Widget build(BuildContext context) {




    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Assigned Tickets')),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: Assignedcases.length,
            itemBuilder: (BuildContext context , int index){

              _navigateHome(BuildContext context) async {
                Event event =  Event(Assignedcases[index]['id'].toString());
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Assigned(
                          event: event,
                        )));
                print(result);
              }

              return Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                  ),
//                    Row(
//                      children: <Widget>[
//                        SizedBox(
//                          height: 0,
//                          width: 220,
//                        ),
//                        Container(
//                          margin: EdgeInsets.all(10),
//                          color: Colors.blue,
//                          child: FlatButton(
//                            onPressed: (){
//                              Navigator.push(
//                                context,
//                                MaterialPageRoute(builder: (context) => UserImageUpload()),
//                              );
//                            },
//                            child: Text('Upload Image',style: TextStyle(color: Colors.white),),),
//                        ),
//                      ],
//                    ),
                  Table(
                    border: TableBorder.all(color: Colors.blue,width: 1.5),
                    defaultVerticalAlignment: TableCellVerticalAlignment.top,
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 70,
                                width: 70,
                                child: Text('Ticket Id',style: TextStyle(color: Colors.black,fontSize: 15),),),
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 70,
                                width: 70,
                                child: Text(Assignedcases[index]['id'].toString(),style: TextStyle(color: Colors.green,fontSize: 12),),),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 70,
                                width: 70,
                                child: Text('Date',style: TextStyle(color: Colors.black,fontSize: 15),),),
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 70,
                                width: 70,
                                child: Text(Assignedcases[index]['date'],style: TextStyle(color: Colors.green,fontSize: 12),),)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.all(5),
                                  height: 70,
                                  width: 70,
                                  child: Text('Time',style: TextStyle(color: Colors.black,fontSize: 15),)),
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 70,
                                width: 70,
                                child: Text(Assignedcases[index]['time'],style: TextStyle(color: Colors.green,fontSize: 12),),)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 70,
                                width: 70,
                                child: Text('Type',style: TextStyle(color: Colors.black,fontSize: 15),),),
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 70,
                                width: 70,
                                child: Text(Assignedcases[index]['type'],style: TextStyle(color: Colors.green,fontSize: 12),),)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 70,
                                width: 70,
                                child: Text('Priority',style: TextStyle(color: Colors.black,fontSize: 15),),),
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 70,
                                width: 70,
                                child: Text(Assignedcases[index]['priority'],style: TextStyle(color: Colors.green,fontSize: 12),),)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 70,
                                width: 70,
                                child: Text('Details',style: TextStyle(color: Colors.black,fontSize: 15),),),

                              Container(
                                margin: EdgeInsets.all(5),
                                color: Colors.blue,
                                child: FlatButton(
                                  onPressed: (){
                                    _navigateHome(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  )
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class Event{

  final String eventid ;
  Event(this.eventid);

}