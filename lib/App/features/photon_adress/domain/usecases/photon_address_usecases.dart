import 'package:injectable/injectable.dart';
import 'package:push_kyc/App/features/photon_adress/data/models/photon_adress_model.dart';
import 'package:push_kyc/App/features/photon_adress/data/repository/photon_repository.dart';

@injectable
class PhotonAddressUsecases {
  PhotonRepository repository;
  PhotonAddressUsecases(this.repository);

  Future<List<PhotonAdressModel>> getList({
    required String query,
    required int page,
    int pageSize = 20,
    String? lang,
    double? lon,
    double? lat,
    List<String>? layers,
  }) {
    return repository.searchAddress(
      query: query,
      page: page,
      pageSize: pageSize,
      lang: lang,
      lon: lon,
      lat: lat,
      layers: layers,
    );
  }
}
