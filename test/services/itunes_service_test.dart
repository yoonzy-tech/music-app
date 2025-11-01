import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_app/services/itunes_service.dart';
import 'package:music_app/models/track.dart';

@GenerateMocks([http.Client])
import 'itunes_service_test.mocks.dart';

void main() {
  group('ItunesService', () {
    test('searchTracks returns empty list for empty query', () async {
      final service = ItunesService();
      final results = await service.searchTracks('');
      expect(results, isEmpty);
    });

    test('searchTracks throws exception on error', () async {
      final service = ItunesService();
      expect(
        () async => await service.searchTracks('test'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
