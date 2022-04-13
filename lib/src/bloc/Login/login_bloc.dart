import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/bloc/Auth/auth_bloc.dart';
import 'package:sms/src/packages/repository/auth/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter_login/login/login.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc _authenticationBloc;
  LoginBloc({
    @required AuthenticationRepository authenticationRepository,AuthenticationBloc authenticationBloc
  })  : assert(authenticationRepository != null),
        _authenticationRepository = authenticationRepository,
       _authenticationBloc=authenticationBloc,
        super(LoginUnknown());

  final AuthenticationRepository _authenticationRepository;

  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event,
      ) async* {
     if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event, state);
    }
  }





  Stream<LoginState> _mapLoginSubmittedToState(
      LoginSubmitted event,
      LoginState state,
      ) async* {

    {
      yield LoginLoading();
      try {
       User user= await _authenticationRepository.Login(
          // AuthInfo(info:event.authInfo.info, info_type: "email", password: null)
         event.authInfo
        );
        yield LoginSuccessful(user: user);
        _authenticationBloc.add(AuthenticationStatusChanged(status: AuthenticationStatus.authenticated,user: user));
      } on Exception catch (_) {
        yield LoginFailure();
      }
    }
  }
}
