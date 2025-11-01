import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/models/track.dart';

void main() {
  group('Track', () {
    test('fromJson creates a Track from JSON', () {
      final json = {
        'trackId': 123456,
        'trackName': 'Test Song',
        'artistName': 'Test Artist',
        'collectionName': 'Test Album',
        'artworkUrl100': 'https://example.com/artwork.jpg',
        'previewUrl': 'https://example.com/preview.mp3',
        'primaryGenreName': 'Rock',
        'trackPrice': 1.29,
        'currency': 'USD',
        'trackTimeMillis': 240000,
        'releaseDate': '2024-01-01T00:00:00Z',
      };

      final track = Track.fromJson(json);

      expect(track.trackId, 123456);
      expect(track.trackName, 'Test Song');
      expect(track.artistName, 'Test Artist');
      expect(track.collectionName, 'Test Album');
      expect(track.artworkUrl100, 'https://example.com/artwork.jpg');
      expect(track.previewUrl, 'https://example.com/preview.mp3');
      expect(track.primaryGenreName, 'Rock');
      expect(track.trackPrice, 1.29);
      expect(track.currency, 'USD');
      expect(track.trackTimeMillis, 240000);
      expect(track.releaseDate, DateTime.parse('2024-01-01T00:00:00Z'));
    });

    test('fromJson handles missing optional fields', () {
      final json = {
        'trackId': 123456,
        'trackName': 'Test Song',
        'artistName': 'Test Artist',
      };

      final track = Track.fromJson(json);

      expect(track.trackId, 123456);
      expect(track.trackName, 'Test Song');
      expect(track.artistName, 'Test Artist');
      expect(track.collectionName, isNull);
      expect(track.artworkUrl100, isNull);
      expect(track.previewUrl, isNull);
    });

    test('toJson creates JSON from Track', () {
      final track = Track(
        trackId: 123456,
        trackName: 'Test Song',
        artistName: 'Test Artist',
        collectionName: 'Test Album',
        artworkUrl100: 'https://example.com/artwork.jpg',
        previewUrl: 'https://example.com/preview.mp3',
        primaryGenreName: 'Rock',
        trackPrice: 1.29,
        currency: 'USD',
        trackTimeMillis: 240000,
        releaseDate: DateTime.parse('2024-01-01T00:00:00Z'),
      );

      final json = track.toJson();

      expect(json['trackId'], 123456);
      expect(json['trackName'], 'Test Song');
      expect(json['artistName'], 'Test Artist');
      expect(json['collectionName'], 'Test Album');
    });

    test('formattedDuration formats milliseconds correctly', () {
      final track = Track(
        trackId: 1,
        trackName: 'Test',
        artistName: 'Test',
        trackTimeMillis: 240000, // 4 minutes
      );

      expect(track.formattedDuration, '4:00');
    });

    test('formattedDuration handles seconds correctly', () {
      final track = Track(
        trackId: 1,
        trackName: 'Test',
        artistName: 'Test',
        trackTimeMillis: 195000, // 3:15
      );

      expect(track.formattedDuration, '3:15');
    });

    test('formattedPrice formats price correctly', () {
      final track = Track(
        trackId: 1,
        trackName: 'Test',
        artistName: 'Test',
        trackPrice: 1.29,
        currency: 'USD',
      );

      expect(track.formattedPrice, 'USD 1.29');
    });

    test('formattedPrice returns N/A when price is null', () {
      final track = Track(
        trackId: 1,
        trackName: 'Test',
        artistName: 'Test',
      );

      expect(track.formattedPrice, 'N/A');
    });
  });
}
