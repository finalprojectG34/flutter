
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sms/src/bloc/signup/signup_event.dart';
import 'package:sms/src/bloc/signup/signup_state.dart';

import '../../models/models.dart';
import '../../packages/repository/repository.dart';
import '../Auth/auth_bloc.dart';
import '../Login/login_bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthenticationBloc _authenticationBloc;
  SignupBloc({
    @required AuthenticationRepository authenticationRepository,AuthenticationBloc authenticationBloc
  })  : assert(authenticationRepository != null),
        _authenticationRepository = authenticationRepository,
        _authenticationBloc=authenticationBloc,
        super(SignupUnknown());

  final AuthenticationRepository _authenticationRepository;

  @override
  Stream<SignupState> mapEventToState(
      SignupEvent event,
      ) async* {
    if (event is SignupSubmitted) {
      yield* _mapLoginSubmittedToState(event, state);
    }
  }





  Stream<SignupState> _mapLoginSubmittedToState(
      SignupSubmitted event,
      SignupState state,
      ) async* {

    {
      yield SignupLoading();
      try {
        User user= await _authenticationRepository.Signup(
          // AuthInfo(info:event.authInfo.info, info_type: "email", password: null)
            event.user
        );
        yield SignupSuccessful(user: user);
        _authenticationBloc.add(AuthenticationStatusChanged(status: AuthenticationStatus.authenticated,user: user));
      } on Exception catch (_) {
        yield SignupFailure();
      }
    }
  }
}
