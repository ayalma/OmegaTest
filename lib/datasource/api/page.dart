import 'package:json_annotation/json_annotation.dart';

part 'page.g.dart';
@JsonSerializable()
class Page {
  @JsonKey(name: 'CurrentPageNumber')
  final int currentPageNumber;
  @JsonKey(name: 'TotalItemNumber')
  final int totalItemNumber;
  @JsonKey(name: 'ItemPerPage')
  final int itemPerPage;
  @JsonKey(name: 'EndPageNumber')
  final int endPageNumber;
  @JsonKey(name: 'PrePageNumber')
  final int prePageNumber;
  @JsonKey(name: 'NextPageNumber')
  final int nextPageNumber;

  Page(this.currentPageNumber, this.totalItemNumber, this.itemPerPage,
      this.endPageNumber, this.prePageNumber, this.nextPageNumber);

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
  Map<String, dynamic> toJson() => _$PageToJson(this);
}
