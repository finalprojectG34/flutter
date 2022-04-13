part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();
}

class ItemLoad extends ItemEvent {

  final String categoryName;
  const ItemLoad({this.categoryName});

  @override
  List<Object> get props => [];
}

class ItemCreate extends ItemEvent {
  final Item item;

  const ItemCreate(this.item);

  @override
  List<Object> get props => [item];

  @override
  String toString() => 'Item Created {item: $item}';
}

class ItemUpdate extends ItemEvent {
  final Item item;

  const ItemUpdate(this.item);

  @override
  List<Object> get props => [item];

  @override
  String toString() => 'Item Updated {item: $item}';
}

class ItemDelete extends ItemEvent {
  final Item item;

  const ItemDelete(this.item);

  @override
  List<Object> get props => [item];

  @override
  toString() => 'Item Deleted {item: $item}';
}
