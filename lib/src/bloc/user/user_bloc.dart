import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms/src/packages/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:sms/src/models/models.dart';
import 'package:sms/src/utils/loger/console_loger.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(UserLoading());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UsersLoad) {
      yield UserLoading();
      try {
        final users = await userRepository.getUsers();
        logTrace("emptyh",users);
        yield UsersLoadSuccess(users);
      } catch (e) {
        logTrace("usr err", e);
        yield UserOperationFailure();
      }
    }



    if (event is UserCreate) {
      try {
        final user = await userRepository.createUser(event.user);

        yield UserLoadSuccess(user);
      } catch (e) {
        yield UserOperationFailure();
      }
    }

    if (event is UserUpdate) {
      try {
        final user = await userRepository.updateUser(event.user);
        yield UserLoadSuccess(user);
      } catch (_) {
        yield UserOperationFailure();
      }
    }

    if (event is UserDelete) {
      try {
        await userRepository.deleteUsers(event.user.id);

        yield UserLoadSuccess(null);
      } catch (_) {
        yield UserOperationFailure();
      }
    }
  }
}
