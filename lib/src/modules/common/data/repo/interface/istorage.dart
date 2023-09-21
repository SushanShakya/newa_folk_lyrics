abstract interface class IStorage {
  Future<String?> fetch();
  Future<void> save(String data);
  Future<void> clear();
}
