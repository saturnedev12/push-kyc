import 'dart:io';

import 'package:push_kyc/app/features/kyc_doc/data/models/kyc_status_dto.dart';
import 'package:push_kyc/app/features/kyc_doc/data/models/kyc_submission_response.dart';
import 'package:push_kyc/app/features/kyc_doc/data/models/personal_info_dto.dart';

abstract class KycRepositoryInterface {
  Future<KycSubmissionResponse> submitPersonalInfo(PersonalInfoDto dto);
  Future<KycSubmissionResponse> submitIdDocument({
    required String type,
    File? recto,
    File? verso,
    File? passport,
  });
  Future<KycSubmissionResponse> submitSelfie(File selfie);
  Future<KycStatusDto> getKycStatus();
  Future<void> cancelKyc();
}
