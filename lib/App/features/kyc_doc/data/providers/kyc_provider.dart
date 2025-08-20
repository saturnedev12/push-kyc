import 'dart:io';
import 'package:dio/dio.dart';
import 'package:push_kyc/app/features/kyc_doc/data/models/kyc_status_dto.dart';
import 'package:push_kyc/app/features/kyc_doc/data/models/kyc_submission_response.dart';
import 'package:push_kyc/app/features/kyc_doc/data/models/personal_info_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'kyc_provider.g.dart';

@RestApi(baseUrl: null)
abstract class KycProvider {
  factory KycProvider(Dio dio, {String baseUrl}) = _KycProvider;

  /// 1) Envoyer les informations personnelles (JSON)
  @POST(
    'https://199c722e-5157-4f29-a7a0-1269ea8d2063.mock.pstmn.io/kyc/personal-info',
  )
  Future<KycSubmissionResponse> submitPersonalInfo(@Body() PersonalInfoDto dto);

  /// 2) Envoyer la pièce d’identité (multipart)
  /// - type: ex. "ID_CARD", "PASSEPORT", "DRIVER_LICENSE", "RESIDENCE_PERMIT"
  /// - recto/verso pour carte ; ou passport pour passeport (optionnels en fonction du type)
  @POST(
    'https://199c722e-5157-4f29-a7a0-1269ea8d2063.mock.pstmn.io/kyc/id-document',
  )
  @MultiPart()
  Future<KycSubmissionResponse> submitIdDocument({
    @Part(name: 'type') required String type,
    @Part(name: 'recto') File? recto,
    @Part(name: 'verso') File? verso,
    @Part(name: 'passport') File? passport,
  });

  /// 3) Envoyer le selfie (multipart)
  @POST('https://199c722e-5157-4f29-a7a0-1269ea8d2063.mock.pstmn.io/kyc/selfie')
  @MultiPart()
  Future<KycSubmissionResponse> submitSelfie({
    @Part(name: 'selfie') required File selfie,
  });

  /// 4) Récupérer le statut de vérification (par champ)
  @GET('https://199c722e-5157-4f29-a7a0-1269ea8d2063.mock.pstmn.io/kyc/status')
  Future<KycStatusDto> getKycStatus();

  /// 5) Annuler le KYC en cours
  @POST('https://199c722e-5157-4f29-a7a0-1269ea8d2063.mock.pstmn.io/kyc/cancel')
  Future<HttpResponse<void>> cancelKyc();
}
