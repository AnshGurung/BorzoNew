import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryNow extends StatefulWidget {
  const DeliveryNow({super.key});

  @override
  State<DeliveryNow> createState() => _DeliveryNowState();
}

class _DeliveryNowState extends State<DeliveryNow> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        
      },
      child: Container(
        height: 105,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Icon(
                  Icons.timer,
                  color: Color(0xff0048ff),
                  size: 27,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Text(
                  'Deliver Now',
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
                      backgroundColor: Colors.white,
                      radius: 10,
                      child: Center(
                        child: Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: Colors.grey[200],
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
