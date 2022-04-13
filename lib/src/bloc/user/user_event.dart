part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UsersLoad extends UserEvent {
  const UsersLoad();

  @override
  List<Object> get props => [];
}

class UserLoad extends UserEvent {
  final String id;

  const UserLoad(this.id);

  @override
  List<Object> get props => [id];
}

class UserCreate extends UserEvent {
  final User user;

  const UserCreate(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Created {user: $user}';
}

class UserUpdate extends UserEvent {
  final User user;

  const UserUpdate(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Updated {user: $user}';
}

class UserDelete extends UserEvent {
  final User user;

  const UserDelete(this.user);

  @override
  List<Object> get props => [user];

  @override
  toString() => 'User Deleted {user: $user}';
}
