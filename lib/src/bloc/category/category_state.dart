part of 'category_bloc.dart';

class CategoryState extends Equatable {
  const CategoryState();
  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {}

class CategoryLoadSuccess extends CategoryState {
  final List<Category> categories;

  CategoryLoadSuccess(this.categories);

  @override
  List<Object> get props => [categories];
}

class CategoriesLoadSuccess extends CategoryState {
  final List<Category> categories;

  CategoriesLoadSuccess([this.categories = const []]);

  @override
  List<Object> get props => [categories];
}

class CategoryOperationFailure extends CategoryState {}
