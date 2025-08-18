import 'package:equatable/equatable.dart';
import 'package:push_kyc/App/features/documents/presentation/utils/enums.dart';

class KycDocState extends Equatable {
  final TypeId? typeChoisi;
  final String? pathRecto;
  final String? pathVerso;
  final String? pathPassport;
  final bool validationOk;
  final String? pathSelfie;
  //
  final int? birthYear;
  final int? birthMonth;
  final int? birthDay;

  DateTime? get birthDate {
    if (birthYear == null || birthMonth == null || birthDay == null)
      return null;
    return DateTime(birthYear!, birthMonth!, birthDay!);
  }

  const KycDocState({
    this.typeChoisi,
    this.pathRecto,
    this.pathVerso,
    this.pathPassport,
    this.pathSelfie,
    this.validationOk = false,
    this.birthYear,
    this.birthMonth,
    this.birthDay,
  });

  KycDocState copyWith({
    TypeId? typeChoisi,
    String? pathRecto,
    String? pathVerso,
    String? pathPassport,
    bool? validationOk,
    String? pathSelfie,
    int? birthYear,
    int? birthMonth,
    int? birthDay,
  }) {
    return KycDocState(
      typeChoisi: typeChoisi ?? this.typeChoisi,
      pathRecto: pathRecto ?? this.pathRecto,
      pathVerso: pathVerso ?? this.pathVerso,
      pathPassport: pathPassport ?? this.pathPassport,
      validationOk: validationOk ?? this.validationOk,
      pathSelfie: pathSelfie ?? this.pathSelfie,
      birthYear: birthYear ?? this.birthYear,
      birthMonth: birthMonth ?? this.birthMonth,
      birthDay: birthDay ?? this.birthDay,
    );
  }

  @override
  List<Object?> get props => [
    typeChoisi,
    pathRecto,
    pathVerso,
    pathPassport,
    validationOk,
    pathSelfie,
    birthYear,
    birthMonth,
    birthDay,
  ];
}
