import 'package:flutter/material.dart';
import 'package:borzo_app/Screens/NewOrderScreen/Map/map.dart';
import 'package:flutter/cupertino.dart';

import '../../../Widgets/custom_text_form_field.dart';

class DeliveryPoint extends StatefulWidget {
  DeliveryPoint({
    super.key,
    required this.isDeliverNow,
    required this.isSchedule,
    this.location,
  });

  bool isDeliverNow;
  bool isSchedule;
  String? location = '';

  @override
  State<DeliveryPoint> createState() => _DeliveryPointState();
}

class _DeliveryPointState extends State<DeliveryPoint> {
  //CONTROLLERS
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController contactPersonController = TextEditingController();
  TextEditingController orderNumberController = TextEditingController();
  TextEditingController instructionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();

  //BOOLEANS
  bool isVisible = false;
  bool isPointVisible = true;
  bool optimizeRouteValue = false;
  bool isChecked = false;
  bool isCollectCashChecked = false;

  //INTEGERS
  int index = 1;
  int? currentIndex;

  //STRINGS
  String instruction = 'Instruction for the courier';

  //FUNCTIONS
  addDeliveryPoint() {
    setState(() {
      index = index + 1;
      currentIndex = index;
    });
  }

  removeDeliveryPoint() {
    if (index >= 2) {
      setState(() {
        index = index - 1;
        currentIndex = index;
      });
    }
  }

  onChangedFuntion1(bool optimizeRoute) {
    setState(() {
      optimizeRouteValue = optimizeRoute;
    });
  }

  setLocation() {
    setState(() {
      widget.location == null
          ? addressController
          : addressController.text = widget.location!;
    });
  }

  @override
  Widget build(BuildContext context) {
    setLocation();
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: index,
            itemBuilder: (context, index) {
              return deliveryPoint(index);
            }),

        //ADD A DELIVERY POINT BUTTON
        GestureDetector(
          onTap: () {
            addDeliveryPoint();
          },
          child: Container(
            margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 8),
                  child: Icon(
                    Icons.add_rounded,
                    color: Colors.grey[500],
                  ),
                ),
                const Text(
                  'Add a Delivery Point',
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        //OMTIMISE THE ROOT OPTION
        index >= 2
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    customSwitch('Optimize the Route', optimizeRouteValue,
                        onChangedFuntion1),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: Text(
                            'Our algorithm will optimize the route points, ensuring the route is more convenient for the courier and cheaper for you. Use if particular sequence of route does not matter.',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : const SizedBox()
      ],
    );
  }

  //CUSTOM SWITCH
  Widget customSwitch(String text, bool val, Function onChangedMethod) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        CupertinoSwitch(
            activeColor: const Color(0xff0048ff),
            trackColor: Colors.grey[300],
            value: val,
            onChanged: (newValue) {
              onChangedMethod(newValue);
            })
      ],
    );
  }

  Widget instructionSheet() => StatefulBuilder(builder: (context, modalState) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 30),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 5,
                      width: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Instructions for the courier',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              height: 40,
                              width: 190,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isCollectCashChecked
                                    ? Colors.black
                                    : Colors.grey[200],
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 7),
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Checkbox(
                                        checkColor: Colors.black,
                                        activeColor: Colors.white,
                                        value: isCollectCashChecked,
                                        onChanged: (value) {
                                          print(isCollectCashChecked);
                                          modalState(() {
                                            isCollectCashChecked = value!;
                                            print(isCollectCashChecked);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Collect cash on delivery',
                                    style: TextStyle(
                                      color: isCollectCashChecked
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              height: 40,
                              width: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[200],
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 7),
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Checkbox(
                                        activeColor: const Color(0xff0048ff),
                                        value: isChecked,
                                        onChanged: (value) {
                                          modalState(() {
                                            isChecked = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Buy for me',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Visibility(
                          visible: isCollectCashChecked,
                          child: Column(
                            children: [
                              CustomTextFormField(
                                textController: amountController,
                                isnumber: true,
                                lableText: 'Amount',
                              ),
                              CustomTextFormField(
                                textController: cardNumberController,
                                isnumber: false,
                                lableText: 'Card or wallet number',
                              ),
                            ],
                          ),
                        ),
                        CustomTextFormField(
                          textController: instructionController,
                          hintText: 'For example, call in 30 minutes',
                          isnumber: false,
                          lableText: 'Instruction for the courier',
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCollectCashChecked
                            ? instruction = 'Collect cash on delivery'
                            : instruction = 'Instruction for the courier';
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(20, 35, 20, 10),
                      decoration: BoxDecoration(
                          color: const Color(0xff0048ff),
                          borderRadius: BorderRadius.circular(30)),
                      height: 50,
                      child: const Center(
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      });

  //DELIVERY POINT
  Widget deliveryPoint(int count) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: GestureDetector(
            onTap: () {
              setState(() {
                isPointVisible = !isPointVisible;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 13,
                    backgroundColor: Colors.black,
                    child: Text(
                      '${count + 2}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Delivery point',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: isPointVisible,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  //DIVIDER (VERTICAL)
                  const VerticalDivider(
                    color: Colors.black,
                    width: 28,
                    indent: 15,
                    thickness: 2.2,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 19,
                      ),
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            //ADDRESS TEXTFIELD
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LocationMap(
                                        isDeliverNow: widget.isDeliverNow,
                                        isSchedule: widget.isSchedule,
                                        locationController: addressController,
                                      ),
                                    ),
                                  );
                                },
                                child: CustomTextFormField(
                                  isEnabled: false,
                                  isnumber: false,
                                  textController: addressController,
                                  hintText: 'Address',
                                  suffixicon: Icons.location_on_outlined,
                                ),
                              ),
                            ),
                            widget.isDeliverNow
                                ? Container(
                                    margin: const EdgeInsets.only(
                                        right: 20, top: 5, bottom: 10),
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffe5ecff),
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        //crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(right: 15),
                                            child: Icon(
                                              Icons.timer,
                                              color: Color(0xff0048ff),
                                              size: 27,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Enter the address to find out when the courier will arrive',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey[800],
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : const SizedBox(),

                            //PHONE NUMBER TEXTFIELD
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: SizedBox(
                                height: 60,
                                child: CustomTextFormField(
                                  isnumber: true,
                                  textController: phoneNumberController,
                                  hintText: 'Phone',
                                  suffixicon: Icons.person_outline,
                                ),
                              ),
                            ),
                            widget.isSchedule
                                ? Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: CustomTextFormField(
                                      isnumber: false,
                                      hintText:
                                          'When to arrive at this address',
                                      textController: timeController,
                                      suffixicon: Icons.access_time_rounded,
                                    ),
                                  )
                                : const SizedBox(),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet<dynamic>(
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  )),
                                  context: context,
                                  builder: (context) => instructionSheet(),
                                );
                              },
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8, top: 5),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.directions_run_rounded,
                                            color: Colors.grey[800],
                                          ),
                                          Expanded(
                                            child: Text(
                                              instruction,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey[800],
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Colors.grey[400],
                                            size: 21,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                      ),
                                      child: Row(
                                        children: const [
                                          Expanded(
                                            child: Text(
                                              'The courier will buy out the goods, receive cash or carry out other instruction.',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 15, top: 10),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                child: Row(
                                  children: [
                                    const Text(
                                      'Additional Services',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    isVisible == true
                                        ? const Icon(
                                            Icons.keyboard_arrow_up_rounded,
                                            color: Colors.grey,
                                          )
                                        : const Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Colors.grey,
                                          )
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                              visible: isVisible,
                              child: Column(
                                children: [
                                  CustomTextFormField(
                                    isnumber: false,
                                    textController: contactPersonController,
                                    hintText: 'Contact Person',
                                  ),
                                  CustomTextFormField(
                                    isnumber: false,
                                    textController: orderNumberController,
                                    hintText: 'Your Order Number',
                                  ),
                                ],
                              ),
                            ),
                            index >= 2
                                ? GestureDetector(
                                    onTap: () {
                                      showAlertDialogBox(context);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 8, bottom: 8, right: 20),
                                      child: const Text(
                                        'Remove address',
                                        style: TextStyle(
                                          color: Color(0xff0048ff),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showAlertDialogBox(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 28, bottom: 22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Image(
                  image: AssetImage('assets/Alert.png'),
                  height: 50,
                  width: 50,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Expanded(
                        child: Center(
                          child: Text(
                            'Do you really want to remove address?',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    removeDeliveryPoint();
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 45,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 45,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        'Cancel',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
