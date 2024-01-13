import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../../shared/style/app_colors.dart';

class AppBarTail extends StatefulWidget {
  const AppBarTail({
    super.key,
  });

  @override
  State<AppBarTail> createState() => _AppBarTailState();
}

class _AppBarTailState extends State<AppBarTail> {
  late MController mController;

  @override
  void initState() {
    mController = Get.find();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<int>.size(
      current: min(mController.switchValue.value, 1),
      style: ToggleStyle(
        indicatorColor: AppColors.appButtonColor,
        borderColor: AppColors.appButtonColor,
        borderRadius: BorderRadius.circular(10.0),
        indicatorBorderRadius: BorderRadius.circular(3),
      ),
      values: const [0, 1],
      indicatorSize: Size.fromWidth(50.w),
      height: 30.h,
      iconAnimationType: AnimationType.onHover,
      styleAnimationType: AnimationType.onHover,
      spacing: 1.0,
      customIconBuilder: (context, local, global) {
        final text = const ['Day', 'Week'][local.index];
        return Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              color: Color.lerp(
                AppColors.appButtonColor,
                Colors.white,
                local.animationValue,
              ),
            ),
          ),
        );
      },
      onChanged: (i) {
        setState(() {
          mController.switchValue.value = i;
        });
      },
    );
  }
}
