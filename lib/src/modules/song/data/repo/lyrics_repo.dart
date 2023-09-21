// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class LyricsRepo {
  final Dio dio;

  LyricsRepo({
    required this.dio,
  });

  Future<Map<String, dynamic>> fetchLyrics(String filename) async {
    final res = await dio.get("/lyrics/$filename");
    return res.data as Map<String, dynamic>;
  }
}
