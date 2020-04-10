import 'package:flutter/cupertino.dart';
import 'package:omega_evaluation_project/datasource/api/article_api.dart';
import 'package:omega_evaluation_project/datasource/api/article_data_source.dart';
import 'package:omega_evaluation_project/ui/home.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

import 'home_bloc.dart';

class HomeInjector extends StatelessWidget {
  const HomeInjector({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ProxyProvider<Dio, ArticleApi>(
          update: (_, dio, __) => ArticleApi(dio),
        ),
        ProxyProvider<ArticleApi, HomeBloc>(
          update: (_, articleApi, __) => HomeBloc(),
          dispose: (_, homeBloc) async => await homeBloc.dispose(),
        ),
        ProxyProvider<ArticleApi, ArticleDataSource>(
          update: (_, articleApi, __) => ArticleDataSource(articleApi),
          dispose: (_, articleDataSource) async =>
              await articleDataSource.dispose(),
        ),
      ],
      child: HomeScreen(),
    );
  }
}
