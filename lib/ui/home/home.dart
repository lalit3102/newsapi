import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:squareboatlalit/model/item-model.dart';
import 'package:squareboatlalit/model/uiStates.dart';
import 'package:squareboatlalit/ui/article-detailed/article-detailed.dart';
import 'package:squareboatlalit/ui/components/article-card.dart';
import 'package:squareboatlalit/ui/components/bottom-sheet/location-botton-sheet.dart';
import 'package:squareboatlalit/ui/components/bottom-sheet/sources-bottom-sheet.dart';
import 'package:squareboatlalit/ui/components/empty-screen.dart';
import 'package:squareboatlalit/ui/components/errorScreen.dart';
import 'package:squareboatlalit/ui/components/loading-screen.dart';
import 'package:squareboatlalit/ui/home/home-view-model.dart';
import 'package:squareboatlalit/ui/search/search-page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeViewModel _model = HomeViewModel();

  @override
  void initState() {
    super.initState();
    _model.init();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("News"),
          actions: [_locationButton(), SizedBox(width: 4), _search()],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var val = await showFilterSheet();
            _model.updateSources(val);
          },
          child: Icon(Icons.filter_alt_sharp),
        ),
        body: _getBody(context),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    if (_model.state == UiStates.LOADING || _model.state == UiStates.NONE) {
      return LoadingScreen();
    }
    if (_model.state == UiStates.EMPTY) {
      return EmptyScreen();
    }
    if (_model.state == UiStates.SUCCESS) {
      return SmartRefresher(
        controller: _model.refreshController,
        enablePullDown: false,
        enablePullUp: _model.enablePullup,
        onLoading: () {
          _model.getMoreData();
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                height: 68,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Top Headlines",
                        style: Theme.of(context).textTheme.subtitle1),
                    Row(
                      children: [
                        Text("Sort By: ",
                            style: Theme.of(context).textTheme.bodyText1),
                        ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: _model.sortBy,
                              items: _model.sort
                                  .map(
                                    (e) => DropdownMenuItem(
                                      child: Text(e.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      value: e.val,
                                    ),
                                  )
                                  .toList(),
                              onChanged: (String value) {
                                _model.updateSortBy(value);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(ArticleDetailed(_model.articles[index]));
                  },
                  child: ArticleCard(_model.articles[index]),
                );
              },
              childCount: _model.articles?.length ?? 0,
            ))
          ],
        ),
      );
    }
    return ErrorScreen(onTap: () {
      _model.init();
    });
  }

  Widget _search() {
    return IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          showSearch(context: context, delegate: SearchPage(_model.articles));
        });
  }

  Widget _locationButton() {
    return FlatButton(
        onPressed: () async {
          var val = await showLocationSheet();
          _model.updateCountry(val);
        },
        child: Row(
          children: [
            Icon(
              Icons.location_on,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            Text(
              _model.country.name,
              style:
                  TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
            ),
          ],
        ));
  }

  Future<ItemModel> showLocationSheet() async {
    var val = await Get.bottomSheet(
        LocationBottomSheet(initalModel: _model.country),
        backgroundColor: Colors.white,
        enableDrag: false,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))));
    return val;
  }

  Future<Map<String, dynamic>> showFilterSheet() async {
    var val = await Get.bottomSheet(
        SourcesBottomSheet(initialModel: _model.sourcesModel),
        backgroundColor: Colors.white,
        enableDrag: false,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))));
    return val;
  }
}
