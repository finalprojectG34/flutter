import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sms/src/app.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final AuthDataProvider dataProvider;

  AuthenticationRepository({@required this.dataProvider}) : assert(dataProvider != null);

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<User> Login(AuthInfo info) async {
    return await dataProvider.Login(info);
  }

  Future<User> Signup(User info) async {
    return await dataProvider.Signup(info);
  }


  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();

  //======================  -- from article ===========
  // Future<String> authenticate({
  //   @required String username,
  //   @required String password,
  // }) async {
  //   await Future.delayed(Duration(seconds: 1));
  //   return 'token';
  // }
  //
  // Future<void> deleteToken() async {
  //   /// delete from keystore/keychain
  //   await Future.delayed(Duration(seconds: 1));
  //   return;
  // }

  Future<void> persistToken(User user)async {
    /// write to keystore/keychain
   await dataProvider.persistUser(user);
    return;
  }

  Future<User>getPersistedUser()async{
    return await dataProvider.getPersistedUser();
  }
  Future<void>removePersistedUser()async{
    return await dataProvider.removePersistedUser();
  }

  // Future<bool> hasToken() async {
  //   /// read from keystore/keychain
  //   await Future.delayed(Duration(seconds: 1));
  //   return false;
  // }
}
