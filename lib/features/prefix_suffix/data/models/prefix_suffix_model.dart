import 'package:freezed_annotation/freezed_annotation.dart';

part 'prefix_suffix_model.freezed.dart';
part 'prefix_suffix_model.g.dart';

@freezed
abstract class PrefixSuffixResponse with _$PrefixSuffixResponse {
  const factory PrefixSuffixResponse({
    @Default(false) bool succeeded,
    String? messages,
    List<PrefixSuffixModel>? data,
  }) = _PrefixSuffixResponse;

  factory PrefixSuffixResponse.fromJson(Map<String, dynamic> json) =>
      _$PrefixSuffixResponseFromJson(json);
}

@freezed
abstract class PrefixSuffixModel with _$PrefixSuffixModel {
  const factory PrefixSuffixModel({
    int? prefixSuffixID,
    int? voucherTypeID,
    int? financialYearID,
    double? startIndex,
    double? updatedIndex,
    String? prefix,
    String? suffix,
    String? narration,
    bool? status,
    int? createdBy,
    String? createdDate,
    String? extra1,
    String? extra2,
  }) = _PrefixSuffixModel;

  factory PrefixSuffixModel.fromJson(Map<String, dynamic> json) =>
      _$PrefixSuffixModelFromJson(json);
}
