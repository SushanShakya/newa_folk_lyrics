import 'package:dio/dio.dart';
import 'package:newa_folk_lyrics/src/core/di/locator.dart';

void injectDio() {
  g.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl:
            "https://raw.githubusercontent.com/SushanShakya/newa_folk_lyrics/api_connection",
      ),
    ),
  );
}
