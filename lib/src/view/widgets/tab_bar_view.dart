import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_calendar/src/view/widgets/day_card.dart';
import 'package:my_calendar/src/view/widgets/week_card.dart';

import '../../controller/controller.dart';

class CalendarTabsView extends StatelessWidget {
  final List<String> ofTab;
  final List<int> ofTabItems;

  const CalendarTabsView({
    super.key,
    required this.ofTab,
    required this.ofTabItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey.shade300,
          thickness: 4,
          endIndent: 120.w,
          indent: 120.w,
        ),
        TabBar(
          tabs: List.generate(
            ofTab.length,
            (index) => Text("${ofTab[index]} (${ofTabItems[index]})"),
          ),
        ),
        Expanded(
          child: TabBarView(
            children: List.generate(
              ofTab.length,
              (index) => listWidget(ofTabItems[index]),
            ),
          ),
        ),
      ],
    );
  }

  Widget listWidget(int length) {
    return ListView.builder(
        itemCount: length,
        itemBuilder: (c, i) {
          return Obx(() {
            MController mcont = MController();
            mcont = Get.find<MController>();
            return mcont.switchValue.value.isEven
                ? const DayCard()
                : const WeekCard();
          });
        });
  }
}
