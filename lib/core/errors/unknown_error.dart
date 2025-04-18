part of 'error_interface.dart';

class UnknownError extends ErrorInterface {
  UnknownError() : super(msg: Language.current.unknown_error, code: 0);
}
