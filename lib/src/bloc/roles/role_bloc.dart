import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms/src/packages/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:sms/src/models/models.dart';

part 'role_event.dart';
part 'role_state.dart';

class RoleBloc extends Bloc<RoleEvent, RoleState> {
  final RoleRepository roleRepository;

  RoleBloc({@required this.roleRepository})
      : assert(roleRepository != null),
        super(RoleLoading());

  @override
  Stream<RoleState> mapEventToState(RoleEvent event) async* {
    if (event is RoleLoad) {
      yield RoleLoading();
      try {
        final item = await roleRepository.getRoles();
        yield RoleLoadSuccess(item);
      } catch (_) {
        yield RoleOperationFailure();
      }
    }

    if (event is RoleCreate) {
      try {
        final role =
            await roleRepository.createRole(event.role);
        print(role);
        // yield CategoriesLoadSuccess(role);
      } catch (_) {
        yield RoleOperationFailure();
      }
    }

    if (event is RoleUpdate) {
      try {
        await roleRepository.updateRole(event.role);
        final item = await roleRepository.getRoles();
        yield RoleLoadSuccess(item);
      } catch (_) {
        yield RoleOperationFailure();
      }
    }

    if (event is RoleDelete) {
      try {
        await roleRepository.deleteRole(event.id);
        final categories = await roleRepository.getRoles();
        yield RoleLoadSuccess(categories);
      } catch (_) {
        yield RoleOperationFailure();
      }
    }
  }
}
