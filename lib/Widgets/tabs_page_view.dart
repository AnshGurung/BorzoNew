import 'package:flutter/material.dart';

class TabsPageView extends StatefulWidget {
  TabsPageView({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
  });

  IconData icon;
  String title;
  String text;

  @override
  State<TabsPageView> createState() => _TabsPageViewState();
}

class _TabsPageViewState extends State<TabsPageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Icon(
              widget.icon,
              size: 30,
              color: const Color(0xff0048ff),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text(
              widget.text,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              'from ₹ 45',
              style: TextStyle(fontSize: 21),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 5),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: Color(0xffe5ecff),
                    child: Icon(
                      Icons.directions_run,
                      color: Color(0xff0048ff),
                      size: 16,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 14,
                  backgroundColor: Color(0xffe5ecff),
                  child: Icon(
                    Icons.directions_bike,
                    color: Color(0xff0048ff),
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
          const Text('Deliver by 2-wheelers or public transport'),
          const Divider(),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey[100]),
            height: 24,
            width: 45,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.fitness_center,
                    color: Colors.grey,
                    size: 14,
                  ),
                  Icon(
                    Icons.fitness_center,
                    color: Colors.grey,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
          const Text('Upto 20 kg'),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.grey[100],
              child: const Icon(
                Icons.shield,
                color: Colors.grey,
                size: 16,
              ),
            ),
          ),
          const Text('You can choose insurance amount'),
          const Divider(),
        ],
      ),
    );
  }
}
