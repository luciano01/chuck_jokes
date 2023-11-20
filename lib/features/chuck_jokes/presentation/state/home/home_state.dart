import 'package:mobx/mobx.dart';

import '../../../domain/domain.dart';

part 'home_state.g.dart';

class HomeStateMobx = HomeState with _$HomeStateMobx;

abstract class HomeState with Store {
  final JokeCategoriesUsecase _jokeCategoriesUsecaseImpl;

  HomeState(this._jokeCategoriesUsecaseImpl) {
    getJokeCategories();
  }

  @observable
  int selectedCategoryIndex = 0;

  @observable
  ObservableList<CategoryEntity> listOfCategories =
      ObservableList<CategoryEntity>();

  @action
  void selectCategory(int index) {
    selectedCategoryIndex = index;
  }

  @action
  void getSelectCategory() {
    final category = listOfCategories.elementAt(selectedCategoryIndex);
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
}
