import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/packages/repository/auth/auth_repository.dart';
import 'package:sms/src/packages/repository/user/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {

  AuthenticationBloc({ @required AuthenticationRepository authenticationRepository, @required UserRepository userRepository,})
      : assert(authenticationRepository != null), assert(userRepository != null),
        _authenticationRepository = authenticationRepository, _userRepository = userRepository, super(const AuthenticationState.unknown()) {

    // _authenticationStatusSubscription = _authenticationRepository.status.listen((status) => add(AuthenticationStatusChanged(status: status)),);
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  // StreamSubscription<AuthenticationStatus> _authenticationStatusSubscription;

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event,) async* {
    if (event is AuthenticationStatusChanged) {
      yield* _mapAuthStatusChangedToState(event);
    }
    if (event is AuthenticationLogoutRequested) {
     await _authenticationRepository.removePersistedUser();
     yield AuthenticationState.unauthenticated();

    }
  }

  @override
  Future<void> close() {
    // _authenticationStatusSubscription?.cancel();
    // _authenticationRepository.dispose();
    return super.close();
  }

  Stream<AuthenticationState> _mapAuthStatusChangedToState(AuthenticationStatusChanged event,) async* {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        yield AuthenticationState.unauthenticated();
        break;
      case AuthenticationStatus.authenticated:
        // final user = await _tryGetUser();
        _authenticationRepository.persistToken(event.user);
        yield AuthenticationState.authenticated(event.user);

        break;
      // AuthenticationStatus.unknown
      default:

        User user=await _authenticationRepository.getPersistedUser();
        if(user!=null){
          yield AuthenticationState.authenticated(user);
        }else{
          yield AuthenticationState.unknown();

        }


    }
  }

  // Future<User> _tryGetUser() async {
  //   try {
  //     final user = await _userRepository.getUser("");
  //     return user;
  //   } on Exception {
  //     return null;
  //   }
  // }
}
