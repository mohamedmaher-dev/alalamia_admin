import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/utils/assets_manger.dart';
import 'package:alalamia_admin/modules/splash/controllers/splash/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part 'widgets/splash_listener.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    BlocProvider.of<SplashCubit>(context).start();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocListener<SplashCubit, SplashState>(
    listener: _listener,
    child: Scaffold(
      backgroundColor: const Color(0xFF00102B),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Hero(
            tag: 'logo',
            child: Image.asset(
              AssetsManger.iconIcon,
              height: 150.h,
              width: 150.w,
            ),
          ),
          const Spacer(),
          Container(
            margin: EdgeInsets.all(kLargeMargin),
            child: const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
                strokeCap: StrokeCap.round,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
