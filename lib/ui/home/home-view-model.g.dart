// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home-view-model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on HomeViewModelBase, Store {
  final _$modelAtom = Atom(name: 'HomeViewModelBase.model');

  @override
  NewsModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(NewsModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  final _$articlesAtom = Atom(name: 'HomeViewModelBase.articles');

  @override
  List<Article> get articles {
    _$articlesAtom.reportRead();
    return super.articles;
  }

  @override
  set articles(List<Article> value) {
    _$articlesAtom.reportWrite(value, super.articles, () {
      super.articles = value;
    });
  }

  final _$sourcesAtom = Atom(name: 'HomeViewModelBase.sources');

  @override
  String get sources {
    _$sourcesAtom.reportRead();
    return super.sources;
  }

  @override
  set sources(String value) {
    _$sourcesAtom.reportWrite(value, super.sources, () {
      super.sources = value;
    });
  }

  final _$sourcesModelAtom = Atom(name: 'HomeViewModelBase.sourcesModel');

  @override
  List<ItemModel> get sourcesModel {
    _$sourcesModelAtom.reportRead();
    return super.sourcesModel;
  }

  @override
  set sourcesModel(List<ItemModel> value) {
    _$sourcesModelAtom.reportWrite(value, super.sourcesModel, () {
      super.sourcesModel = value;
    });
  }

  final _$enablePullupAtom = Atom(name: 'HomeViewModelBase.enablePullup');

  @override
  bool get enablePullup {
    _$enablePullupAtom.reportRead();
    return super.enablePullup;
  }

  @override
  set enablePullup(bool value) {
    _$enablePullupAtom.reportWrite(value, super.enablePullup, () {
      super.enablePullup = value;
    });
  }

  final _$mapAtom = Atom(name: 'HomeViewModelBase.map');

  @override
  Map<String, dynamic> get map {
    _$mapAtom.reportRead();
    return super.map;
  }

  @override
  set map(Map<String, dynamic> value) {
    _$mapAtom.reportWrite(value, super.map, () {
      super.map = value;
    });
  }

  final _$stateAtom = Atom(name: 'HomeViewModelBase.state');

  @override
  UiStates get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(UiStates value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$countryAtom = Atom(name: 'HomeViewModelBase.country');

  @override
  ItemModel get country {
    _$countryAtom.reportRead();
    return super.country;
  }

  @override
  set country(ItemModel value) {
    _$countryAtom.reportWrite(value, super.country, () {
      super.country = value;
    });
  }

  final _$pageAtom = Atom(name: 'HomeViewModelBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$pageSizeAtom = Atom(name: 'HomeViewModelBase.pageSize');

  @override
  int get pageSize {
    _$pageSizeAtom.reportRead();
    return super.pageSize;
  }

  @override
  set pageSize(int value) {
    _$pageSizeAtom.reportWrite(value, super.pageSize, () {
      super.pageSize = value;
    });
  }

  final _$exceptionAtom = Atom(name: 'HomeViewModelBase.exception');

  @override
  Exception get exception {
    _$exceptionAtom.reportRead();
    return super.exception;
  }

  @override
  set exception(Exception value) {
    _$exceptionAtom.reportWrite(value, super.exception, () {
      super.exception = value;
    });
  }

  final _$sortByAtom = Atom(name: 'HomeViewModelBase.sortBy');

  @override
  String get sortBy {
    _$sortByAtom.reportRead();
    return super.sortBy;
  }

  @override
  set sortBy(String value) {
    _$sortByAtom.reportWrite(value, super.sortBy, () {
      super.sortBy = value;
    });
  }

  final _$getDataAsyncAction = AsyncAction('HomeViewModelBase.getData');

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  final _$getMoreDataAsyncAction = AsyncAction('HomeViewModelBase.getMoreData');

  @override
  Future<void> getMoreData() {
    return _$getMoreDataAsyncAction.run(() => super.getMoreData());
  }

  final _$HomeViewModelBaseActionController =
      ActionController(name: 'HomeViewModelBase');

  @override
  void updateCountry(ItemModel val) {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.updateCountry');
    try {
      return super.updateCountry(val);
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSources(Map<String, dynamic> map) {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.updateSources');
    try {
      return super.updateSources(map);
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
articles: ${articles},
sources: ${sources},
sourcesModel: ${sourcesModel},
enablePullup: ${enablePullup},
map: ${map},
state: ${state},
country: ${country},
page: ${page},
pageSize: ${pageSize},
exception: ${exception},
sortBy: ${sortBy}
    ''';
  }
}
