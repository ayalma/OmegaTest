import 'package:json_annotation/json_annotation.dart';
import 'package:omega_evaluation_project/commons/datasource.dart';
import 'package:omega_evaluation_project/datasource/api/article.dart';
import 'package:omega_evaluation_project/datasource/api/page.dart';

part 'article_result.g.dart';

@JsonSerializable()
class ArticleResult extends IPagedResult<Article> {
  final List<Article> list;
  @JsonKey(name: 'page')
  final Page pageData;
  final DateTime time;
  ArticleResult(this.list, this.pageData, this.time);

  factory ArticleResult.fromJson(Map<String, dynamic> json) =>
      _$ArticleResultFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleResultToJson(this);

  @override
  List<Article> get data => list;

  @override
  int get totalPage =>
      (pageData.totalItemNumber / pageData.itemPerPage).round();

  @override
  int get page => pageData.currentPageNumber;

  bool get showAble => list.any((article) => article.showAble);
}
