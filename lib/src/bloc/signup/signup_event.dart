
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

// class LoginUsernameChanged extends LoginEvent {
//   const LoginUsernameChanged(this.username);
//
//   final String username;
//
//   @override
//   List<Object> get props => [username];
// }
//
// class LoginPasswordChanged extends LoginEvent {
//   const LoginPasswordChanged(this.password);
//
//   final String password;
//
//   @override
//   List<Object> get props => [password];
// }

class SignupSubmitted extends SignupEvent {
  final User user;
  const SignupSubmitted({this.user});
}
