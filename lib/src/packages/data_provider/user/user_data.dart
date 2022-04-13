import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:sms/src/utils/Constants.dart';
import 'package:uuid/uuid.dart';
import 'package:sms/src/models/models.dart';
import 'package:sms/src/utils/loger/console_loger.dart';

class UserDataProvider {
  final _baseUrl = Constants.ApiUrl;
  final http.Client httpClient;

  UserDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<User> getUser(String id) async {
    logTrace(id);
    final response = await httpClient.get('$_baseUrl/user/$id');

    if (response.statusCode == 200) {
      logTrace("id", response.body);
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<User>> getUsers() async {
    logTrace("before User req");

    final response = await httpClient.get('$_baseUrl/users');
    logTrace("getUsersResponseStatus", response.statusCode);

    if (response.statusCode == 200) {
      final users = jsonDecode(response.body) as List;
      logTrace("users list", users);
      final userClass = users.map((user) => User.fromJson(user)).toList();
      // logTrace("users class", userClass);
      return userClass;
    } else {
      // logTrace("err");
      throw Exception('Failed to load users');
    }
  }

  Future<User> createUser(User user) async {
    final response = await httpClient.post(
      Uri.http(_baseUrl, '/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'userName': user.name,
        'email': user.email,
        'image': user.image,
        'phone': user.phone,
        'password': user.password
      }),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create user.');
    }
  }

  Future<User> updateUser(User user) async {
    logTrace("user", user);

    var postUri = Uri.parse('$_baseUrl/user/${user.id}');
    var request = new http.MultipartRequest("PUT", postUri);

    request.fields['username'] = user.name;
    request.fields['_id'] = user.id;
    request.fields['phone'] = user.phone;
    request.fields['email'] = user.email;
    request.fields['Password'] = user.password;
    request.fields['confirmpassword'] = user.password;

    logTrace("user", request);

    final response = await request.send();
    var a = await response.stream.bytesToString();
    final jsonResp = jsonDecode(a);

    logTrace("response ==", jsonResp);
    logTrace("statusCode ", response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return User.fromJson(jsonResp);
    } else {
      throw Exception('Failed to create category.');
    }
  }

  Future<void> deleteUser(String id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/users/delete/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete user.');
    }
  }
}
