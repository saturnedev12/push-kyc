import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:push_kyc/app/features/photon_adress/data/models/photon_adress_model.dart';
import 'package:push_kyc/app/features/photon_adress/data/providers/phototon_adress_provider.dart';
import 'package:push_kyc/app/features/photon_adress/domain/repositories/photo_adress_repository_interface.dart';

@LazySingleton()
class PhotonRepository implements PhotoAdressRepositoryInterface {
  Dio dio;
  PhotonRepository(this.dio);

  @override
  Future<List<PhotonAdressModel>> searchAddress({
    required String query,
    required int page,
    int pageSize = 20,
    String? lang,
    double? lon,
    double? lat,
    List<String>? layers,
  }) async {
    final limit = page * pageSize; // cumulative
    final collection = await PhototonAdressProvider(dio).search(
      query,
      lang: lang,
      limit: limit,
      lon: lon,
      lat: lat,
      layer: layers,
    );
    final all = collection.features;
    final start = (page - 1) * pageSize;
    if (start >= all.length) return [];
    final end = all.length;
    return all.sublist(start.clamp(0, end), end);
  }
}
