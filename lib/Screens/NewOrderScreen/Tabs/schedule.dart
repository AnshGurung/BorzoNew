import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        HapticFeedback.vibrate();
        //modelBottomSheet(context);
      },
      onTap: () {
        setState(() {});
      },
      child: Container(
        height: 105,
        decoration: BoxDecoration(
          border: Border.all(
            color: (Colors.grey[200])!,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Icon(
                  Icons.calendar_month,
                  color: Colors.grey[300],
                  size: 27,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Text(
                  'Schedule',
                  style: TextStyle(
                    fontSize: 12,
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
                      backgroundColor: Colors.grey[200],
                      radius: 10,
                      child: const Center(
                        child: Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: Colors.white,
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
      ),
    );
  }
}
