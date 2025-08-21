import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/categories/categories_model.dart';
import 'categories_event.dart';
import 'categories_state.dart';


class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<LoadCategories>((event, emit) {
      final categories = [
        CategoryModel('All', 'assets/images/all.png'),
        CategoryModel('Men', 'assets/images/men.png'),
        CategoryModel('Women', 'assets/images/women.png'),
        CategoryModel('Kids', 'assets/images/kids.png'),
        CategoryModel('Roadster', 'assets/images/Roadster.png'),
      ];
      emit(CategoryLoaded(categories));
    });
  }
}
