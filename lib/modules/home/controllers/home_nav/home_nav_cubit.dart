import 'package:alalamia_admin/modules/home/views/home_pages.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_nav_state.dart';
part 'home_nav_cubit.freezed.dart';

class HomeNavCubit extends Cubit<HomeNavState> {
  PageController controller = PageController(
    initialPage: HomePages.defaultPage.currentIndex,
  );
  HomeNavCubit() : super(HomeNavState.currentPage(page: HomePages.defaultPage));

  void changePage(final HomePages page) {
    controller.jumpToPage(page.currentIndex);
    emit(HomeNavState.currentPage(page: page));
  }
}
