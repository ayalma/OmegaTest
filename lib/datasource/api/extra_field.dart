import 'package:json_annotation/json_annotation.dart';

part 'extra_field.g.dart';
@JsonSerializable()
class ExtraField {
  @JsonKey(name: 'ExtraFieldId')
  final int extraFieldId;
  @JsonKey(name: 'FieldValue')
  final String fieldValue;
  ExtraField(this.extraFieldId, this.fieldValue);

  factory ExtraField.fromJson(Map<String, dynamic> json) =>
      _$ExtraFieldFromJson(json);
  Map<String, dynamic> toJson() => _$ExtraFieldToJson(this);
}
