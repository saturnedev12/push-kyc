import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_kyc/App/features/documents/presentation/utils/enums.dart';

import 'kyc_doc_state.dart';

class KycDocCubit extends Cubit<KycDocState> {
  KycDocCubit() : super(const KycDocState(typeChoisi: TypeId.ID_CARD));

  void choisirType(TypeId type) {
    emit(state.copyWith(typeChoisi: type));
    _revalider();
  }

  void setRecto(String path) {
    emit(state.copyWith(pathRecto: path));
    _revalider();
  }

  void setVerso(String path) {
    emit(state.copyWith(pathVerso: path));
    _revalider();
  }

  void setPassport(String path) {
    emit(state.copyWith(pathPassport: path));
    _revalider();
  }

  void setValidationManuelle(bool ok) {
    emit(state.copyWith(validationOk: ok));
  }

  void setSelfie(String path) {
    emit(state.copyWith(pathSelfie: path));
    _revalider(); // si tu veux inclure le selfie dans validationOk plus tard
  }

  void reset() {
    emit(const KycDocState());
  }

  void _revalider() {
    final okId =
        state.typeChoisi == TypeId.ID_CARD &&
        state.pathRecto != null &&
        state.pathVerso != null;

    final okPasseport =
        state.typeChoisi == TypeId.PASSEPORT && state.pathPassport != null;

    emit(state.copyWith(validationOk: okId || okPasseport));
  }

  void setBirthDate(DateTime d) {
    emit(
      state.copyWith(birthYear: d.year, birthMonth: d.month, birthDay: d.day),
    );
  }

  void setBirthYear(int? y) {
    final m = state.birthMonth ?? 1;
    final d = state.birthDay ?? 1;
    if (y == null) return;
    final safe = DateTime(y, m, 1);
    final day = d.clamp(1, DateUtils.getDaysInMonth(y, m));
    emit(state.copyWith(birthYear: y, birthDay: day));
  }

  void setBirthMonth(int? m) {
    final y = state.birthYear ?? DateTime.now().year;
    final d = state.birthDay ?? 1;
    if (m == null) return;
    final day = d.clamp(1, DateUtils.getDaysInMonth(y, m));
    emit(state.copyWith(birthMonth: m, birthDay: day));
  }

  void setBirthDay(int? d) {
    if (d == null) return;
    final y = state.birthYear ?? DateTime.now().year;
    final m = state.birthMonth ?? 1;
    final max = DateUtils.getDaysInMonth(y, m);
    emit(state.copyWith(birthDay: d.clamp(1, max)));
  }
}
