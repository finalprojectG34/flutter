import 'package:meta/meta.dart';
import 'package:sms/src/packages/data_provider/data_provider.dart';
import 'package:sms/src/models/models.dart';

class RoleRepository {
  final RoleDataProvider dataProvider;

  RoleRepository({@required this.dataProvider}) : assert(dataProvider != null);

  Future<Role> createRole(Role role) async {
    return await dataProvider.createRole(role);
  }

  Future<List<Role>> getRoles() async {
    return await dataProvider.getRoles();
  }

  Future<void> updateRole(Role role) async {
    await dataProvider.updateRole(role);
  }

  Future<void> deleteRole(String id) async {
    await dataProvider.deleteRole(id);
  }
}
