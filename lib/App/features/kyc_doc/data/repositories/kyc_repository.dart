import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:push_kyc/app/features/kyc_doc/domain/repositories/%20kyc_repository_interface.dart';
import 'package:retrofit/dio.dart';

import 'package:push_kyc/app/features/kyc_doc/data/models/kyc_status_dto.dart';
import 'package:push_kyc/app/features/kyc_doc/data/models/kyc_submission_response.dart';
import 'package:push_kyc/app/features/kyc_doc/data/models/personal_info_dto.dart';
import 'package:push_kyc/app/features/kyc_doc/data/providers/kyc_provider.dart';

@LazySingleton()
class KycRepository implements KycRepositoryInterface {
  final Dio dio;

  KycRepository(this.dio);

  KycProvider get _provider => KycProvider(dio);

  @override
  Future<KycSubmissionResponse> submitPersonalInfo(PersonalInfoDto dto) {
    return _provider.submitPersonalInfo(dto);
  }

  @override
  Future<KycSubmissionResponse> submitIdDocument({
    required String type,
    File? recto,
    File? verso,
    File? passport,
  }) {
    return _provider.submitIdDocument(
      type: type,
      recto: recto,
      verso: verso,
      passport: passport,
    );
  }

  @override
  Future<KycSubmissionResponse> submitSelfie(File selfie) {
    return _provider.submitSelfie(selfie: selfie);
  }

  @override
  Future<KycStatusDto> getKycStatus() {
    return _provider.getKycStatus();
  }

  @override
  Future<void> cancelKyc() async {
    final HttpResponse<void> response = await _provider.cancelKyc();
    if (response.response.statusCode != 200) {
      throw Exception("Échec lors de l'annulation du KYC");
    }
  }
}
