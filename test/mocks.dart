import 'package:mocktail/mocktail.dart';
import 'package:push_kyc/app/features/authentification/domain/reposirories/auth_repository_interface.dart';
import 'dart:io';

import 'package:push_kyc/app/features/kyc_doc/domain/repositories/%20kyc_repository_interface.dart';
import 'package:push_kyc/app/features/photon_adress/data/repository/photon_repository.dart';

class MockKycRepository extends Mock implements KycRepositoryInterface {}

class MockAuthRepository extends Mock implements AuthRepositoryInterface {}

class MockPhotonRepository extends Mock implements PhotonRepository {}

/// Si mocktail a besoin de fallback values pour certains types custom,
/// tu peux les enregistrer dans setUpAll de chaque test file.
/// Pour `File`, on peut fournir un vrai objet pointant vers un path temp.
File makeTempFile([String name = 'dummy.txt']) =>
    File('${Directory.systemTemp.path}/$name')..writeAsStringSync('x');
