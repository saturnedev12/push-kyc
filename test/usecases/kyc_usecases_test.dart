import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:push_kyc/app/features/kyc_doc/data/models/kyc_status_dto.dart';
import 'package:push_kyc/app/features/kyc_doc/data/models/kyc_submission_response.dart';
import 'package:push_kyc/app/features/kyc_doc/data/models/personal_info_dto.dart';
import 'package:push_kyc/app/features/kyc_doc/domain/usecases/kyc_usecases.dart';

import '../mocks.dart';

void main() {
  late MockKycRepository repo;
  late KycUsecases usecases;

  // Si ton DTO a besoin de fallback (ex. utilisé dans `any()`), tu peux:
  // registerFallbackValue(PersonalInfoDto(/* champs dummy */));

  setUp(() {
    repo = MockKycRepository();
    usecases = KycUsecases(repo);
  });

  group('KycUsecases', () {
    test(
      'submitPersonalInfo délègue au repository et renvoie la réponse',
      () async {
        final dto = PersonalInfoDto(/* ...remplis si nécessaire... */);
        final expected = KycSubmissionResponse(success: true, message: 'ok');

        when(
          () => repo.submitPersonalInfo(dto),
        ).thenAnswer((_) async => expected);

        final res = await usecases.submitPersonalInfo(dto);

        expect(res, expected);
        verify(() => repo.submitPersonalInfo(dto)).called(1);
        verifyNoMoreInteractions(repo);
      },
    );

    test('submitIdDocument passe tous les paramètres correctement', () async {
      final recto = makeTempFile('recto.jpg');
      final verso = makeTempFile('verso.jpg');
      final expected = KycSubmissionResponse(success: true);

      when(
        () => repo.submitIdDocument(
          type: 'CNI',
          recto: recto,
          verso: verso,
          passport: null,
        ),
      ).thenAnswer((_) async => expected);

      final res = await usecases.submitIdDocument(
        type: 'CNI',
        recto: recto,
        verso: verso,
        passport: null,
      );

      expect(res, expected);
      verify(
        () => repo.submitIdDocument(
          type: 'CNI',
          recto: recto,
          verso: verso,
          passport: null,
        ),
      ).called(1);
    });

    test(
      'submitSelfie renvoie l\'erreur du repository (chemin erreur)',
      () async {
        final selfie = makeTempFile('selfie.jpg');

        when(
          () => repo.submitSelfie(selfie),
        ).thenThrow(Exception('upload failed'));

        expect(() => usecases.submitSelfie(selfie), throwsA(isA<Exception>()));
        verify(() => repo.submitSelfie(selfie)).called(1);
      },
    );

    test('getKycStatus retourne le statut (KycStatusDto with fields)', () async {
      // Construction via fromJson pour ne pas dépendre du constructeur de KycFieldsDto
      final status = KycStatusDto.fromJson({
        "overall": "APPROVED",
        "fields":
            {}, // requis : objet vide OK si les champs internes sont optionnels
        "reasons": {"id": "ok"}, // map<String, String>
        "requestId": "req_123",
        "updatedAt": "2025-08-21T10:00:00Z",
      });

      when(() => repo.getKycStatus()).thenAnswer((_) async => status);

      final res = await usecases.getKycStatus();

      expect(res.overall, 'APPROVED');
      expect(res.fields, isNotNull); // le champ requis est bien présent
      expect(res.reasons['id'], 'ok');
      expect(res.requestId, 'req_123');
      verify(() => repo.getKycStatus()).called(1);
    });

    test('cancelKyc appelle le repository', () async {
      when(() => repo.cancelKyc()).thenAnswer((_) async {});

      await usecases.cancelKyc();

      verify(() => repo.cancelKyc()).called(1);
    });
  });
}
