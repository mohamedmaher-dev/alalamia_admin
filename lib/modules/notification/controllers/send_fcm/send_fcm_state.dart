part of 'send_fcm_cubit.dart';

@freezed
class FcmState with _$FcmState {
  const factory FcmState.initial() = _Initial;
  const factory FcmState.loading() = _Loading;
  const factory FcmState.success() = _Success;
  const factory FcmState.failure(String e) = _Failure;
}
