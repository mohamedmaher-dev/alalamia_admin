import 'dart:convert';
import 'package:alalamia_admin/core/local_storage/local_storage_consts.dart';
import 'package:alalamia_admin/core/local_storage/models/user_credential_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  static late Box<UserCredential?> _userCredentialBox;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserCredentialAdapter());
    await _openUserCredentialBox();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(
        (await getTemporaryDirectory()).path,
      ),
    );
  }

  Future<void> _openUserCredentialBox() async {
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

  static UserCredential? get userCredential => _userCredentialBox.get(0);

  Future<void> saveUserCredential({
    required UserCredential userCredential,
  }) async {
    _userCredentialBox.put(0, userCredential);
  }

  static Future<void> deleteUserCredential() async {
    _userCredentialBox.delete(0);
  }
}
