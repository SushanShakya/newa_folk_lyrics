import 'dart:io';

import 'package:warped_bloc/warped_bloc.dart';

class InternetCheckCubit extends Cubit<bool> {
  InternetCheckCubit() : super(false);

  void hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      emit(result.isNotEmpty && result[0].rawAddress.isNotEmpty);
    } on SocketException catch (_) {
      emit(false);
    }
  }
}
