part of 'home_nav_cubit.dart';

@freezed
class HomeNavState with _$HomeNavState {
  const factory HomeNavState.currentPage({required HomePages page}) =
      _CurrentPage;
}
