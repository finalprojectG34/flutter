part of 'role_bloc.dart';

abstract class RoleEvent extends Equatable {
  const RoleEvent();
}

class RoleLoad extends RoleEvent {
  const RoleLoad();

  @override
  List<Object> get props => [];
}

class RoleCreate extends RoleEvent {
  final Role role;

  const RoleCreate(this.role);

  @override
  List<Object> get props => [role];

  @override
  String toString() => 'Role Created {role: $role}';
}

class RoleUpdate extends RoleEvent {
  final Role role;
  const RoleUpdate(this.role);

  @override
  List<Object> get props => [role];

  @override
  String toString() => 'Role Updated {role: $role}';
}

class RoleDelete extends RoleEvent {
  final String id;

  const RoleDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Role Deleted {role: $id}';
}
