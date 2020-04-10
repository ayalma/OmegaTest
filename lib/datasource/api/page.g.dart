// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Page _$PageFromJson(Map<String, dynamic> json) {
  return Page(
    json['CurrentPageNumber'] as int,
    json['TotalItemNumber'] as int,
    json['ItemPerPage'] as int,
    json['EndPageNumber'] as int,
    json['PrePageNumber'] as int,
    json['NextPageNumber'] as int,
  );
}

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'CurrentPageNumber': instance.currentPageNumber,
      'TotalItemNumber': instance.totalItemNumber,
      'ItemPerPage': instance.itemPerPage,
      'EndPageNumber': instance.endPageNumber,
      'PrePageNumber': instance.prePageNumber,
      'NextPageNumber': instance.nextPageNumber,
    };
