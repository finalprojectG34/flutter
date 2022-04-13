part of 'role_bloc.dart';

class RoleState extends Equatable {
  const RoleState();
  @override
  List<Object> get props => [];
}

class RoleLoading extends RoleState {}

class RoleLoadSuccess extends RoleState {
  final List<Role> categories;

  RoleLoadSuccess(this.categories);

  @override
  List<Object> get props => [categories];
}

class CategoriesLoadSuccess extends RoleState {
  final List<Role> categories;

  CategoriesLoadSuccess([this.categories = const []]);

  @override
  List<Object> get props => [categories];
}

class RoleOperationFailure extends RoleState {}
