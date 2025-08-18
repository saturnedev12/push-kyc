import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:push_kyc/App/features/photon_adress/data/models/photon_adress_model.dart';

part 'photon_address_collection.freezed.dart';
part 'photon_address_collection.g.dart';

@freezed
class PhotonAddressCollection with _$PhotonAddressCollection {
  factory PhotonAddressCollection({
    String? type,
    @Default([]) List<PhotonAdressModel> features,
  }) = _PhotonAddressCollection;

  factory PhotonAddressCollection.fromJson(Map<String, dynamic> json) =>
      _$PhotonAddressCollectionFromJson(json);
}
