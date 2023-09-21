// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:newa_folk_lyrics/src/modules/common/data/repo/interface/istorage.dart';
import 'package:path_provider/path_provider.dart';

class FileStorageRepo implements IStorage {
  final String filename;

  FileStorageRepo({
    required this.filename,
  });

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$filename');
  }

  @override
  Future<void> clear() async {}

  @override
  Future<String?> fetch() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> save(String data) async {
    final file = await _localFile;
    // Write the file
    await file.writeAsString(data);
  }
}
