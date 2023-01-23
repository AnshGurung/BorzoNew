import 'package:borzo_app/Screens/NewOrderScreen/Map/map.dart';
import 'package:borzo_app/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PickupPoint extends StatefulWidget {
  PickupPoint({
    super.key,
    required this.isDeliverNow,
    required this.isSchedule,
    this.location,
  });

  bool isDeliverNow;
  bool isSchedule;
  String? location;

  @override
  State<PickupPoint> createState() => _PickupPointState();
}

class _PickupPointState extends State<PickupPoint> {
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController contactPersonController = TextEditingController();
  TextEditingController orderNumberController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  bool isChecked = false;
  bool isVisible = false;
  bool isPointVisible = true;

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
        GestureDetector(
          onTap: () {
            setState(() {
              isPointVisible = !isPointVisible;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.black,
                  child: Text(
                    '1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Pickup point',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
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
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LocationMap(
                                        isDeliverNow: widget.isDeliverNow,
                                        isSchedule: widget.isSchedule,
                                        locationController: addressController,
                                        ispickupPoint: true,
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: CustomTextFormField(
                                isnumber: true,
                                hintText: 'Phone',
                                textController: phoneNumberController,
                                suffixicon: Icons.person_outline_rounded,
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
                                              'Instructions for the courier',
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
                                        top: 5,
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

  Widget instructionSheet() => StatefulBuilder(builder: (context, modalState) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
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
                    const Text(
                      'Instructions for the courier',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                  }),
                            ),
                          ),
                          const Text(
                            'Buy for me',
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 65,
                      child: TextField(
                        cursorColor: const Color(0xff0048ff),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff0048ff),
                            ),
                          ),
                          labelText: 'Instruction for the courier',
                          labelStyle: const TextStyle(color: Colors.grey),
                          hintText: 'For example, call in 30 minutes',
                          hintStyle: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 35, bottom: 10),
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
              ),
            ],
          ),
        );
      });
}
