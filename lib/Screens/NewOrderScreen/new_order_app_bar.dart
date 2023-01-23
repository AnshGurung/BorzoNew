import 'package:flutter/material.dart';

import 'new_order_screen.dart';

class NewOrderAppBar extends StatefulWidget {
  const NewOrderAppBar({super.key});

  @override
  State<NewOrderAppBar> createState() => _NewOrderAppBarState();
}

class _NewOrderAppBarState extends State<NewOrderAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).popUntil(
            (route) => route.isFirst,
          );
        },
        icon: const Icon(Icons.clear),
      ),
      title: const Text(
        'New Order',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 20),
          child: GestureDetector(
            onTap: () {
              clearDialogBox(context);
            },
            child: const Text(
              'Clear',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void clearDialogBox(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 28, bottom: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Clear form?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 24, left: 15, right: 15),
                    child: Text('All entered data will be lost'),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewOrderScreen(),
                            ),
                            (route) => route.isFirst,
                          );
                        },
                        child: Container(
                          height: 45,
                          width: 140,
                          decoration: BoxDecoration(
                            color: const Color(0xff0048ff),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                            child: Text(
                              'Clear',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(top: 18),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
}
