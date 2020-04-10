import 'package:omega_evaluation_project/datasource/api/article_result.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart' hide Headers;

part 'article_api.g.dart';

@RestApi()
abstract class ArticleApi {
  factory ArticleApi(Dio dio) = _ArticleApi;
  @GET('/Article/GetList/{page}')
  Future<ArticleResult> loadArticle(@Path('page') int page);
}
