import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'routes/app_routes_barrel.dart';

class MainApp extends StatelessWidget {
  MainApp({super.key});

  /// route only has one Screen
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
