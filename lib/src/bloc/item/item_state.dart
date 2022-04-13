part of 'item_bloc.dart';

class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemLoading extends ItemState {}

class ItemsLoadSuccess extends ItemState {
  final List<Item> items;
  final bool hasReachedMax;

  ItemsLoadSuccess(this.hasReachedMax,[this.items = const []]);

  ItemsLoadSuccess copyWith({List<Item> item,bool hasReachedMax}){
    return ItemsLoadSuccess(
      hasReachedMax??this.hasReachedMax,
     item??this.items
      );
   }


  @override
  List<Object> get props => [items];
}

class ItemOperationFailure extends ItemState {}
