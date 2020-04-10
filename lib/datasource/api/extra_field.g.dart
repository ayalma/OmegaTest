// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtraField _$ExtraFieldFromJson(Map<String, dynamic> json) {
  return ExtraField(
    json['ExtraFieldId'] as int,
    json['FieldValue'] as String,
  );
}

Map<String, dynamic> _$ExtraFieldToJson(ExtraField instance) =>
    <String, dynamic>{
      'ExtraFieldId': instance.extraFieldId,
      'FieldValue': instance.fieldValue,
    };
