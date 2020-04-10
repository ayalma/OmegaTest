import 'package:flutter/material.dart';
import 'package:omega_evaluation_project/datasource/api/article.dart';
import 'package:omega_evaluation_project/datasource/api/article_data_source.dart';
import 'package:omega_evaluation_project/ui/widgets/pagination.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ArticleDataSource articleDataSource;

  @override
  void didChangeDependencies() {
    if (articleDataSource == null) {
      articleDataSource = Provider.of<ArticleDataSource>(context);
      articleDataSource.loadInitial(null);
      if (articleDataSource.items.length != 0) {
        WidgetsBinding.instance.addPostFrameCallback((duration) {
          showDialog(
              context: context,
              builder: (context) => ArticleDialog(
                    articleDataSource: articleDataSource,
                  ));
        });
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('بازار روز'),),
      body: Center(
        child: Text("خوش امدید..."),
      ),
    );
  }
}

class ArticleDialog extends StatelessWidget {
  final ArticleDataSource articleDataSource;
  const ArticleDialog({Key key, this.articleDataSource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 50,
            child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              overflow: Overflow.visible,
              children: [
                Positioned(
                  top: -20,
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                      color: Theme.of(context).accentColor,
                    ),
                    child: Center(
                      child: Text(
                        "اطلاعیه",
                        style: Theme.of(context).textTheme.title.copyWith(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Pagination<Article>(
                stream: articleDataSource.items,
                onLoadMore: () => articleDataSource.loadAfter(null),
                onRefresh: () => articleDataSource.loadInitial(null),
                onRetry: () => articleDataSource.loadInitial(null),
                onWidgetBuilder: (article) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(article.content ?? ''),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24.0),
                        child: Divider(),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Divider(),
          FlatButton(
            textColor: Colors.redAccent,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'بستن',
            ),
          ),
        ],
      ),
    );
  }
}
