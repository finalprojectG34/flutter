import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:sms/src/models/models.dart';
import 'package:sms/src/utils/Constants.dart';
import 'package:sms/src/utils/loger/console_loger.dart';

class RoleDataProvider {

  final _baseUrl = Constants.ApiUrl;

  final http.Client httpClient;

  RoleDataProvider({@required this.httpClient})
      : assert(httpClient != null);

  Future<Role> createRole(Role role) async {

    logTrace("insede create");
    var postUri = Uri.parse('$_baseUrl/role');
    var request = new http.MultipartRequest("POST", postUri);

    request.fields['name'] = role.name;

    final response = await request.send();
    var a = await response.stream.bytesToString();
    final jsonResp = jsonDecode(a);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Role.fromJson(jsonResp);
    } else {
      throw Exception('Failed to create role.');
    }
  }

  Future<List<Role>> getRoles() async {
    logTrace("before req");

    final response =
    await httpClient.get('$_baseUrl/roles');

    print(response.statusCode);
    logTrace("responseStatus", response.statusCode);

    if (response.statusCode == 200) {
      final role = jsonDecode(response.body) as List;
      // logTrace("items list", items);
      final roleClass =
      role.map((role) => Role.fromJson(role)).toList();
      // logTrace("role Class", roleClass);
      return roleClass;
    } else {
      logTrace("err");
      throw Exception('Failed to load role');
    }
  }

  Future<void> deleteRole(String id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/role/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete item.');
    }
  }

  Future<void> updateRole(Role role) async {
    print(role.name);
    logTrace("role", role);

    var postUri = Uri.parse('$_baseUrl/role/${role.id}');
    var request = new http.MultipartRequest("PUT", postUri);

    request.fields['name'] = role.name;
   

    final response = await request.send();
    var a = await response.stream.bytesToString();
    final jsonResp = jsonDecode(a);

    logTrace("response ==", jsonResp);
    logTrace("statusCode ", response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Role.fromJson(jsonResp);
    } else {
      throw Exception('Failed to create role.');
    }
  }
}
