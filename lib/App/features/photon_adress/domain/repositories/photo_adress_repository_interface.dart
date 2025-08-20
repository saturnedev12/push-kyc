import 'package:push_kyc/app/features/photon_adress/data/models/photon_adress_model.dart';

abstract class PhotoAdressRepositoryInterface {
  Future<List<PhotonAdressModel>> searchAddress({
    required String query,
    required int page,
    int pageSize = 20,
    String? lang,
    double? lon,
    double? lat,
    List<String>? layers,
  });
}
