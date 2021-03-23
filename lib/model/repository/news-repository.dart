import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:squareboatlalit/model/base.dart';
import 'package:squareboatlalit/model/news-model.dart';

class NewsRepository {
  Dio dio =
      Dio(BaseOptions(baseUrl: baseUrl, queryParameters: {"apiKey": apiKey}));

  void _interceptor() {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  }

  /// home screen first api to show feeds
  Future<NewsModel> getFeed(Map<String, dynamic> map) async {
    _interceptor();
    Response response = await dio.get(homeFeedsPath, queryParameters: map);
    NewsModel model = NewsModel.fromJson(response.data);
    return model;
  }
}
