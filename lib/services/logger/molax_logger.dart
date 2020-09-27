import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

void logResponse(Response response) {
  print(response.request.url);
  print(response.request.headers);
  print(response.request.contentLength);
  print("${response.statusCode} ${response.reasonPhrase}");
  debugPrint(response.body);
}