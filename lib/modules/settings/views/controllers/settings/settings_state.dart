part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial({
    required final AppConfigModel appConfigModel,
  }) = _Initial;
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.failure(final AppError e) = _Failure;
}
