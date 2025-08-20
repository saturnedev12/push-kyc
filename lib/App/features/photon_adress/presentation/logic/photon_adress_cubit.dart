import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:push_kyc/app/features/photon_adress/domain/usecases/photon_address_usecases.dart';
import 'package:push_kyc/app/features/photon_adress/presentation/logic/photon_adress_state.dart';

@injectable
class PhotonAdressCubit extends Cubit<PhotonAdressState> {
  PhotonAddressUsecases photonAddressUsecases;

  PhotonAdressCubit(this.photonAddressUsecases)
    : super(const PhotonAdressState.initial());

  fetchAddress() async {
    emit(const PhotonAdressState.loading());
    try {
      final result = await photonAddressUsecases.getList(
        query: 'Abidjan Cocody',
        page: 1,
        lang: 'fr',
      );
      inspect(result);
    } catch (e) {
      emit(const PhotonAdressState.loading());
    }
  }
}
