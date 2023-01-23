import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String selectedMethod = 'Cash';
  String paymentMethod = 'Cash';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  //color: Colors.blue,
                  height: 50,
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Promocode',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 80,
                height: 30,
                child: const Center(
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => showModalBottomSheet<dynamic>(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              )),
              context: context,
              builder: (context) => buildSheet(),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 5, bottom: 10),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(Icons.payments_rounded),
                      ),
                      Text(paymentMethod),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.grey[600],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSheet() => StatefulBuilder(builder: (context, modalState) {
        return Wrap(
          children: [
            Center(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 23),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 5,
                    width: 40,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Text(
                      'Payment methods',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.grey[200],
                    highlightColor: Colors.grey[200],
                    onTap: () {
                      modalState(() {
                        selectedMethod = 'Cash';
                        paymentMethod = 'Cash';
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.payments_rounded,
                                color: Colors.black,
                                size: 28,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  'Cash',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          selectedMethod == 'Cash'
                              ? const Icon(
                                  Icons.done,
                                  color: Color(0xffe84780),
                                  size: 28,
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.grey[200],
                    highlightColor: Colors.grey[200],
                    onTap: () {
                      modalState(() {
                        selectedMethod = 'Credit Card';
                        paymentMethod = 'Credit Card';
                      });
                      // setState(() {
                      //   selectedMethod = 'Credit Card';
                      // });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.credit_card_rounded,
                                color: Colors.black,
                                size: 28,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  'Credit Card',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          selectedMethod == 'Credit Card'
                              ? const Icon(
                                  Icons.done,
                                  color: Color(0xffe84780),
                                  size: 28,
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 15),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          paymentMethod = selectedMethod;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Center(
                          child: Text('Done'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      });
}
