part of 'calendar_view_barrel.dart';

@RoutePage()
class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with SingleTickerProviderStateMixin {
  late MController mController;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    mController = Get.put(MController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: MyAppBar(
          data: mController.switchValue.value.isEven
              ? 'In App Calendar'
              : 'My Calendar',
        ),
        body: DefaultTabController(
          length: ETabs.values.length,
          child: pageBody(),
        ),
      ),
    );
  }

  Widget pageBody() {
    return Column(
      children: [
        horizontalCalendar(),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(blurRadius: 20.0, color: Colors.grey),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
              ),
            ),
            child: CalendarTabsView(
              ofTab: [
                ETabs.all.text,
                ETabs.hrd.text,
                ETabs.tech1.text,
                ETabs.followUp.text,
              ],
              ofTabItems: const [10, 2, 3, 5],
            ),
          ),
        )
      ],
    );
  }

  Widget horizontalCalendar() {
    return Container(
      color: Colors.grey.shade200,
      child: TableCalendar<double>(
        firstDay: firstDay,
        lastDay: lastDay,
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        rangeStartDay: _rangeStart,
        rangeEndDay: _rangeEnd,
        calendarFormat: mController.switchValue.value.isEven
            ? CalendarFormat.twoWeeks
            : CalendarFormat.week,
        rangeSelectionMode: mController.switchValue.value.isOdd
            ? RangeSelectionMode.toggledOn
            : RangeSelectionMode.toggledOff,
        startingDayOfWeek: StartingDayOfWeek.monday,
        weekendDays: const [
          DateTime.sunday,
        ],
        calendarStyle: CalendarStyle(
          tablePadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 24,
          ),
          selectedDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          rangeHighlightColor: Theme.of(context).primaryColor.withOpacity(0.3),
          todayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2.5,
              color: Theme.of(context).primaryColor,
            ),
          ),
          rangeStartDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          rangeEndDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
        ),
        headerStyle: const HeaderStyle(
          headerPadding: EdgeInsets.all(12),
          formatButtonVisible: false,
          leftChevronVisible: false,
          rightChevronVisible: false,
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekendStyle: TextStyle(
            color: Colors.red,
          ),
        ),
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              _rangeStart = null; // Important to clean those
              _rangeEnd = null;
              mController.switchValue.value.isEven
                  ? RangeSelectionMode.toggledOn
                  : RangeSelectionMode.toggledOff;
            });
          }
        },
        onRangeSelected: (start, end, focusedDay) {
          setState(() {
            _selectedDay = null;
            _focusedDay = focusedDay;
            _rangeStart = start;
            _rangeEnd = end;
            mController.switchValue.value.isEven
                ? RangeSelectionMode.toggledOn
                : RangeSelectionMode.toggledOff;
          });
        },
      ),
    );
  }
}
