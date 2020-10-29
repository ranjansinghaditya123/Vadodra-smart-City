import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:login_app/MycasesSmall.dart';


class MyCases extends StatefulWidget {

  final Event event ;
  MyCases({Key key, this.event}) : super(key: key);

  @override
  _MyCasesState createState() => _MyCasesState(event);

}

class _MyCasesState extends State<MyCases> {


  final Event event ;
  _MyCasesState(this.event);

  SharedPreferences sharedPreferences;

  String title = "";
  String desc = "";
  String type = "";
  String landmark = "";
  String lati = "";
  String longi = "";
  String priority = "";
  String closedtime = "";
  String iocimgurl = "";
  String appimgurl = "";
  String chresby = "";
  String id = "";
  String chimpby = "";



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

      "EVENTID":'${event.eventid}',

    };
    var data = await http.post(
        "http://117.197.122.139:3000/getEventDetailsByID",
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
              'Completed Tickets',
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
                  Table(
                    border: TableBorder.all(color: Colors.black, width: 1.5),
                    defaultVerticalAlignment: TableCellVerticalAlignment.top,
                    children: <TableRow>[

                      TableRow(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(5),
                              height: 70,
                              width: 70,
                              child: Text(
                                'Ticket Id',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                          Container(
                              padding: EdgeInsets.all(1),
                              height: 70,
                              width: 70,
                              child: Text(
                                myCases[index]['id'].toString(),
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16),
                              )),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(1),
                              height: 70,
                              width: 70,
                              child: Text(
                                'Ticket Closed',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                          Container(
                              padding: EdgeInsets.all(1),
                              height: 70,
                              width: 70,
                              child: Text(
                                myCases[index]['chresby'].toString(),
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16),
                              )),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(1),
                              height: 70,
                              width: 70,
                              child: Text(
                                'Closed Date/Time',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                          Container(
                              padding: EdgeInsets.all(1),
                              height: 70,
                              width: 70,
                              child: Text(
                                myCases[index]['closedtime'].toString(),
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16),
                              )),
                        ],
                      ),

                      TableRow(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(1),
                              height: 70,
                              width: 70,
                              child: Text(
                                'Ticket Raised',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                          Container(
                              padding: EdgeInsets.all(1),
                              height: 70,
                              width: 70,
                              child: Text(
                                myCases[index]['chimpby'].toString(),
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16),
                              )),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(1),
                              height: 70,
                              width: 70,
                              child: Text(
                                'Ticket Type',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                          Container(
                              padding: EdgeInsets.all(1),
                              height: 70,
                              width: 70,
                              child: Text(
                                myCases[index]['type'].toString(),
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16),
                              )),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(1),
                              height: 70,
                              width: 70,
                              child: Text(
                                'Priority',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                          Container(
                              padding: EdgeInsets.all(1),
                              height: 70,
                              width: 70,
                              child: Text(
                                myCases[index]['priority'].toString(),
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16),
                              )),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(1),
                            height: 70,
                            width: 70,
                            child: Text(
                              'Landmark',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(1),
                            height: 70,
                            width: 70,
                            child: Text(
                              myCases[index]['landmark'].toString(),
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(1),
                            height: 70,
                            width: 70,
                            child: Text(
                              'Title',
                              style:
                              TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(1),
                            height: 70,
                            width: 70,
                            child: Text(
                              myCases[index]['title'].toString(),
                              style:
                              TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(1),
                            height: 70,
                            width: 70,
                            child: Text(
                              'Description',
                              style:
                              TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(1),
                            height: 70,
                            width: 70,
                            child: Text(
                              myCases[index]['desc'].toString(),
                              style:
                              TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(1),
                            height: 70,
                            width: 70,
                            child: Text(
                              'Latitude',
                              style:
                              TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(1),
                            height: 70,
                            width: 70,
                            child: Text(
                              myCases[index]['lati'].toString(),
                              style:
                              TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(1),
                            height: 70,
                            width: 70,
                            child: Text(
                              'Longitude',
                              style:
                              TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(1),
                            height: 70,
                            width: 70,
                            child: Text(
                              myCases[index]['longi'].toString(),
                              style:
                              TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(1),
                              height: 200,
                              width: 200,
                              child: Text(
                                'Previous Image',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                          Container(
                            padding: EdgeInsets.all(1),
                            height: 200,
                            width: 200,
                            child: Image.network(myCases[index]['iocimgurl'],fit: BoxFit.fill,),),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(1),
                              height: 200,
                              width: 200,
                              child: Text(
                                'Photo Taken While Closeing',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                          Container(
                            padding: EdgeInsets.all(1),
                            height: 200,
                            width: 200,
                            child: Image.network(myCases[index]['appimgurl'],fit: BoxFit.fill,),),
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


