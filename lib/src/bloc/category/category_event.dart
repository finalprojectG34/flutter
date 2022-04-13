part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class CategoryLoad extends CategoryEvent {
  const CategoryLoad();

  @override
  List<Object> get props => [];
}

class CategoryCreate extends CategoryEvent {
  final Category category;

  const CategoryCreate(this.category);

  @override
  List<Object> get props => [category];

  @override
  String toString() => 'Category Created {category: $category}';
}

class CategoryUpdate extends CategoryEvent {
  final Category category;

  const CategoryUpdate(this.category);

  @override
  List<Object> get props => [category];

  @override
  String toString() => 'Category Updated {category: $category}';
}

class CategoryDelete extends CategoryEvent {
  final String id;

  const CategoryDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Category Deleted {category: $id}';
}
