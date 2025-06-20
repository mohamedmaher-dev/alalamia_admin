import 'package:alalamia_admin/core/local_storage/hive_adapter_type_id.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/models/sign_in_request_model.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/models/sign_in_response_model.dart';
import 'package:hive_ce/hive.dart';
part 'user_credential_model.g.dart';

/// Model for storing user authentication credentials in local encrypted storage
/// Contains all necessary data for automatic login and user context
/// Uses Hive annotations for type-safe local database storage
@HiveType(typeId: HiveAdapterTypeId.userCredentialId)
class UserCredential {
  /// User's email address for login
  @HiveField(0)
  final String email;

  /// User's password for automatic re-authentication
  @HiveField(1)
  final String password;

  /// JWT authentication token for API requests
  @HiveField(2)
  final String token;

  /// Name of the user's associated country/region
  @HiveField(3)
  final String countryName;

  /// Numeric ID of the user's country for API filtering
  @HiveField(4)
  final int countryId;

  /// Optional country code (ISO format)
  @HiveField(5)
  final String? countryCode;

  /// Create user credential instance with required authentication data
  UserCredential({
    required this.email,
    required this.password,
    required this.token,
    required this.countryName,
    required this.countryId,
    this.countryCode,
  });

  /// Create UserCredential from successful authentication response
  /// [data] - Response from sign in API containing token and user info
  /// [requestData] - Original sign in request containing user credentials
  /// Used to persist credentials after successful login
  factory UserCredential.fromAuth(
    final SignInResponseModel data,
    final SignInRequestModel requestData,
  ) => UserCredential(
    email: requestData.email,
    password: requestData.password,
    token: data.token,
    countryName: data.countryModel.name,
    countryId: data.countryModel.id,
  );

  /// Create empty UserCredential instance with default values
  /// Used for testing or when clearing user data
  factory UserCredential.empty() => UserCredential(
    email: '',
    password: '',
    token: '',
    countryName: '',
    countryId: 0,
  );
}
