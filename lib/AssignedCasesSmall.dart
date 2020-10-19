import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'AssignedCases.dart';

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
  String closedtime = "";
  String time = "";
  String chimpby = "";
  String id = "";
  String iocimgurl = "";
  String appimgurl = "";
  String chresby = "";
  List Assignedcases = [];


  List<ListType> _dropdownTypeItems = [
    ListType("DATE-DSC", "Oldest"),
    ListType("DATE-ASC", "Newest"),
    ListType("ID-ASC", "Id-Ascending"),
    ListType("ID-DESc", "Id-Descending"),
  ];

  List<DropdownMenuItem<ListType>> _dropdownMenuItems;
  ListType _selectedItem;

  List<DropdownMenuItem<ListType>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListType>> items = List();
    for (ListType listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }








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



 _sorting()async{
   final prefs = await SharedPreferences.getInstance();
   final username = await prefs.getString('userID');

   final header = {'Accept':'application/json', "Content-Type" : "application/json"};

   final body =  {

     "UID": username,
      "TYPE" : _selectedItem,


   };
   var data =  await http.post("http://117.197.122.139:3000/getOpenEventDetailsAfterSorting", headers: header, body: json.encode(body));
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
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownTypeItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {









    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0,0),
              child: Container(
                  child: DropdownButton<ListType>(
                    focusColor: Colors.white,
                    value: _selectedItem,
                    items: _dropdownMenuItems,
                    onChanged: (value){
                      setState(() {
                        _selectedItem = value;
                      });
                    },
                  )
              ),
            ),
            Container(
              child: FlatButton(
                onPressed: _sorting,
                child: Icon(
                  Icons.sort,color: Colors.white,
                ),
              ),
            )
          ],
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
                  Container(
                    child: Container(
                      child: FlatButton(
                        child: Center(child: Text('Assigned Tickets',style: TextStyle(color: Colors.black,fontSize: 15),)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                  ),
                  Table(
                    border: TableBorder.all(color: Colors.black,width: 1.5),
                    defaultVerticalAlignment: TableCellVerticalAlignment.top,
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(3),
                                height: 70,
                                width: 70,
                                child: Text('Ticket Id',style: TextStyle(color: Colors.black,fontSize: 14),),),
                              Container(
                                padding: EdgeInsets.all(3),
                                height: 70,
                                width: 70,
                                child: Text(Assignedcases[index]['id'].toString(),style: TextStyle(color: Colors.blue,fontSize: 12),),),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(3),
                                height: 70,
                                width: 70,
                                child: Text('Date',style: TextStyle(color: Colors.black,fontSize: 14),),),
                              Container(
                                padding: EdgeInsets.all(3),
                                height: 70,
                                width: 70,
                                child: Text(Assignedcases[index]['closedtime'],style: TextStyle(color: Colors.blue,fontSize: 12),),)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.all(3),
                                  height: 70,
                                  width: 70,
                                  child: Text('Time',style: TextStyle(color: Colors.black,fontSize: 14),)),
                              Container(
                                padding: EdgeInsets.all(3),
                                height: 70,
                                width: 70,
                                child: Text(Assignedcases[index]['time'],style: TextStyle(color: Colors.blue,fontSize: 12),),)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(3),
                                height: 70,
                                width: 70,
                                child: Text('Type',style: TextStyle(color: Colors.black,fontSize: 14),),),
                              Container(
                                padding: EdgeInsets.all(3),
                                height: 70,
                                width: 70,
                                child: Text(Assignedcases[index]['type'],style: TextStyle(color: Colors.blue,fontSize: 12),),)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(3),
                                height: 70,
                                width: 70,
                                child: Text('Priority',style: TextStyle(color: Colors.black,fontSize: 14),),),
                              Container(
                                padding: EdgeInsets.all(3),
                                height: 70,
                                width: 70,
                                child: Text(Assignedcases[index]['priority'],style: TextStyle(color: Colors.blue,fontSize: 12),),)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(3),
                                height: 70,
                                width: 70,
                                child: Text('Details',style: TextStyle(color: Colors.black,fontSize: 14),),),

                              Container(
                                margin: EdgeInsets.all(3),
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

class ListType {
  String value;
  String name;

  ListType(this.value, this.name);
}
