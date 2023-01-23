import 'package:borzo_app/Screens/OrderScreen/order_screen.dart';
import 'package:borzo_app/WelcomePages/welcome_to_borzo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/MainScreen/main_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  final showCreateOrder = pref.getBool('showCreateOrder') ?? false;
  runApp(MyApp(showCreateOrder: showCreateOrder));
}

class MyApp extends StatelessWidget {
  final bool showCreateOrder;
  const MyApp({
    super.key,
    required this.showCreateOrder,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showCreateOrder ? const OrderScreen() : WelcomeToBorzo(),
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context).textTheme,
      )),
    );
  }
}
