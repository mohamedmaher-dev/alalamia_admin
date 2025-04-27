import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:dio/dio.dart';

part '../errors/api_error.dart';
part '../errors/cache_error.dart';
part '../errors/unknown_error.dart';

sealed class AppError {
  final String msg;
  final int code;
  AppError({required this.msg, required this.code});
}
