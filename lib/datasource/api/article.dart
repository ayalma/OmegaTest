import 'package:json_annotation/json_annotation.dart';
import 'package:omega_evaluation_project/datasource/api/category.dart';
import 'package:omega_evaluation_project/datasource/api/extra_field.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  @JsonKey(name: 'ArticleId')
  final int articleId;
  @JsonKey(name: 'Title')
  final String title;
  @JsonKey(name: 'Content')
  final String content;
  @JsonKey(name: 'Description')
  final String description;
  @JsonKey(name: 'Url')
  final String url;
  @JsonKey(name: 'UserDisplayName')
  final String userDisplayName;
  @JsonKey(name: 'ShortDescriptionLenght')
  final int shortDescriptionLenght;
  @JsonKey(name: 'ShortTitleLenght')
  final int shortTitleLenght;
  @JsonKey(name: 'PublishDate')
  final DateTime publishDate;
  @JsonKey(name: 'CreateDate')
  final DateTime createDate;
  @JsonKey(name: 'ApprovedDate')
  final DateTime approvedDate;
  @JsonKey(name: 'ExpireDate')
  final DateTime expireDate;
  @JsonKey(name: 'UpdateDate')
  final DateTime updateDate;
  @JsonKey(name: 'LastViewDate')
  final DateTime lastViewDate;
  @JsonKey(name: 'ShamsiPublishDate')
  final String shamsiPublishDate;
  @JsonKey(name: 'ShamsiCreateDate')
  final String shamsiCreateDate;
  @JsonKey(name: 'ShamsiApprovedDate')
  final String shamsiApprovedDate;
  @JsonKey(name: 'ShamsiExpireDate')
  final String shamsiExpireDate;
  @JsonKey(name: 'ShamsiUpdateDate')
  final String shamsiUpdateDate;
  @JsonKey(name: 'ShamsiLastViewDate')
  final String shamsiLastViewDate;
  @JsonKey(name: 'CreateByUser')
  final String createByUser;
  @JsonKey(name: 'ApprovedByUser')
  final String approvedByUser;
  @JsonKey(name: 'ExtraFieldValues')
  final List<ExtraField> extraFieldValues;
  @JsonKey(name: 'RelatedUrl')
  final String relatedUrl;
  @JsonKey(name: 'Category')
  final Category category;
  @JsonKey(name: 'CategoryName')
  final String categoryName;
  @JsonKey(name: 'ImageUrl')
  final String imageUrl;
  @JsonKey(name: 'VoteTotal')
  final int voteTotal;
  @JsonKey(name: 'VoteNumber')
  final int voteNumber;
  @JsonKey(name: 'PoId')
  final int poId;
  @JsonKey(name: 'PortalId')
  final String portalId;

  Article(
      this.articleId,
      this.title,
      this.content,
      this.description,
      this.url,
      this.userDisplayName,
      this.shortDescriptionLenght,
      this.shortTitleLenght,
      this.publishDate,
      this.createDate,
      this.approvedDate,
      this.expireDate,
      this.updateDate,
      this.lastViewDate,
      this.shamsiPublishDate,
      this.shamsiCreateDate,
      this.shamsiApprovedDate,
      this.shamsiExpireDate,
      this.shamsiUpdateDate,
      this.shamsiLastViewDate,
      this.createByUser,
      this.approvedByUser,
      this.extraFieldValues,
      this.relatedUrl,
      this.category,
      this.categoryName,
      this.imageUrl,
      this.voteTotal,
      this.voteNumber,
      this.poId,
      this.portalId);

  bool get showAble {
    var now = DateTime.now();
    return now.compareTo(createDate) > 0 && now.compareTo(expireDate) < 0;
  }

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
