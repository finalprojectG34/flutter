import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable{
  const NavigationEvent();
}

enum Routes{
   home,
   category,
   profile,
   admin,
   newProducts,
}


class Navigated extends NavigationEvent{
  final Routes routes;
  Navigated(this.routes);

  @override
  // TODO: implement props
  List<Object> get props => [routes];

}