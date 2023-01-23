import 'package:borzo_app/Screens/OrderScreen/order_screen.dart';
import 'package:borzo_app/WelcomePages/IntroductionScreen/intro_page1.dart';
import 'package:borzo_app/WelcomePages/IntroductionScreen/intro_page2.dart';
import 'package:borzo_app/WelcomePages/IntroductionScreen/intro_page3.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  bool isLastPage = false;
  final pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 70),
        child: PageView(
          controller: pageController,
          onPageChanged: (index) => setState(() {
            isLastPage = index == 2;
          }),
          children: const [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? GestureDetector(
              onTap: () async {
                final pref = await SharedPreferences.getInstance();
                pref.setBool('showCreateOrder', true);
                // ignore: use_build_context_synchronously
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderScreen(),
                    ),
                    (route) => false);
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xff0048ff),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    'Let\'s start!',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          : Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final pref = await SharedPreferences.getInstance();
                          pref.setBool('showCreateOrder', true);
                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OrderScreen(),
                              ),
                              (route) => false);
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      Center(
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 3,
                          effect: SlideEffect(
                            spacing: 13,
                            dotHeight: 8,
                            dotWidth: 8,
                            activeDotColor: const Color(0xff0048ff),
                            dotColor: Colors.grey[400]!,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            color: Color(0xff0048ff),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
