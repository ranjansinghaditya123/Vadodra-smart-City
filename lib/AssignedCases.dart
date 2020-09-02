import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/Dashboard.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';


class Assigned extends StatefulWidget {

  @override

  _AssignedState createState() => _AssignedState();

}

class _AssignedState extends State<Assigned> {

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
                            Container(
                                padding: EdgeInsets.all(20),
                                height: 70,
                                width: 70,
                                child: Text(
                                  'Upload Image',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                )),
                            Container(
                              margin: EdgeInsets.all(10),
                              color: Colors.blue,
                              child: FlatButton(
                                onPressed: () {
                                  Route route = MaterialPageRoute(builder:  (context)=> UserImageUpload());
                                  Navigator.pushReplacement(context, route);
                                },
                                child: Text(
                                  'Upload Image',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(20),
                                height: 70,
                                width: 70,
                                child: Text('Title',style: TextStyle(color: Colors.black,fontSize: 20),)),
                            Container(
                                padding: EdgeInsets.all(10),
                                height: 70,
                                width: 70,
                                child: Text(Assignedcases[index]['title'],style: TextStyle(color: Colors.green,fontSize: 16),)),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(20),
                                height: 70,
                                width: 70,
                                child: Text('Description',style: TextStyle(color: Colors.black,fontSize: 20),),),
                            Container(
                                padding: EdgeInsets.all(10),
                                height: 70,
                                width: 70,
                                child: Text(Assignedcases[index]['desc'],style: TextStyle(color: Colors.green,fontSize: 16),)),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(20),
                                height: 70,
                                width: 70,
                                child: Text('Type',style: TextStyle(color: Colors.black,fontSize: 20),)),
                            Container(
                                padding: EdgeInsets.all(10),
                                height: 70,
                                width: 70,
                                child: Text(Assignedcases[index]['type'],style: TextStyle(color: Colors.green,fontSize: 16),)),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(20),
                                height: 70,
                                width: 70,
                                child: Text('Priority',style: TextStyle(color: Colors.black,fontSize: 20),)),
                            Container(
                                padding: EdgeInsets.all(10),
                                height: 70,
                                width: 70,
                                child: Text(Assignedcases[index]['priority'],style: TextStyle(color: Colors.green,fontSize: 16),)),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(20),
                                height: 70,
                                width: 70,
                                child: Text('Landmark',style: TextStyle(color: Colors.black,fontSize: 20),)),
                            Container(
                                padding: EdgeInsets.all(10),
                                height: 70,
                                width: 70,
                                child: Text(Assignedcases[index]['landmark'],style: TextStyle(color: Colors.green,fontSize: 16),)),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(20),
                                height: 70,
                                width: 70,
                                child: Text('Date',style: TextStyle(color: Colors.black,fontSize: 20),)),
                            Container(
                                padding: EdgeInsets.all(10),
                                height: 70,
                                width: 70,
                                child: Text(Assignedcases[index]['date'],style: TextStyle(color: Colors.green,fontSize: 16),)),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(20),
                              height: 70,
                              width: 70,
                              child: Text('Time',style: TextStyle(color: Colors.black,fontSize: 20),),),
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 70,
                              width: 70,
                              child: Text(Assignedcases[index]['time'],style: TextStyle(color: Colors.green,fontSize: 16),),),
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

class UserImageUpload extends StatefulWidget {

  UserImageUpload() : super();
  final String title = "Upload Image ";



  @override
  UserImageUploadState createState() => UserImageUploadState();

}

class UserImageUploadState extends State<UserImageUpload> {



  static final String uploadEndPoint = 'http://117.197.122.139:3000/postEventImageComment';
  Future<File> file;
  String Comment = '';
  String status = '';
  String base64Image;
  File tmpFile;
  SharedPreferences sharedPreferences ;
  String errMessage = 'Error Uploading Image';
  List Assignedcases = [];

  var lat ;
  var long;
  String count = "";




  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.camera,imageQuality: 70,maxHeight: 300,maxWidth: 300);
    });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  startUpload() {
    setStatus('Uploaded');
    if (null == tmpFile) {
      setStatus(errMessage);
      return;
    }
    String fileName = tmpFile.path.split('/').last;
    upload(fileName);
    upload(Comment);
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

    setState(() {
      Assignedcases = jsondata;
    }
    );
  }


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

  upload(String fileName) async{


    final body = {
      "EVENTID" : Assignedcases[0]['id'],
      "IMGURL":  base64Image,
      "COMMENT": Comment,
      "LATITUDE" : lat,
      "LONGITUDE": long,
    };

    print('Printing...');
    print(body);

    final jsonBody = json.encode(body);

    final header= {
      'Accept': 'application/json',
      "Content-Type": "application/json"
    };

    final result = await http.post(uploadEndPoint, body: jsonBody, headers: header);
    print(result.statusCode);
    print(result.body);
    print(result);
    setStatus(result.statusCode == 200 ? result.body : errMessage);

  }


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
    }
    );
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          var imageread =  snapshot.data.readAsBytesSync();
          base64Image = base64Encode(imageread);
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  _gottodashboard()async{
  final route = Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()),);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _assigned();
    _getCurrentLocation();
    _assignedcases();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Upload Image ")),
        ),
        body: GestureDetector(
          onTap:(){
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                OutlineButton(
                  onPressed: (){
                    _getCurrentLocation();
                    chooseImage();
                  },
                  child: Text('Choose Image'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                showImage(),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Comment',
                  ),
                  onChanged: (value){
                    Comment = value;
                  },
                ),
                SizedBox(
                  height: 5 ,
                ),
                Container(
                  color: Colors.blue,
                  child: FlatButton(
                    onPressed: startUpload,
                    child: Text('Upload Image'),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  status,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  color: Colors.blue,
                  child: FlatButton(
                    onPressed: (){
                      _assignedcases();
                      _gottodashboard();
                      },
                    child: Text('Go To DashBoard'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


