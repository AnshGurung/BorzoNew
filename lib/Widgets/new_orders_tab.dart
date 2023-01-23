import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewOrdersTab extends StatefulWidget {
  NewOrdersTab({
    super.key,
    required this.tabIcon,
    required this.tabText,
    required this.tabIconColor,
    required this.tabColor,
    required this.arrowIconColor,
    required this.circleColor,
    required this.tabsBorder,
  });

  IconData tabIcon;
  String tabText;
  Color tabColor;
  Color tabIconColor;
  Color arrowIconColor;
  Color circleColor;
  BoxBorder tabsBorder;

  @override
  State<NewOrdersTab> createState() => _NewOrdersTabState();
}

class _NewOrdersTabState extends State<NewOrdersTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 95,
      decoration: BoxDecoration(
        color: widget.tabColor,
        borderRadius: BorderRadius.circular(15),
        border: widget.tabsBorder,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Icon(
                widget.tabIcon,
                color: widget.tabIconColor,
                size: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                widget.tabText,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              children: [
                const Text(
                  'from',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  ' ₹ 45',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: CircleAvatar(
                    backgroundColor: widget.circleColor,
                    radius: 10,
                    child: Center(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: widget.arrowIconColor,
                        size: 21,
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
  }
}
