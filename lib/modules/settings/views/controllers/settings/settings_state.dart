part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial({
    required AppConfigModel appConfigModel,
  }) = _Initial;
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.failure(ErrorInterface e) = _Failure;
}
