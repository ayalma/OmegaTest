import 'package:omega_evaluation_project/commons/datasource.dart';
import 'package:omega_evaluation_project/datasource/api/article.dart';
import 'package:omega_evaluation_project/datasource/api/article_api.dart';
import 'package:omega_evaluation_project/datasource/api/article_result.dart';

///
///به دلیل وجود پیجینگ در دیتای بازگشتی من این روش را انتحاب کردم ولی متد شما دیتای ورودی برای انتخاب پیج را قبول نمیکند
///و در صورت فراهم کردن دیتا خطا میدهد
///
class ArticleDataSource extends DataSource<void, Article, ArticleResult> {
  final ArticleApi _articleApi;

  ArticleDataSource(this._articleApi);

  @override
  Future<ArticleResult> load(_) {
    var temp = currentPage; // we access to current page from parent
    return _articleApi.loadArticle(2766); // i pass default ok page
  }
}
