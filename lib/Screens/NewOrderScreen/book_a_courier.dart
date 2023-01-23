import 'package:flutter/material.dart';

class BookACourier extends StatefulWidget {
  const BookACourier({super.key});

  @override
  State<BookACourier> createState() => _BookACourierState();
}

class _BookACourierState extends State<BookACourier> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<dynamic>(
          useRootNavigator: true,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          )),
          context: context,
          builder: (context) => bookSheet(),
        );
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Book a courier',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.grey[400],
              size: 21,
            )
          ],
        ),
      ),
    );
  }

  Widget bookSheet() => Wrap(
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
              const Padding(
                padding: EdgeInsets.only(bottom: 20, left: 16),
                child: Text(
                  'Delivery option',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: ListTile(
                  title: const Text('Book a Courier'),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Hyperlocal is km based tariff. It is the best option for short distance deliveries under 5 km.',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: const Icon(
                    Icons.done,
                    color: Color(0xff0048ff),
                  ),
                ),
              ),
            ],
          )
        ],
      );
}
