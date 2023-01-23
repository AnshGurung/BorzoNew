import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdditionalServices extends StatefulWidget {
  const AdditionalServices({super.key});

  @override
  State<AdditionalServices> createState() => _AdditionalServicesState();
}

class _AdditionalServicesState extends State<AdditionalServices> {
  bool deliveryBagValue = false;
  bool notifyRecipientsValue = true;

  onChangedFunctionforBag(bool deliveryBag) {
    setState(() {
      deliveryBagValue = deliveryBag;
    });
  }

  onChangedFunctionforNotification(bool notifyRecipients) {
    setState(() {
      notifyRecipientsValue = notifyRecipients;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom:10),
            child: Text(
              'Additional services',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          customSwitch('Prefer Courier with Delivery bag', deliveryBagValue,
              onChangedFunctionforBag),
          Divider(
            color: Colors.grey[300],
          ),
          customSwitch('Notify recipients by SMS', notifyRecipientsValue,
              onChangedFunctionforNotification),
        ],
      ),
    );
  }

  Widget customSwitch(String text, bool val, Function onChangedMethod) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(text)),
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
}
