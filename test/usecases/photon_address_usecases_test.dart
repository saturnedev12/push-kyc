import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:push_kyc/app/features/photon_adress/data/models/photon_adress_model.dart';
import 'package:push_kyc/app/features/photon_adress/domain/usecases/photon_address_usecases.dart';

import '../mocks.dart';

void main() {
  late MockPhotonRepository repo;
  late PhotonAddressUsecases usecases;

  setUp(() {
    repo = MockPhotonRepository();
    usecases = PhotonAddressUsecases(repo);
  });

  group('PhotonAddressUsecases', () {
    test(
      'getList délègue au repo et renvoie une liste de PhotonAdressModel',
      () async {
        final expected = <PhotonAdressModel>[
          const PhotonAdressModel(
            type: 'Feature',
            properties: PhotonProperties(
              osmType: 'n',
              osmId: 123,
              osmKey: 'place',
              osmValue: 'city',
              type: 'city',
              countrycode: 'ci',
              name: 'Abidjan',
              country: 'Côte d’Ivoire',
              city: 'Abidjan',
              state: 'Lagunes',
            ),
            geometry: PhotonGeometry(
              type: 'Point',
              // Toujours [lon, lat]
              coordinates: [-3.9869, 5.35995],
            ),
          ),
        ];

        when(
          () => repo.searchAddress(
            query: 'abidjan',
            page: 1,
            pageSize: 20, // valeur par défaut de ton usecase
            lang: any(named: 'lang'),
            lon: any(named: 'lon'),
            lat: any(named: 'lat'),
            layers: any(named: 'layers'),
          ),
        ).thenAnswer((_) async => expected);

        final res = await usecases.getList(query: 'abidjan', page: 1);

        expect(res, hasLength(1));
        expect(res.first.type, 'Feature');
        expect(res.first.properties.name, 'Abidjan');
        expect(res.first.geometry.type, 'Point');
        expect(res.first.geometry.coordinates, [-3.9869, 5.35995]);

        verify(
          () => repo.searchAddress(
            query: 'abidjan',
            page: 1,
            pageSize: 20,
            lang: any(named: 'lang'),
            lon: any(named: 'lon'),
            lat: any(named: 'lat'),
            layers: any(named: 'layers'),
          ),
        ).called(1);
      },
    );

    test('getList propage une erreur du repository', () async {
      when(
        () => repo.searchAddress(
          query: any(named: 'query'),
          page: any(named: 'page'),
          pageSize: any(named: 'pageSize'),
          lang: any(named: 'lang'),
          lon: any(named: 'lon'),
          lat: any(named: 'lat'),
          layers: any(named: 'layers'),
        ),
      ).thenThrow(Exception('network'));

      expect(
        () => usecases.getList(query: 'x', page: 1),
        throwsA(isA<Exception>()),
      );
    });

    test('getList propage une erreur du repository', () async {
      when(
        () => repo.searchAddress(
          query: any(named: 'query'),
          page: any(named: 'page'),
          pageSize: any(named: 'pageSize'),
          lang: any(named: 'lang'),
          lon: any(named: 'lon'),
          lat: any(named: 'lat'),
          layers: any(named: 'layers'),
        ),
      ).thenThrow(Exception('network'));

      expect(
        () => usecases.getList(query: 'x', page: 1),
        throwsA(isA<Exception>()),
      );
    });
  });
}
