import 'package:borzo_app/Screens/ChatScreen/chat_screen.dart';
import 'package:borzo_app/Screens/NewOrderScreen/new_order_screen.dart';
import 'package:borzo_app/Screens/OrderScreen/order_screen.dart';
import 'package:borzo_app/Screens/ProfileScreen/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final screens = [
    const OrderScreen(),
    const ProfileScreen(),
  ];
  // void onTapped(int index) {
  //   if (index == 1) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => NewOrderScreen()));
  //   } else if (index == 2) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => ChatScreen()));
  //   } else if (index == 3) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => ProfileScreen()));
  //   } else {
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => OrderScreen()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              child: Icon(Icons.inbox_outlined),
            ),
            Icon(Icons.add_circle),
            Icon(Icons.message_outlined),
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              child: Icon(Icons.person_outline),
            ),
          ],
        ),
      ),
    );
  }
}
