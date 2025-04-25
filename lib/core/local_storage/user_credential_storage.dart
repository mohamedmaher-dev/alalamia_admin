part of 'local_storage_service.dart';

class _UserCredentialStorage {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  late Box<UserCredential?> _userCredentialBox;

  Future<void> call() async {
    late List<int> key;
    await _secureStorage.read(key: LocalStorageConsts.hiveSecureKey).then((
      final value,
    ) async {
      if (value == null) {
        key = Hive.generateSecureKey();
        _secureStorage.write(
          key: LocalStorageConsts.hiveSecureKey,
          value: key.toString(),
        );
      } else {
        final List<dynamic> keyIncoded = jsonDecode(value);
        key = List<int>.from(keyIncoded);
      }
      _userCredentialBox = await Hive.openBox<UserCredential>(
        LocalStorageConsts.userCredentialBox,
        encryptionCipher: HiveAesCipher(key),
      );
    });
  }
}
