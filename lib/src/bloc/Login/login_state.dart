part of 'login_bloc.dart';


abstract class LoginState extends Equatable {
  const LoginState();


  @override
  List<Object> get props => [];
}
class LoginLoading extends LoginState{}
class LoginSuccessful extends LoginState{
  final User user;
  LoginSuccessful({this.user});

  @override
  // TODO: implement props
  List<Object> get props => [user];
}
class LoginFailure extends LoginState{}

class LoginUnknown extends LoginState{}

