import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/track.dart';

class ItunesService {
  static const String _baseUrl = 'https://itunes.apple.com';

  Future<List<Track>> searchTracks(String query) async {
    if (query.isEmpty) {
      return [];
    }

    try {
      final url = Uri.parse('$_baseUrl/search').replace(
        queryParameters: {
          'term': query,
          'media': 'music',
          'entity': 'song',
          'limit': '50',
        },
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final results = data['results'] as List;
        return results.map((json) => Track.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load tracks: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error searching tracks: $e');
    }
  }

  Future<Track?> getTrackById(int trackId) async {
    try {
      final url = Uri.parse('$_baseUrl/lookup').replace(
        queryParameters: {
          'id': trackId.toString(),
        },
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final results = data['results'] as List;
        if (results.isNotEmpty) {
          return Track.fromJson(results[0]);
        }
      }
      return null;
    } catch (e) {
      throw Exception('Error fetching track: $e');
    }
  }
}
