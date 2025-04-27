part of 'app_error.dart';

class UnknownError extends AppError {
  UnknownError() : super(msg: Language.current.unknown_error, code: 0);
}
