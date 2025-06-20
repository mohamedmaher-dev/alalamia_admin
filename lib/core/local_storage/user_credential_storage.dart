part of 'local_storage_service.dart';

/// Private class for handling encrypted user credential storage
/// Uses Flutter Secure Storage for encryption keys and Hive for data persistence
/// Ensures user authentication data is stored securely on device
class _UserCredentialStorage {
  /// Flutter Secure Storage instance for storing encryption keys
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  /// Encrypted Hive box for storing user credential data
  late Box<UserCredential?> _userCredentialBox;

  /// Initialize the encrypted user credential storage
  /// Sets up encryption keys and opens the encrypted Hive box
  /// Creates new encryption key if none exists, otherwise reuses existing key
  Future<void> call() async {
    late List<int> key;

    // Get or create encryption key from secure storage
    await _secureStorage.read(key: LocalStorageConsts.hiveSecureKey).then((
      final value,
    ) async {
      if (value == null) {
        // No existing key found, generate new secure key
        key = Hive.generateSecureKey();
        _secureStorage.write(
          key: LocalStorageConsts.hiveSecureKey,
          value: key.toString(),
        );
      } else {
        // Existing key found, decode it for use
        final List<dynamic> keyIncoded = jsonDecode(value);
        key = List<int>.from(keyIncoded);
      }

      // Open encrypted Hive box with the encryption key
      _userCredentialBox = await Hive.openBox<UserCredential>(
        LocalStorageConsts.userCredentialBox,
        encryptionCipher: HiveAesCipher(key), // AES encryption
      );
    });
  }
}
