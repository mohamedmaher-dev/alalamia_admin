// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:alalamia_admin/modules/auth/sign_in/views/sign_in_view.dart'
    as _i5;
import 'package:alalamia_admin/modules/main/main_view.dart' as _i1;
import 'package:alalamia_admin/modules/order_details/views/one_order_view.dart'
    as _i2;
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart'
    as _i10;
import 'package:alalamia_admin/modules/orders/views/orders_view.dart' as _i3;
import 'package:alalamia_admin/modules/settings/views/settings_view.dart'
    as _i4;
import 'package:alalamia_admin/modules/splash/views/splash_view.dart' as _i6;
import 'package:alalamia_admin/modules/statistics/views/statistics_view.dart'
    as _i7;
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/cupertino.dart' as _i9;

/// generated route for
/// [_i1.MainView]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.MainView();
    },
  );
}

/// generated route for
/// [_i2.OrderDetailsView]
class OrderDetailsRoute extends _i8.PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    _i9.Key? key,
    required _i10.OrdersDatum args,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         OrderDetailsRoute.name,
         args: OrderDetailsRouteArgs(key: key, args: args),
         initialChildren: children,
       );

  static const String name = 'OrderDetailsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrderDetailsRouteArgs>();
      return _i2.OrderDetailsView(key: args.key, args: args.args);
    },
  );
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({this.key, required this.args});

  final _i9.Key? key;

  final _i10.OrdersDatum args;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{key: $key, args: $args}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OrderDetailsRouteArgs) return false;
    return key == other.key && args == other.args;
  }

  @override
  int get hashCode => key.hashCode ^ args.hashCode;
}

/// generated route for
/// [_i3.OrdersView]
class OrdersRoute extends _i8.PageRouteInfo<void> {
  const OrdersRoute({List<_i8.PageRouteInfo>? children})
    : super(OrdersRoute.name, initialChildren: children);

  static const String name = 'OrdersRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.OrdersView();
    },
  );
}

/// generated route for
/// [_i4.SettingsView]
class SettingsRoute extends _i8.PageRouteInfo<void> {
  const SettingsRoute({List<_i8.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.SettingsView();
    },
  );
}

/// generated route for
/// [_i5.SignInView]
class SignInRoute extends _i8.PageRouteInfo<void> {
  const SignInRoute({List<_i8.PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.SignInView();
    },
  );
}

/// generated route for
/// [_i6.SplashView]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.SplashView();
    },
  );
}

/// generated route for
/// [_i7.StatisticsView]
class StatisticsRoute extends _i8.PageRouteInfo<void> {
  const StatisticsRoute({List<_i8.PageRouteInfo>? children})
    : super(StatisticsRoute.name, initialChildren: children);

  static const String name = 'StatisticsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.StatisticsView();
    },
  );
}
