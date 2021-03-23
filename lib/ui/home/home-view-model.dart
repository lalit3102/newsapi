import 'package:mobx/mobx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:squareboatlalit/model/article.dart';
import 'package:squareboatlalit/model/item-model.dart';
import 'package:squareboatlalit/model/news-model.dart';
import 'package:squareboatlalit/model/repository/news-repository.dart';
import 'package:squareboatlalit/model/uiStates.dart';

part 'home-view-model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  NewsRepository _repository = NewsRepository();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @observable
  NewsModel model;

  @observable
  List<Article> articles;

  @observable
  String sources;

  @observable
  List<ItemModel> sourcesModel;
  @observable
  bool enablePullup = true;

  @observable
  Map<String, dynamic> map;

  @observable
  UiStates state = UiStates.NONE;

  @observable
  ItemModel country = ItemModel("India", "in");

  @observable
  int page = 1;

  @observable
  int pageSize = 10;

  @observable
  Exception exception;

  List<ItemModel> sort = [
    ItemModel("Recent", "publishedAt"),
    ItemModel("Popular", "popularity"),
  ];
  @observable
  String sortBy = "publishedAt";

  void init() {
    getData();
  }

  @action
  void updateCountry(ItemModel val) {
    if (val != null) {
      if (val.name != country.name) {
        country = val;
        getData();
      }
    }
  }

  void updateSortBy(String val) {
    print(val);
    sortBy = val;
    print(sortBy);
    getData();
  }

  @action
  void updateSources(Map<String, dynamic> map) {
    if (map != null) {
      sourcesModel = map["model"];
      sources = map["val"];
      getData();
    }
  }
  @action
  Future<void> getData() async {
    try {
      page = 1;
      state = UiStates.LOADING;
      updateQueryParam();
      model = await _repository.getFeed(map);
      articles = model.articles;
      state = UiStates.SUCCESS;
      if (articles.isEmpty) {
        state = UiStates.EMPTY;
      }
    } catch (e) {
      state = UiStates.ERROR;
    }
  }

  @action
  Future<void> getMoreData() async {
    try {
      page = page + 1;
      updateQueryParam();
      enablePullup = false;
      model = await _repository.getFeed(map);
      articles.addAll(model.articles);
      refreshController.loadComplete();
      enablePullup = true;
    } catch (e) {
      refreshController.loadFailed();
      state = UiStates.ERROR;
    }
  }

  void updateQueryParam() {
    map = {
      "pageSize": pageSize,
      "page": page,
      "sortBy":sortBy
    };
    if (sources != null && sources.isNotEmpty) {
      map.addAll({"sources": sources});
    } else {
      map.addAll({"country": country.val});
    }
  }
}
