import 'package:mobx/mobx.dart';

import '../../../domain/domain.dart';

part 'home_state.g.dart';

class HomeStateMobx = HomeState with _$HomeStateMobx;

abstract class HomeState with Store {
  final JokeCategoriesUsecase _jokeCategoriesUsecaseImpl;
  final JokeByCategoryUsecase _jokeByCategoryUsecaseImpl;

  HomeState(
    this._jokeCategoriesUsecaseImpl,
    this._jokeByCategoryUsecaseImpl,
  ) {
    getJokeCategories();
    getJokeByCategory();
  }

  @observable
  int selectedCategoryIndex = 0;

  @observable
  ObservableList<CategoryEntity> listOfCategories =
      ObservableList<CategoryEntity>();

  @observable
  JokeEntity jokeByCategory = JokeEntity.empty();

  @observable
  CategoryEntity categorySelected = CategoryEntity.empty();

  @action
  void selectCategory(int index) {
    selectedCategoryIndex = index;
    getSelectCategory();
  }

  @action
  void getSelectCategory() {
    categorySelected = listOfCategories.elementAt(selectedCategoryIndex);
    getJokeByCategory();
  }

  /// Get a list of categories from the JokeCategoriesUsecase.
  @action
  Future<void> getJokeCategories() async {
    final result = await _jokeCategoriesUsecaseImpl.getCategories();

    result.fold(
      (failure) {},
      (success) {
        listOfCategories = ObservableList.of(success);
      },
    );
  }

  /// Get a Joke by Category from the JokeByCategorysUsecase.
  @action
  Future<void> getJokeByCategory() async {
    final result = await _jokeByCategoryUsecaseImpl.getJokeByCategory(
      category: categorySelected.category,
    );

    result.fold(
      (failure) {},
      (success) {
        jokeByCategory = success;
      },
    );
  }
}
