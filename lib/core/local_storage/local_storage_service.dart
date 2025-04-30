import 'dart:convert';
import 'package:alalamia_admin/core/local_storage/local_storage_consts.dart';
import 'package:alalamia_admin/core/local_storage/models/user_credential_model.dart';
import 'package:alalamia_admin/hive_registrar.g.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
part 'user_credential_storage.dart';

class LocalStorageService {
  final _userCredentialStorage = _UserCredentialStorage();

  Future<void> call() async {
    Hive
      ..initFlutter()
      ..registerAdapters();
    await _userCredentialStorage();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(
        (await getTemporaryDirectory()).path,
      ),
    );
  }

  UserCredential? get userCredential =>
      _userCredentialStorage._userCredentialBox.get(0);

  Future<void> saveUserCredential({
    required final UserCredential userCredential,
  }) async {
    _userCredentialStorage._userCredentialBox.put(0, userCredential);
  }

  Future<void> deleteUserCredential() async =>
      _userCredentialStorage._userCredentialBox.delete(0);
}
