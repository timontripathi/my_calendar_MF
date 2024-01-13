import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_calendar/src/shared/style/app_colors.dart';
import 'package:my_calendar/src/shared/style/text_style.dart';
import 'package:my_calendar/src/shared/utils/laucher.dart';

class DayCard extends StatelessWidget {
  const DayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Balram Naidu",
                        style: AppTextStyle.boldTextStyle,
                      ),
                      Text(
                        'ID: LORE343553',
                        style: AppTextStyle.normalTextStyle,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Offered : ',
                              style: AppTextStyle.normalTextStyle,
                            ),
                            TextSpan(
                              text: "XXXXX,xxxx",
                              style: AppTextStyle.boldTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Current : ',
                              style: AppTextStyle.normalTextStyle,
                            ),
                            TextSpan(
                              text: "XXXXX,xxxx",
                              style: AppTextStyle.boldTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Type",
                        style: AppTextStyle.normalTextStyle,
                      ),
                      Text(
                        '● Low Priority',
                        style: AppTextStyle.normalTextStyle.copyWith(
                          color: AppColors.appButtonColor,
                        ),
                      ),
                    ],
                  ),
                  Material(
                    elevation: 0.7,
                    shape: const CircleBorder(),
                    color: AppColors.white,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(
                        1000,
                      ),
                      onTap: () => Launch.dialer(
                        context: context,
                        phoneNo: "7788223844",
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Icon(
                          Icons.call,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Due Date',
                        style: AppTextStyle.normalTextStyle,
                      ),
                      Text(
                        "05 Jun 23",
                        style: AppTextStyle.boldTextStyle.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Level',
                        style: AppTextStyle.normalTextStyle,
                      ),
                      Text(
                        "10",
                        style: AppTextStyle.boldTextStyle.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Days Left',
                        style: AppTextStyle.normalTextStyle,
                      ),
                      Text(
                        "23".toString(),
                        style: AppTextStyle.boldTextStyle.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
