import 'package:freezed_annotation/freezed_annotation.dart';
import 'kyc_fields_dto.dart';

part 'kyc_status_dto.freezed.dart';
part 'kyc_status_dto.g.dart';

@freezed
class KycStatusDto with _$KycStatusDto {
  const factory KycStatusDto({
    String? overall,
    required KycFieldsDto fields,

    @Default(<String, String>{}) Map<String, String> reasons,

    String? requestId,
    String? updatedAt,
  }) = _KycStatusDto;

  factory KycStatusDto.fromJson(Map<String, dynamic> json) =>
      _$KycStatusDtoFromJson(json);
}
