import 'package:borzo_app/Widgets/new_orders_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Tabs extends StatefulWidget {
  Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  bool isDeliverNowClicked = true;
  bool isScheduleClicked = false;

  void deliverNowModalSheet(BuildContext context) {
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.95,
          minChildSize: 0.95,
          builder: (_, controller) => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: ListView(
              controller: controller,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 5,
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onLongPress: () {
              deliverNowModalSheet(context);
            },
            onTap: () {
              setState(() {
                isDeliverNowClicked
                    ? Container()
                    : isScheduleClicked = !isScheduleClicked;
              });
              setState(() {
                isDeliverNowClicked
                    ? Container()
                    : isDeliverNowClicked = !isDeliverNowClicked;
              });
            },
            child: NewOrdersTab(
              tabIcon: Icons.timer,
              tabText: 'Deliver Now',
              tabIconColor: isDeliverNowClicked
                  ? const Color(0xff0048ff)
                  : Colors.grey[200]!,
              tabColor: isDeliverNowClicked ? Colors.grey[200]! : Colors.white,
              arrowIconColor:
                  isDeliverNowClicked ? Colors.grey[200]! : Colors.white,
              circleColor:
                  isDeliverNowClicked ? Colors.white : Colors.grey[200]!,
              tabsBorder: Border.all(color: Colors.grey[200]!),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: GestureDetector(
            onLongPress: () {
              HapticFeedback.vibrate();
              //modelBottomSheet(context);
            },
            onTap: () {
              setState(() {
                isScheduleClicked
                    ? Container()
                    : isDeliverNowClicked = !isDeliverNowClicked;
              });
              setState(() {
                isScheduleClicked
                    ? Container()
                    : isScheduleClicked = !isScheduleClicked;
              });
            },
            child: NewOrdersTab(
              tabIcon: Icons.calendar_month,
              tabText: 'Schedule',
              tabIconColor: isScheduleClicked
                  ? const Color(0xff0048ff)
                  : Colors.grey[200]!,
              tabColor: isScheduleClicked ? Colors.grey[200]! : Colors.white,
              arrowIconColor:
                  isScheduleClicked ? Colors.grey[200]! : Colors.white,
              circleColor: isScheduleClicked ? Colors.white : Colors.grey[200]!,
              tabsBorder: Border.all(color: Colors.grey[200]!),
            ),
          ),
        ),
      ],
    );
  }
}
