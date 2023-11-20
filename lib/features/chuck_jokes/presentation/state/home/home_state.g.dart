// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStateMobx on HomeState, Store {
  late final _$selectedCategoryIndexAtom =
      Atom(name: 'HomeState.selectedCategoryIndex', context: context);

  @override
  int get selectedCategoryIndex {
    _$selectedCategoryIndexAtom.reportRead();
    return super.selectedCategoryIndex;
  }

  @override
  set selectedCategoryIndex(int value) {
    _$selectedCategoryIndexAtom.reportWrite(value, super.selectedCategoryIndex,
        () {
      super.selectedCategoryIndex = value;
    });
  }

  late final _$listOfCategoriesAtom =
      Atom(name: 'HomeState.listOfCategories', context: context);

  @override
  ObservableList<CategoryEntity> get listOfCategories {
    _$listOfCategoriesAtom.reportRead();
    return super.listOfCategories;
  }

  @override
  set listOfCategories(ObservableList<CategoryEntity> value) {
    _$listOfCategoriesAtom.reportWrite(value, super.listOfCategories, () {
      super.listOfCategories = value;
    });
  }

  late final _$jokeByCategoryAtom =
      Atom(name: 'HomeState.jokeByCategory', context: context);

  @override
  JokeEntity get jokeByCategory {
    _$jokeByCategoryAtom.reportRead();
    return super.jokeByCategory;
  }

  @override
  set jokeByCategory(JokeEntity value) {
    _$jokeByCategoryAtom.reportWrite(value, super.jokeByCategory, () {
      super.jokeByCategory = value;
    });
  }

  late final _$categorySelectedAtom =
      Atom(name: 'HomeState.categorySelected', context: context);

  @override
  CategoryEntity get categorySelected {
    _$categorySelectedAtom.reportRead();
    return super.categorySelected;
  }

  @override
  set categorySelected(CategoryEntity value) {
    _$categorySelectedAtom.reportWrite(value, super.categorySelected, () {
      super.categorySelected = value;
    });
  }

  late final _$getJokeCategoriesAsyncAction =
      AsyncAction('HomeState.getJokeCategories', context: context);

  @override
  Future<void> getJokeCategories() {
    return _$getJokeCategoriesAsyncAction.run(() => super.getJokeCategories());
  }

  late final _$getJokeByCategoryAsyncAction =
      AsyncAction('HomeState.getJokeByCategory', context: context);

  @override
  Future<void> getJokeByCategory() {
    return _$getJokeByCategoryAsyncAction.run(() => super.getJokeByCategory());
  }

  late final _$HomeStateActionController =
      ActionController(name: 'HomeState', context: context);

  @override
  void selectCategory(int index) {
    final _$actionInfo = _$HomeStateActionController.startAction(
        name: 'HomeState.selectCategory');
    try {
      return super.selectCategory(index);
    } finally {
      _$HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getSelectCategory() {
    final _$actionInfo = _$HomeStateActionController.startAction(
        name: 'HomeState.getSelectCategory');
    try {
      return super.getSelectCategory();
    } finally {
      _$HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCategoryIndex: ${selectedCategoryIndex},
listOfCategories: ${listOfCategories},
jokeByCategory: ${jokeByCategory},
categorySelected: ${categorySelected}
    ''';
  }
}
