import 'package:bloc/bloc.dart';
import 'package:sms/src/bloc/navigation/NavigationEvent.dart';

class NavigationBloc extends Bloc<NavigationEvent,Routes>{

  NavigationBloc():super(Routes.home);
  @override
  Stream<Routes> mapEventToState(NavigationEvent event)async* {
    yield (event as Navigated).routes;
  }

}