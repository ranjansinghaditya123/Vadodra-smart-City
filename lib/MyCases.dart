import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


//class MyCases extends StatefulWidget {
//
//  @override
//  _MyCasesState createState() => _MyCasesState();
//
//}
//
//class _MyCasesState extends State<MyCases> {
//
//  SharedPreferences sharedPreferences;
//
//  String title = "";
//  String desc = "";
//  String type = "";
//  String landmark = "";
//  String lati = "";
//  String longi = "";
//  String priority = "";
//  String date = "";
//  String time = "";
//
//
//  List myCases = [];
//
//  _my () async {
//
//    final prefs = await SharedPreferences.getInstance();
//    final username = await prefs.getString('userID');
//    final password = await prefs.getString('password');
//
//    print('Printing.....');
//    final header = {'Accept':'application/json', "Content-Type" : "application/json"};
//    final body =  {
//      "UID": username,
//      "PASS" : password,
//
//    };
//    var data =  await http.post("http://117.197.122.139:3000/getOpenEventDetails", headers: header, body: json.encode(body));
//    var jsondata = json.decode(data.body);
//    setState(() {
//      myCases = jsondata;
//    }
//    );
//  }
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _my();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Center(child: Text('My Cases'),),
//        ),
//        body: Container(
//          child: ListView.builder(
//            itemCount: myCases.length,
//            itemBuilder: (BuildContext context , int index){
//              return Container(
//                height: 600,
//                width: 400,
//                child: Column(
//                  children: <Widget>[
//                    SizedBox(
//                      height: 10,
//                      width: double.infinity,
//                      child: Container(
//                        color: Colors.black,
//                      ),
//                    ),
//                    Container(
//                      height: 110,
//                      width: double.infinity,
//                      margin: EdgeInsets.all(10),
//                      decoration: BoxDecoration(
//                        border: Border.all(
//                          width: 1,
//                          color: Colors.blue,
//                        ),
//                      ),
//                      child: ListView(
//                        scrollDirection: Axis.horizontal,
//                        children: <Widget>[
//                          Row(children: <Widget>[
//                            Container(
//                              margin: EdgeInsets.all(10),
//                              child: Column(children: <Widget>[
//                                Container(
//                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
//                                    child: Text('Title',style: TextStyle(color: Colors.black,fontSize: 25),)),
//                                Container(
//                                    margin: EdgeInsets.all(10),
//                                    child: Text(myCases[index]['title'],style: TextStyle(color: Colors.green,fontSize: 16),))
//                              ],),
//                            ),
//                            SizedBox(
//                              height: 0,
//                              width: 100,
//                            ),
//                            FlatButton(
//                              onPressed: (){
//                                Navigator.push(
//                                  context,
//                                  MaterialPageRoute(builder: (context) => UserImageUpload()),
//                                );
//                              },
//                              child: Icon(Icons.file_upload,color: Colors.black,size: 40,),),
//                          ],),
//                        ],
//                      ),
//                    ),
//                    Container(
//                      height: 110,
//                      width: double.infinity,
//                      margin: EdgeInsets.all(10),
//                      decoration: BoxDecoration(
//                        border: Border.all(
//                          width: 1,
//                          color: Colors.blue,
//                        ),
//                      ),
//                      child: ListView(
//                        scrollDirection: Axis.horizontal,
//                        children: <Widget>[
//                          Row(children: <Widget>[
//                            Container(
//                              margin: EdgeInsets.all(10),
//                              child: Column(children: <Widget>[
//                                Container(
//                                    margin: EdgeInsets.all(10),
//                                    child: Text('Description',style: TextStyle(color: Colors.black,fontSize: 25),)),
//                                Container(
//                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
//                                    child: Text(myCases[index]['desc'],style: TextStyle(color: Colors.green,fontSize: 16),))
//                              ],),
//                            ),
//                            Container(
//                              margin: EdgeInsets.all(10),
//                              child: Column(children: <Widget>[
//                                Container(
//                                    margin: EdgeInsets.all(10),
//                                    child: Text('Landmark',style: TextStyle(color: Colors.black,fontSize: 25),)),
//                                Container(
//                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
//                                    child: Text(myCases[index]['landmark'],style: TextStyle(color: Colors.green,fontSize: 16),))
//                              ],),
//                            ),
//                          ],),
//                        ],
//                      ),
//                    ),
//                    Container(
//                      height: 110,
//                      width: double.infinity,
//                      margin: EdgeInsets.all(10),
//                      decoration: BoxDecoration(
//                        border: Border.all(
//                          width: 1,
//                          color: Colors.blue,
//                        ),
//                      ),
//                      child: ListView(
//                        scrollDirection: Axis.horizontal,
//                        children: <Widget>[
//                          Row(children: <Widget>[
//                            Container(
//                              margin: EdgeInsets.all(10),
//                              child: Column(children: <Widget>[
//                                Container(
//                                    margin: EdgeInsets.all(10),
//                                    child: Text('Type',style: TextStyle(color: Colors.black,fontSize: 25),)),
//                                Container(
//                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
//                                    child: Text(myCases[index]['type'],style: TextStyle(color: Colors.green,fontSize: 16),))
//                              ],),
//                            ),
//                            SizedBox(
//                              height: 0,
//                              width: 30,
//                            ),
//                            Container(
//                              margin: EdgeInsets.all(10),
//                              child: Column(children: <Widget>[
//                                Container(
//                                    margin: EdgeInsets.all(10),
//                                    child: Text('Date',style: TextStyle(color: Colors.black,fontSize: 25),)),
//                                Container(
//                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
//                                    child: Text(myCases[index]['date'],style: TextStyle(color: Colors.green,fontSize: 16),))
//                              ],),
//                            ),
//                          ],),
//                        ],
//                      ),
//                    ),
//                    Container(
//                      height: 110,
//                      width: double.infinity,
//                      margin: EdgeInsets.all(10),
//                      decoration: BoxDecoration(
//                        border: Border.all(
//                          width: 1,
//                          color: Colors.blue,
//                        ),
//                      ),
//                      child: ListView(
//                        scrollDirection: Axis.horizontal,
//                        children: <Widget>[
//                          Row(children: <Widget>[
//                            Container(
//                              margin: EdgeInsets.all(10),
//                              child: Column(children: <Widget>[
//                                Container(
//                                    margin: EdgeInsets.all(10),
//                                    child: Text('Priority',style: TextStyle(color: Colors.black,fontSize: 25),)),
//                                Container(
//                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
//                                    child: Text(myCases[index]['priority'],style: TextStyle(color: Colors.green,fontSize: 16),))
//                              ],),
//                            ),
//                            SizedBox(
//                              height: 0,
//                              width: 150,
//                            ),
//                            Container(
//                              margin: EdgeInsets.all(10),
//                              child: Column(children: <Widget>[
//                                Container(
//                                    margin: EdgeInsets.all(10),
//                                    child: Text('Time',style: TextStyle(color: Colors.black,fontSize: 25),)),
//                                Container(
//                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
//                                    child: Text(myCases[index]['time'],style: TextStyle(color: Colors.green,fontSize: 16),))
//                              ],),
//                            ),
//                          ],),
//                        ],
//                      ),
//                    ),
//                  ],
//                ),
//              )  ;
//            },
//          ),
//        )
//    );
//  }
//}

class MyCases extends StatefulWidget {

  @override
  _MyCasesState createState() => _MyCasesState();

}

class _MyCasesState extends State<MyCases> {

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

  List myCases = [];

  _my() async {

    final prefs = await SharedPreferences.getInstance();
    final username = await prefs.getString('userID');
    final password = await prefs.getString('password');

    final header = {
      'Accept': 'application/json',
      "Content-Type": "application/json"

    };
    final body = {
      "UID": username,
      "PASS": password,
    };
    var data = await http.post(
        "http://117.197.122.139:3000/getPastEventDetails",
        headers: header,
        body: json.encode(body));
    var jsondata = json.decode(data.body);
    setState(() {
      myCases = jsondata;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _my();
  }

  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text(
              'My Cases',
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: ListView.builder(
            itemCount: myCases.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                  ),
//                  Row(
//                    children: <Widget>[
//                      SizedBox(
//                        height: 0,
//                        width: 220,
//                      ),
//                      Container(
//                        margin: EdgeInsets.all(10),
//                        color: Colors.blue,
//                        child: FlatButton(
//                          onPressed: () {
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => UserImageUpload()),
//                            );
//                          },
//                          child: Text(
//                            'Upload Image',
//                            style: TextStyle(color: Colors.white),
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
                  Table(
                    border: TableBorder.all(color: Colors.blue, width: 1.5),
                    defaultVerticalAlignment: TableCellVerticalAlignment.top,
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(20),
                              height: 70,
                              width: 70,
                              child: Text(
                                'Title',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                          Container(
                              padding: EdgeInsets.all(10),
                              height: 70,
                              width: 70,
                              child: Text(
                                myCases[index]['title'],
                                style: TextStyle(
                                    color: Colors.green, fontSize: 16),
                              )),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(10),
                              height: 70,
                              width: 70,
                              child: Text(
                                'Description',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                          Container(
                              padding: EdgeInsets.all(10),
                              height: 70,
                              width: 70,
                              child: Text(
                                myCases[index]['desc'],
                                style: TextStyle(
                                    color: Colors.green, fontSize: 16),
                              )),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(10),
                              height: 70,
                              width: 70,
                              child: Text(
                                'Type',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                          Container(
                              padding: EdgeInsets.all(20),
                              height: 70,
                              width: 70,
                              child: Text(
                                myCases[index]['type'],
                                style: TextStyle(
                                    color: Colors.green, fontSize: 16),
                              )),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(10),
                              height: 70,
                              width: 70,
                              child: Text(
                                'Priority',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                          Container(
                              padding: EdgeInsets.all(10),
                              height: 70,
                              width: 70,
                              child: Text(
                                myCases[index]['priority'],
                                style: TextStyle(
                                    color: Colors.green, fontSize: 16),
                              )),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(10),
                              height: 70,
                              width: 70,
                              child: Text(
                                'Landmark',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                          Container(
                              padding: EdgeInsets.all(10),
                              height: 70,
                              width: 70,
                              child: Text(
                                myCases[index]['landmark'],
                                style: TextStyle(
                                    color: Colors.green, fontSize: 16),
                              )),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(10),
                              height: 70,
                              width: 70,
                              child: Text(
                                'Date',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                          Container(
                              padding: EdgeInsets.all(10),
                              height: 70,
                              width: 70,
                              child: Text(
                                myCases[index]['date'],
                                style: TextStyle(
                                    color: Colors.green, fontSize: 16),
                              )),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 70,
                            width: 70,
                            child: Text(
                              'Time',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            height: 70,
                            width: 70,
                            child: Text(
                              myCases[index]['time'],
                              style:
                                  TextStyle(color: Colors.green, fontSize: 16),
                            ),
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

class UserImageUpload extends StatefulWidget{

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
  List myCases = [];


  SharedPreferences sharedPreferences;
  String errMessage = 'Error Uploading Image';



  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(
          source: ImageSource.camera,
          imageQuality: 70,
          maxHeight: 300,
          maxWidth: 300);
    });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }


  _my() async {

    final prefs = await SharedPreferences.getInstance();
    final username = await prefs.getString('userID');
    final password = await prefs.getString('password');

    final header = {
      'Accept': 'application/json',
      "Content-Type": "application/json"

    };
    final body = {
      "UID": username,
      "PASS": password,
    };
    var data = await http.post(
        "http://117.197.122.139:3000/getPastEventDetails",
        headers: header,
        body: json.encode(body));
    var jsondata = json.decode(data.body);
    setState(() {
      myCases = jsondata;
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

  upload(String fileName) async {
    final prefs = await SharedPreferences.getInstance();
    final username = await prefs.getString('userID');

    final body = {
      "EVENTID": myCases[0]['id'],
      "IMGURL": base64Image,
      "COMMENT": Comment,
    };

    print('Printing...');
    print(body);

    final jsonBody = json.encode(body);

    final header = {
      'Accept': 'application/json',
      "Content-Type": "application/json"
    };

    final result =
        await http.post(uploadEndPoint, body: jsonBody, headers: header);
    print(result.statusCode);
    print(result.body);
    print(result);
    setStatus(result.statusCode == 200 ? result.body : errMessage);


  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _my();
  }



  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          var imageread = snapshot.data.readAsBytesSync();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Upload Image ")),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                OutlineButton(
                  onPressed: chooseImage,
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
                  onChanged: (value) {
                    Comment = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.blue,
                  child: FlatButton(
                    onPressed:  startUpload,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}


