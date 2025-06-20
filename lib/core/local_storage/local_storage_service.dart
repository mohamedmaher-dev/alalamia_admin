import 'dart:convert';
import 'package:alalamia_admin/core/local_storage/local_storage_consts.dart';
import 'package:alalamia_admin/core/local_storage/models/user_credential_model.dart';
import 'package:alalamia_admin/hive_registrar.g.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
part 'user_credential_storage.dart';

/// Service for managing local data storage and persistence
/// Handles Hive database initialization, user credentials storage, and app state persistence
/// Integrates with Flutter Secure Storage for encryption and HydratedBloc for state persistence
class LocalStorageService {
  /// Private storage handler for user credentials with encryption
  final _userCredentialStorage = _UserCredentialStorage();

  /// Initialize the local storage system
  /// Sets up Hive database, registers adapters, and configures HydratedBloc storage
  /// Must be called during app startup before using any storage features
  Future<void> call() async {
    // Initialize Hive database with Flutter integration
    Hive
      ..initFlutter()
      ..registerAdapters(); // Register generated Hive type adapters

    // Initialize encrypted user credential storage
    await _userCredentialStorage();

    // Configure HydratedBloc for automatic state persistence
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(
        (await getTemporaryDirectory()).path,
      ),
    );
  }

  /// Get the currently saved user credentials
  /// Returns null if no credentials are stored (user not logged in)
  UserCredential? get userCredential =>
      _userCredentialStorage._userCredentialBox.get(0);

  /// Save user credentials to encrypted local storage
  /// [userCredential] - User authentication data to persist for auto-login
  /// Overwrites any existing credentials
  Future<void> saveUserCredential({
    required final UserCredential userCredential,
  }) async {
    _userCredentialStorage._userCredentialBox.put(0, userCredential);
  }

  /// Delete saved user credentials from storage
  /// Used during sign out to clear authentication data
  Future<void> deleteUserCredential() async =>
      _userCredentialStorage._userCredentialBox.delete(0);
}
