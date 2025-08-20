import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:push_kyc/app/features/photon_adress/data/models/photon_adress_model.dart';

part 'photon_adress_state.freezed.dart';
part 'photon_adress_state.g.dart';

@freezed
class PhotonAdressState with _$PhotonAdressState {
  factory PhotonAdressState() = _PhotonAdressState;
  const factory PhotonAdressState.initial() = PHOTON_REQUEST_INITIAL;
  const factory PhotonAdressState.loading() = PHOTON_REQUEST_LOADING;
  const factory PhotonAdressState.success(List<PhotonAdressModel> datas) =
      PHOTON_REQUEST_SUCCESS;
  factory PhotonAdressState.fromJson(Map<String, dynamic> json) =>
      _$PhotonAdressStateFromJson(json);
}
