import 'package:borzo_app/Screens/NewOrderScreen/Tabs/delivery_now.dart';
import 'package:borzo_app/Screens/NewOrderScreen/Tabs/schedule.dart';
import 'package:borzo_app/Screens/NewOrderScreen/Tabs/tabs.dart';
import 'package:borzo_app/Screens/NewOrderScreen/additional_services.dart';
import 'package:borzo_app/Screens/NewOrderScreen/new_order_app_bar.dart';
import 'package:borzo_app/Screens/NewOrderScreen/package.dart';
import 'package:borzo_app/Screens/NewOrderScreen/payment.dart';
import 'package:borzo_app/Screens/NewOrderScreen/Points/pickup_point.dart';
import 'package:borzo_app/Screens/NewOrderScreen/weight.dart';
import 'package:borzo_app/Widgets/tabs_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Widgets/new_orders_tab.dart';
import 'Points/delivery_point.dart';
import 'book_a_courier.dart';

// ignore: must_be_immutable
class NewOrderScreen extends StatefulWidget {
  NewOrderScreen({
    super.key,
    this.location,
    this.pickupLocation,
    //required this.controller,
  });

  String? location;
  String? pickupLocation;
  // TextEditingController controller;

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  //PAGE CONTROLLER
  final slideController = PageController();

  //BOOLEANS
  bool isDeliverNowClicked = true;
  bool isScheduleClicked = false;

  //MODAL BOTTOM SHEET
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
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 5,
                  width: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: PageView(
                    controller: slideController,
                    children: [
                      //CUSTOM WIDGET(DELIVER NOW)
                      TabsPageView(
                        icon: Icons.timer,
                        title: 'Deliver Now',
                        text:
                            'We will assign the nearest courier to pick-up and deliver as soon as possible.',
                      ),

                      //CUSTOM WIDGET(SCHEDULE)
                      TabsPageView(
                        icon: Icons.calendar_month,
                        title: 'Schedule',
                        text:
                            'We will arrive at each address at specified times.',
                      ),
                    ],
                  ),
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller: slideController,
                    count: 2,
                    effect: SlideEffect(
                      spacing: 13,
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: const Color(0xff0048ff),
                      dotColor: Colors.grey[400]!,
                    ),
                    onDotClicked: (index) => slideController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeIn,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(15, 25, 15, 15),
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xff0048ff),
                    ),
                    child: const Center(
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: NewOrderAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        //TABS
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onLongPress: () {
                                  HapticFeedback.vibrate();
                                  deliverNowModalSheet(context);
                                },
                                onTap: () {
                                  setState(() {
                                    isDeliverNowClicked
                                        ? deliverNowModalSheet(context)
                                        : isScheduleClicked =
                                            !isScheduleClicked;
                                  });
                                  setState(() {
                                    isDeliverNowClicked
                                        ? Container()
                                        : isDeliverNowClicked =
                                            !isDeliverNowClicked;
                                  });
                                },
                                child: NewOrdersTab(
                                  tabIcon: Icons.timer,
                                  tabText: 'Deliver Now',
                                  tabIconColor: isDeliverNowClicked
                                      ? const Color(0xff0048ff)
                                      : Colors.grey[200]!,
                                  tabColor: isDeliverNowClicked
                                      ? Colors.grey[200]!
                                      : Colors.white,
                                  arrowIconColor: isDeliverNowClicked
                                      ? Colors.grey[200]!
                                      : Colors.white,
                                  circleColor: isDeliverNowClicked
                                      ? Colors.white
                                      : Colors.grey[200]!,
                                  tabsBorder:
                                      Border.all(color: Colors.grey[200]!),
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
                                  deliverNowModalSheet(context);
                                },
                                onTap: () {
                                  setState(() {
                                    isScheduleClicked
                                        ? deliverNowModalSheet(context)
                                        : isDeliverNowClicked =
                                            !isDeliverNowClicked;
                                  });
                                  setState(() {
                                    isScheduleClicked
                                        ? Container()
                                        : isScheduleClicked =
                                            !isScheduleClicked;
                                  });
                                },
                                child: NewOrdersTab(
                                  tabIcon: Icons.calendar_month,
                                  tabText: 'Schedule',
                                  tabIconColor: isScheduleClicked
                                      ? const Color(0xff0048ff)
                                      : Colors.grey[200]!,
                                  tabColor: isScheduleClicked
                                      ? Colors.grey[200]!
                                      : Colors.white,
                                  arrowIconColor: isScheduleClicked
                                      ? Colors.grey[200]!
                                      : Colors.white,
                                  circleColor: isScheduleClicked
                                      ? Colors.white
                                      : Colors.grey[200]!,
                                  tabsBorder:
                                      Border.all(color: Colors.grey[200]!),
                                ),
                              ),
                            ),
                          ],
                        ),

                        //TEXT
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  isDeliverNowClicked
                                      ? 'We will assign the nearest courier to pick-up and deliver as soon as possible.'
                                      : 'We will arrive at each address at specified times.',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(
                              child: BookACourier(),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Weight(),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 25),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Hyperlocal is km based tariff. It is the best option for short distance deliveries under 5 km.',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  PickupPoint(
                    isDeliverNow: isDeliverNowClicked,
                    isSchedule: isScheduleClicked,
                    location: widget.pickupLocation,
                  ),
                  DeliveryPoint(
                    isDeliverNow: isDeliverNowClicked,
                    isSchedule: isScheduleClicked,
                    location: widget.location,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 15),
              color: Colors.grey[100],
              height: 14,
            ),
            const Package(),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 15),
              color: Colors.grey[200],
              height: 14,
            ),
            const AdditionalServices(),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 15),
              color: Colors.grey[200],
              height: 14,
            ),
            const Payment(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        height: 70,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet<dynamic>(
                  useRootNavigator: true,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  )),
                  context: context,
                  builder: (context) => Wrap(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 8, bottom: 30),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 5,
                              width: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 20, left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Delivery Fee',
                                  style: TextStyle(
                                      //fontSize: 17,
                                      ),
                                ),
                                Text(
                                  '₹ 45',
                                  style: TextStyle(
                                      //fontSize: 17,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              child: Row(
                children: [
                  Text(
                    '₹ 45',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: const Color(0xff0048ff),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  'Create Order',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
