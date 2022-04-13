import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms/src/packages/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:sms/src/models/models.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({@required this.categoryRepository})
      : assert(categoryRepository != null),
        super(CategoryLoading());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is CategoryLoad) {
      yield CategoryLoading();
      try {
        final item = await categoryRepository.getCategory();
        yield CategoryLoadSuccess(item);
      } catch (_) {
        yield CategoryOperationFailure();
      }
    }

    if (event is CategoryCreate) {
      try {
        final category =
            await categoryRepository.createCategory(event.category);
        print(category);
        // yield CategoriesLoadSuccess(category);
      } catch (_) {
        yield CategoryOperationFailure();
      }
    }

    if (event is CategoryUpdate) {
      try {
        await categoryRepository.updateCategory(event.category);
        final item = await categoryRepository.getCategory();
        yield CategoryLoadSuccess(item);
      } catch (_) {
        yield CategoryOperationFailure();
      }
    }

    if (event is CategoryDelete) {
      try {
        await categoryRepository.deleteCategory(event.id);
        final categories = await categoryRepository.getCategory();
        yield CategoryLoadSuccess(categories);
      } catch (_) {
        yield CategoryOperationFailure();
      }
    }
  }
}
