import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:push_kyc/app/features/authentification/data/models/remote/auth_response_dto.dart';
import 'package:push_kyc/app/features/authentification/domain/usecases/auth_usecases.dart';

import '../mocks.dart';

void main() {
  late MockAuthRepository repo;
  late AuthUsecases usecases;

  setUp(() {
    repo = MockAuthRepository();
    usecases = AuthUsecases(repo);
  });

  group('AuthUsecases', () {
    test('login délègue correctement et renvoie AuthResponseDto', () async {
      const email = 'john@doe.com';
      const password = 'secret';

      const expected = AuthResponseDto(
        success: true,
        message: 'ok',
        accessToken: 'access_abc',
        refreshToken: 'refresh_xyz',
        userId: 'u1',
        email: email,
      );

      when(
        () => repo.login(email: email, password: password),
      ).thenAnswer((_) async => expected);

      final res = await usecases.login(email: email, password: password);

      expect(res.success, isTrue);
      expect(res.accessToken, 'access_abc');
      expect(res.refreshToken, 'refresh_xyz');
      expect(res.userId, 'u1');
      expect(res.email, email);

      verify(() => repo.login(email: email, password: password)).called(1);
      verifyNoMoreInteractions(repo);
    });

    test('login propage les erreurs du repository', () async {
      const email = 'john@doe.com';
      const password = 'bad';

      when(
        () => repo.login(email: email, password: password),
      ).thenThrow(Exception('invalid credentials'));

      expect(
        () => usecases.login(email: email, password: password),
        throwsA(isA<Exception>()),
      );
      verify(() => repo.login(email: email, password: password)).called(1);
    });

    test('login propage les erreurs', () async {
      const email = 'john@doe.com';
      const password = 'bad';

      when(
        () => repo.login(email: email, password: password),
      ).thenThrow(Exception('invalid credentials'));

      expect(
        () => usecases.login(email: email, password: password),
        throwsA(isA<Exception>()),
      );
      verify(() => repo.login(email: email, password: password)).called(1);
    });
  });
}
