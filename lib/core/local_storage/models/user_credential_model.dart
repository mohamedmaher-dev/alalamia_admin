import 'package:alalamia_admin/core/local_storage/hive_adapter_type.dart';
import 'package:hive/hive.dart';
part 'user_credential_model.g.dart';

@HiveType(typeId: HiveAdapterType.userCredential)
class UserCredential {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String password;
  @HiveField(2)
  final String token;
  @HiveField(3)
  final String countryName;
  @HiveField(4)
  final String countryFlagPath;
  UserCredential({
    required this.email,
    required this.password,
    required this.token,
    required this.countryName,
    required this.countryFlagPath,
  });
}
