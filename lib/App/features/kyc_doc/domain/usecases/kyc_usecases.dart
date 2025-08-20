import 'dart:io';
import 'package:injectable/injectable.dart';

import 'package:push_kyc/app/features/kyc_doc/data/models/kyc_status_dto.dart';
import 'package:push_kyc/app/features/kyc_doc/data/models/kyc_submission_response.dart';
import 'package:push_kyc/app/features/kyc_doc/data/models/personal_info_dto.dart';
import 'package:push_kyc/app/features/kyc_doc/domain/repositories/%20kyc_repository_interface.dart';

@injectable
class KycUsecases {
  final KycRepositoryInterface repository;
  KycUsecases(this.repository);

  /// 1) Envoyer les informations personnelles
  Future<KycSubmissionResponse> submitPersonalInfo(PersonalInfoDto dto) {
    return repository.submitPersonalInfo(dto);
  }

  /// 2) Envoyer une pièce d’identité
  Future<KycSubmissionResponse> submitIdDocument({
    required String type,
    File? recto,
    File? verso,
    File? passport,
  }) {
    return repository.submitIdDocument(
      type: type,
      recto: recto,
      verso: verso,
      passport: passport,
    );
  }

  /// 3) Envoyer le selfie
  Future<KycSubmissionResponse> submitSelfie(File selfie) {
    return repository.submitSelfie(selfie);
  }

  /// 4) Vérifier le statut du KYC
  Future<KycStatusDto> getKycStatus() {
    return repository.getKycStatus();
  }

  /// 5) Annuler le KYC
  Future<void> cancelKyc() {
    return repository.cancelKyc();
  }
}
