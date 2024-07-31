import 'package:newa_folk_lyrics/src/core/di/cubit_injector.dart';
import 'package:newa_folk_lyrics/src/core/di/dio_injector.dart';
import 'package:newa_folk_lyrics/src/core/di/locator.dart';
import 'package:newa_folk_lyrics/src/core/di/repo_injector.dart';
import 'package:newa_folk_lyrics/src/core/di/usecase_injector.dart';
import 'package:newa_folk_lyrics/src/modules/ads/data/repo/ad_service.dart';

Future<void> injectDependencies() async {
  g.registerLazySingleton(() => AdService());
  injectDio();
  injectRepo();
  injectInteractors();
  injectCubits();
}
