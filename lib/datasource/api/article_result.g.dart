// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleResult _$ArticleResultFromJson(Map<String, dynamic> json) {
  return ArticleResult(
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : Article.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['page'] == null
        ? null
        : Page.fromJson(json['page'] as Map<String, dynamic>),
    json['time'] == null ? null : DateTime.parse(json['time'] as String),
  );
}

Map<String, dynamic> _$ArticleResultToJson(ArticleResult instance) =>
    <String, dynamic>{
      'list': instance.list,
      'page': instance.pageData,
      'time': instance.time?.toIso8601String(),
    };
