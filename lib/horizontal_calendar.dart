import 'package:flutter/material.dart';
import 'package:flutter_horizontal_calendar/utils/app_color.dart';
import 'package:intl/intl.dart';

class HorizontalCalender extends StatefulWidget {
  const HorizontalCalender(
      {super.key, required this.onSelected, this.child, this.header});
  final Widget Function(
    DateTime date,
    bool isSelected,
  )? child;
  final Widget Function(DateTime date)? header;
  final Function(DateTime date) onSelected;
  @override
  State<HorizontalCalender> createState() => _HorizontalCalenderState();
}

class _HorizontalCalenderState extends State<HorizontalCalender> {
  final calenderPageController = PageController(initialPage: 1);
  List<List<DateTime>> dateList = [];
  String scrollMonthYear = "";
  DateTime selectedDate = DateTime.now();
  void initCalender() {
    final now = DateTime.now();
    scrollMonthYear = DateFormat('MMMM, yyyy').format(now);
    setState(() {});
    DateTime lastMonday = now;
    //Get last monday
    for (int i = 0; i < 7; i++) {
      final previousDate = now.subtract(Duration(days: i));
      if (previousDate.weekday == DateTime.monday) {
        lastMonday = previousDate;
        break;
      }
    }
    //Get last week
    List<DateTime> lastWeekDateList = [];
    for (int i = 0; i < 7; i++) {
      final date = lastMonday.add(Duration(days: i - 7));
      lastWeekDateList.add(date);
    }
    dateList.add(lastWeekDateList);

    //Get current week
    List<DateTime> thisWeekDateList = [];
    for (int i = 0; i < 7; i++) {
      final date = lastMonday.add(Duration(days: i));

      thisWeekDateList.add(date);
    }
    dateList.add(thisWeekDateList);

    //Get next week
    List<DateTime> nextWeekDateList = [];
    for (int i = 0; i < 7; i++) {
      final date = lastMonday.add(Duration(days: i + 7));
      nextWeekDateList.add(date);
    }
    dateList.add(nextWeekDateList);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initCalender();
      calenderPageController.addListener(() {
        if (calenderPageController.page == (dateList.length - 1)) {
          getNextWeek();
        }
        if (calenderPageController.page == 0) {
          getPreviousWeek();
        }
      });
    });
  }

  void getNextWeek() {
    final lastMonday = dateList[dateList.length - 1][0];

    //Get next week
    List<DateTime> nextWeekDateList = [];
    for (int i = 0; i < 7; i++) {
      final date = lastMonday.add(Duration(days: i + 7));
      nextWeekDateList.add(date);
    }
    dateList.add(nextWeekDateList);
    setState(() {});
    calenderPageController.jumpToPage(dateList.length - 2);
  }

  void getPreviousWeek() {
    final lastMonday = dateList[0][0];
    List<DateTime> lastWeekDateList = [];
    for (int i = 0; i < 7; i++) {
      final date = lastMonday.add(Duration(days: i - 7));
      lastWeekDateList.add(date);
    }
    dateList.insert(0, lastWeekDateList);
    setState(() {});
    calenderPageController.jumpToPage(1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.header != null
            ? widget.header!(selectedDate)
            : Text(
                scrollMonthYear,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 60,
          child: PageView.builder(
              controller: calenderPageController,
              itemCount: dateList.length,
              onPageChanged: (page) {
                scrollMonthYear =
                    DateFormat('MMMM, yyyy').format(dateList[page].last);
                setState(() {});
              },
              itemBuilder: (context, i) {
                final currentSelectedDate = DateTime(
                    selectedDate.year, selectedDate.month, selectedDate.day);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: dateList[i]
                        .map(
                          (date) => GestureDetector(
                            onTap: () {
                              selectedDate = date;
                              widget.onSelected(selectedDate);
                              setState(() {});
                            },
                            child: widget.child != null
                                ? widget.child!(
                                    date,
                                    DateTime(date.year, date.month, date.day)
                                        .isAtSameMomentAs(currentSelectedDate))
                                : CalenderItemWidget(
                                    date: date,
                                    isSelected: DateTime(
                                            date.year, date.month, date.day)
                                        .isAtSameMomentAs(currentSelectedDate),
                                  ),
                          ),
                        )
                        .toList(),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class CalenderItemWidget extends StatelessWidget {
  const CalenderItemWidget({
    super.key,
    required this.date,
    this.isSelected = false,
  });

  final DateTime date;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? AppColor.purplePrimaryColor : Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${date.day}",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColor.basicWhite : AppColor.basicBlack),
          ),
          Text(
            DateFormat('E').format(date),
            style: TextStyle(
                fontSize: 12,
                color: isSelected ? AppColor.basicWhite : AppColor.basicBlack),
          ),
        ],
      ),
    );
  }
}
