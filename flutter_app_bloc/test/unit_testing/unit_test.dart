import 'package:flutter_app_bloc/data/model/model_kehilangan.dart';
import 'package:flutter_app_bloc/data/repository/kehilangan_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockKehilanganRepository extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

void main() {
  group('API Unit Testing', () {
    http.Client httpClient;
    KehilanganRepository kehilanganRepository;

    setUp(() {
      httpClient = MockKehilanganRepository();
      kehilanganRepository = KehilanganRepository();
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(KehilanganRepository(), isNotNull);
      });
    });

    group('getKehilangan', () {
      test('returns result call api', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn('''
          [
            {
              "id": "133",
              "id_user": "59",
              "nama": "Zakki Haris",
              "peran": "Mahasiswa",
              "nama_barang": "Kaos Kaki Hitam ",
              "jenis_barang": "Elektronik",
              "gambar": "gambar_kaos.png",
              "detail_informasi": "Kaos kaki eletrik ditemukakn di jalan raya kali urang",
              "tempat_kehilangan": "Kaliurang KM 14",
              "waktu_kehilangan": "2020-01-16",
              "nomor_hp": "2147483647",
              "id_line": "jack",
              "status": "0",
              "waktusekarang": "2020-12-13 09:35:56"
            }
          ]
        ''');
        when(httpClient.get(any)).thenAnswer((_) async => response);
        final actual = await kehilanganRepository.getKehilangan();
        expect(actual, isA<List<Kehilangan>>());
      });

      test('throw an error if object empty', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn('[]');
        when(httpClient.get(any)).thenAnswer((_) async => response);
        await kehilanganRepository.getKehilangan();
        verifyNever(
          httpClient.get(
            Uri.https('api.zakkiharis.com', '/api/kehilangan?X-API-KEY=pass'),
          ),
        ).called(0);
      });
    });

    group('getErrorKehilangan', () {
      test('throws an error if bad request', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(400);
        when(httpClient.get(any)).thenAnswer((_) async => response);
        expect(
          () async => await kehilanganRepository.getKehilangan(),
          throwsA(isA<KehilanganRequestFailure>()),
        );
      });
    });
  });
}
