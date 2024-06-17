// Every mobile application has  utility class endpoint to provide URI for any
// api that we use for our backend, have a look at the function and understand
// that this is versatile.

class Endpoint {
  static const apiScheme = 'https';
  static const apiHost = 'fluttercrashcourse.com';
  static const prefix = '/api/v1';

  static Uri uri(String path, {Map<String, dynamic>? queryParameters}) {
    final uri = new Uri(
      scheme: apiScheme,
      host: apiHost,
      path: '$prefix$path',
      queryParameters: queryParameters,
    );

    return uri;
  }
}
