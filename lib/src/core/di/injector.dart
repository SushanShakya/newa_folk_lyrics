import 'package:newa_folk_lyrics/src/core/di/cubit_injector.dart';
import 'package:newa_folk_lyrics/src/core/di/dio_injector.dart';
import 'package:newa_folk_lyrics/src/core/di/repo_injector.dart';
import 'package:newa_folk_lyrics/src/core/di/usecase_injector.dart';

Future<void> injectDependencies() async {
  injectDio();
  injectRepo();
  injectInteractors();
  injectCubits();
}
