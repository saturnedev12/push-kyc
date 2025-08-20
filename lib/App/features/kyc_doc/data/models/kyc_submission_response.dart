import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_submission_response.freezed.dart';
part 'kyc_submission_response.g.dart';

@freezed
class KycSubmissionResponse with _$KycSubmissionResponse {
  const factory KycSubmissionResponse({
    required bool success,
    String? message,
    String? requestId,
  }) = _KycSubmissionResponse;

  factory KycSubmissionResponse.fromJson(Map<String, dynamic> json) =>
      _$KycSubmissionResponseFromJson(json);
}
