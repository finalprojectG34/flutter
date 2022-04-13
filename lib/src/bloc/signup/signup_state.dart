

import 'package:equatable/equatable.dart';

import '../../app.dart';

abstract class SignupState extends Equatable {
  const SignupState();


  @override
  List<Object> get props => [];
}
class SignupLoading extends SignupState{}
class SignupSuccessful extends SignupState{
  final User user;
  SignupSuccessful({this.user});

  @override
  // TODO: implement props
  List<Object> get props => [user];
}
class SignupFailure extends SignupState{}

class SignupUnknown extends SignupState{}