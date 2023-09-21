// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';

class ContentRepo {
  final Dio dio;

  ContentRepo({
    required this.dio,
  });

  Future<List> fetchContent() async {
    final res = await dio.get('/lyrics_contents/content.json');
    print(res.data.runtimeType);
    return jsonDecode(res.data) as List;
  }
}
