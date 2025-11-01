class Track {
  final int trackId;
  final String trackName;
  final String artistName;
  final String? collectionName;
  final String? artworkUrl100;
  final String? previewUrl;
  final String? primaryGenreName;
  final double? trackPrice;
  final String? currency;
  final int? trackTimeMillis;
  final DateTime? releaseDate;

  Track({
    required this.trackId,
    required this.trackName,
    required this.artistName,
    this.collectionName,
    this.artworkUrl100,
    this.previewUrl,
    this.primaryGenreName,
    this.trackPrice,
    this.currency,
    this.trackTimeMillis,
    this.releaseDate,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      trackId: json['trackId'] ?? 0,
      trackName: json['trackName'] ?? 'Unknown Track',
      artistName: json['artistName'] ?? 'Unknown Artist',
      collectionName: json['collectionName'],
      artworkUrl100: json['artworkUrl100'],
      previewUrl: json['previewUrl'],
      primaryGenreName: json['primaryGenreName'],
      trackPrice: json['trackPrice']?.toDouble(),
      currency: json['currency'],
      trackTimeMillis: json['trackTimeMillis'],
      releaseDate: json['releaseDate'] != null
          ? DateTime.tryParse(json['releaseDate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trackId': trackId,
      'trackName': trackName,
      'artistName': artistName,
      'collectionName': collectionName,
      'artworkUrl100': artworkUrl100,
      'previewUrl': previewUrl,
      'primaryGenreName': primaryGenreName,
      'trackPrice': trackPrice,
      'currency': currency,
      'trackTimeMillis': trackTimeMillis,
      'releaseDate': releaseDate?.toIso8601String(),
    };
  }

  String get formattedDuration {
    if (trackTimeMillis == null) return '';
    final duration = Duration(milliseconds: trackTimeMillis!);
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  String get formattedPrice {
    if (trackPrice == null || currency == null) return 'N/A';
    return '$currency $trackPrice';
  }
}
