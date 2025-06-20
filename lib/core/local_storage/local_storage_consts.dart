/// Local storage constants for Hive database keys and box names
/// Defines all storage identifiers used for secure local data persistence
/// Ensures consistent key naming across the application's local storage operations
class LocalStorageConsts {
  // Private constructor to prevent instantiation of this utility class
  LocalStorageConsts._();

  /// Box name for storing user authentication credentials
  /// Contains encrypted user login information for automatic sign-in
  static const userCredentialBox = 'userCredentialBox';

  /// Secure key identifier for Hive encryption
  /// Used to encrypt/decrypt sensitive data stored locally
  static const hiveSecureKey = 'hiveSecureKey';
}
