import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms/src/utils/Constants.dart';

import 'package:sms/src/app.dart';
import 'package:sms/src/utils/loger/console_loger.dart';

class AuthDataProvider {

  final http.Client httpClient;
  static  String token="";

  final _baseUrl = Constants.loginUrl;

  AuthDataProvider({@required this.httpClient}) : assert(httpClient != null);
  // Future<>
  Future<User> Signup(User user) async {
    logTrace("insede signpu");

    var postUri = Uri.parse('$_baseUrl/signup');
    var request = new http.MultipartRequest("POST", postUri);


    request.fields['username'] = user.name;
    // request.fields['name'] = item.name;
    request.fields['email'] = user.email;
    request.fields['password'] = user.password;
    request.fields['confirmpassword'] = user.password;

    logTrace("statusCode ", "jjj");

    final response = await request.send();
    logTrace("statusCode ", "jjj");
    var a = await response.stream.bytesToString();
    final jsonResp = jsonDecode(a);
    // logTrace("response ==", jsonResp);
    logTrace("statusCode ", response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      token=jsonResp["token"];
      return User.fromJson(jsonResp);
    } else {
      throw Exception('Failed to login.');
    }
  }

  Future<User> Login(AuthInfo authinfo) async {
    logTrace("key");
    var postUri = Uri.parse('$_baseUrl/login');
    var request = new http.MultipartRequest("POST", postUri);


    logTrace("auth info", authinfo);
    request.fields['info'] = authinfo.info;
    // request.fields['name'] = item.name;
    request.fields['info_type'] = "email";
    request.fields['password'] = authinfo.password;

    final response = await request.send();

    var a = await response.stream.bytesToString();

    final jsonResp = jsonDecode(a);


    logTrace("status",response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      // token=jsonResp["token"];
      return User.fromJson(jsonResp);
    } else {
      throw Exception('Failed to login.');
    }
  }

  Future<void> persist(String key, String value)async{
    final sharedPreference=await SharedPreferences.getInstance();
    sharedPreference.setString(key, value);
  }

  Future<void> persistUser(User user)async{
    final sharedPreference=await SharedPreferences.getInstance();
    sharedPreference.setString("token", user.token);
    sharedPreference.setString("name", user.name);
    sharedPreference.setString("email", user.email);
    sharedPreference.setString("image", user.image);
    sharedPreference.setString("role", user.role);
  }

  Future<User>getPersistedUser()async{
    final sharedPreference=await SharedPreferences.getInstance();
    final String token=sharedPreference.getString("token");
    if(token==null){
      return null;
    }
    final String name=sharedPreference.getString("name");
    final String email=sharedPreference.getString("email");
    final String image=sharedPreference.getString("image");
    final String role=sharedPreference.getString("role");
    return User(email: email,name:name,image: image,role: role);
  }

  Future<void>removePersistedUser()async{
    final sharedPrefernce=await SharedPreferences.getInstance();
    sharedPrefernce.remove("token");
    sharedPrefernce.remove("name");
    sharedPrefernce.remove("email");
    sharedPrefernce.remove("role");
    sharedPrefernce.remove("image");

  }

}