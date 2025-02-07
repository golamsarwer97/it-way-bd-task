class ServerException implements Exception {
  final int statusCode;
  final String message;
  final Map<String, dynamic>? errors;

  ServerException({
    required this.statusCode,
    required this.message,
    this.errors,
  });

  // Additional methods or properties can be added as needed
}

class NoInternetException implements Exception {}

class CacheException implements Exception {}
