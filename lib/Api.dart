import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Api{

  String serverUrl = "http://117.197.122.139:3000";

  var status ;
  var token ;

  Future<bool> login(String UID, String PASS)async{

    String myUrl = "$serverUrl/getLoginVerify";
    final response = await  http.post(myUrl,
        headers: {
          'Accept':'application/json'
        },
        body: {

       "UID": "$UID",
       "PASS": "$PASS",

        }) ;
    var data = json.decode(response.body);
    if(data['loginSuccess']){
      return true;
    } else{
      return false;
    }
  }

  save(String token, userID, password) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
    prefs.setString('userID', userID);
    prefs.setString('password', password);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 'loginSuccess: true';
    print('read : $value');
  }

}