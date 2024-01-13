import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_calendar/src/shared/style/app_colors.dart';

class WeekCard extends StatelessWidget {
  const WeekCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: AppColors.white,
        elevation: 1,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 14.h,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5.r),
              ),
              height: 70.h,
              width: 5.w,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Builder(
                    builder: (context) {
                      final textStyle = TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      );
                      return Column(
                        children: [
                          Text(
                            '24',
                            textAlign: TextAlign.center,
                            style: textStyle.copyWith(
                              fontSize: 22.sp,
                            ),
                          ),
                          Text(
                            "Apr".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: textStyle.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const Cell(
                    name: 'HRD',
                    count: 2,
                  ),
                  const Cell(
                    name: 'Tech 1',
                    count: 3,
                  ),
                  const Cell(
                    name: 'Follow up',
                    count: 3,
                  ),
                  Cell(
                    name: 'Total',
                    count: 4,
                    bgColor: Colors.grey[800],
                    textColor: Colors.white.withOpacity(0.8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Cell extends StatelessWidget {
  const Cell({
    super.key,
    required this.name,
    required this.count,
    this.bgColor,
    this.textColor,
  });

  final String name;
  final int count;
  final Color? bgColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    const radius = 26.0;
    const width = 1.5;
    final textStyle = TextStyle(
      fontSize: 16.sp,
      color: Colors.grey[700],
      fontWeight: FontWeight.w600,
    );
    return Column(
      children: [
        CircleAvatar(
          backgroundColor:
              bgColor == null ? Colors.grey.shade400 : Colors.white,
          radius: radius,
          child: CircleAvatar(
            backgroundColor: bgColor ?? Colors.white,
            radius: radius - width,
            child: Text(
              '$count',
              style: textStyle.copyWith(color: textColor),
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          name,
          style: textStyle,
        ),
      ],
    );
  }
}
