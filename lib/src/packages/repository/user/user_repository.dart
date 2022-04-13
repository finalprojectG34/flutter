import 'package:sms/src/packages/data_provider/user/user_data.dart';

import 'package:sms/src/app.dart';

class UserRepository {
  final UserDataProvider dataProvider;
  UserRepository({this.dataProvider});

  Future<User> createUser(User user) async {
    return await dataProvider.createUser(user);
  }

  Future<User> getUser(String id) async {
    return await dataProvider.getUser(id);
  }

  Future<List<User>> getUsers() async {
    return await dataProvider.getUsers();
  }

  Future<User> updateUser(User user) async {
    return await dataProvider.updateUser(user);
  }

  Future<void> deleteUsers(String id) async {
    return await dataProvider.deleteUser(id);
  }
}
