part of 'local_storage_service.dart';

class _UserCredentialStorage {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  late Box<UserCredential?> _userCredentialBox;

  Future<void> call() async {
    Hive.registerAdapter(UserCredentialAdapter());
    await _secureStorage.read(key: LocalStorageConsts.hiveSecureKey).then((
      value,
    ) async {
      if (value == null) {
        final List<int> key = Hive.generateSecureKey();
        _secureStorage.write(
          key: LocalStorageConsts.hiveSecureKey,
          value: key.toString(),
        );
        _userCredentialBox = await Hive.openBox<UserCredential>(
          LocalStorageConsts.userCredentialBox,
          encryptionCipher: HiveAesCipher(key),
        );
      } else {
        final List<dynamic> keyIncoded = jsonDecode(value);
        final List<int> key = List<int>.from(keyIncoded);
        _userCredentialBox = await Hive.openBox<UserCredential>(
          LocalStorageConsts.userCredentialBox,
          encryptionCipher: HiveAesCipher(key),
        );
      }
    });
  }
}
