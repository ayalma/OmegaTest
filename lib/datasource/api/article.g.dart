// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    json['ArticleId'] as int,
    json['Title'] as String,
    json['Content'] as String,
    json['Description'] as String,
    json['Url'] as String,
    json['UserDisplayName'] as String,
    json['ShortDescriptionLenght'] as int,
    json['ShortTitleLenght'] as int,
    json['PublishDate'] == null
        ? null
        : DateTime.parse(json['PublishDate'] as String),
    json['CreateDate'] == null
        ? null
        : DateTime.parse(json['CreateDate'] as String),
    json['ApprovedDate'] == null
        ? null
        : DateTime.parse(json['ApprovedDate'] as String),
    json['ExpireDate'] == null
        ? null
        : DateTime.parse(json['ExpireDate'] as String),
    json['UpdateDate'] == null
        ? null
        : DateTime.parse(json['UpdateDate'] as String),
    json['LastViewDate'] == null
        ? null
        : DateTime.parse(json['LastViewDate'] as String),
    json['ShamsiPublishDate'] as String,
    json['ShamsiCreateDate'] as String,
    json['ShamsiApprovedDate'] as String,
    json['ShamsiExpireDate'] as String,
    json['ShamsiUpdateDate'] as String,
    json['ShamsiLastViewDate'] as String,
    json['CreateByUser'] as String,
    json['ApprovedByUser'] as String,
    (json['ExtraFieldValues'] as List)
        ?.map((e) =>
            e == null ? null : ExtraField.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['RelatedUrl'] as String,
    json['Category'] == null
        ? null
        : Category.fromJson(json['Category'] as Map<String, dynamic>),
    json['CategoryName'] as String,
    json['ImageUrl'] as String,
    json['VoteTotal'] as int,
    json['VoteNumber'] as int,
    json['PoId'] as int,
    json['PortalId'] as String,
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'ArticleId': instance.articleId,
      'Title': instance.title,
      'Content': instance.content,
      'Description': instance.description,
      'Url': instance.url,
      'UserDisplayName': instance.userDisplayName,
      'ShortDescriptionLenght': instance.shortDescriptionLenght,
      'ShortTitleLenght': instance.shortTitleLenght,
      'PublishDate': instance.publishDate?.toIso8601String(),
      'CreateDate': instance.createDate?.toIso8601String(),
      'ApprovedDate': instance.approvedDate?.toIso8601String(),
      'ExpireDate': instance.expireDate?.toIso8601String(),
      'UpdateDate': instance.updateDate?.toIso8601String(),
      'LastViewDate': instance.lastViewDate?.toIso8601String(),
      'ShamsiPublishDate': instance.shamsiPublishDate,
      'ShamsiCreateDate': instance.shamsiCreateDate,
      'ShamsiApprovedDate': instance.shamsiApprovedDate,
      'ShamsiExpireDate': instance.shamsiExpireDate,
      'ShamsiUpdateDate': instance.shamsiUpdateDate,
      'ShamsiLastViewDate': instance.shamsiLastViewDate,
      'CreateByUser': instance.createByUser,
      'ApprovedByUser': instance.approvedByUser,
      'ExtraFieldValues': instance.extraFieldValues,
      'RelatedUrl': instance.relatedUrl,
      'Category': instance.category,
      'CategoryName': instance.categoryName,
      'ImageUrl': instance.imageUrl,
      'VoteTotal': instance.voteTotal,
      'VoteNumber': instance.voteNumber,
      'PoId': instance.poId,
      'PortalId': instance.portalId,
    };
