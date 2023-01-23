import 'package:borzo_app/Screens/Country%20and%20Region/country.dart';
import 'package:borzo_app/Screens/Country%20and%20Region/region.dart';
import 'package:flutter/material.dart';

class WelcomeToBorzo extends StatefulWidget {
  String? flagImage;
  String? countryName;
  int? currentIndex;
  String? question;
  String? welcome;
  String? answer;
  WelcomeToBorzo({
    super.key,
    this.flagImage = 'assets/flags/india.png',
    this.countryName = 'India',
    this.currentIndex = 0,
    this.question = 'Are you in ',
    this.welcome = 'Welcome to Borzo!',
    this.answer = 'Yes',
  });

  @override
  State<WelcomeToBorzo> createState() => _WelcomeToBorzoState();
}

class _WelcomeToBorzoState extends State<WelcomeToBorzo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Image(
                    image: AssetImage('assets/borzo.png'),
                    height: 45,
                    width: 120,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Text(
                  widget.welcome!,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Country(
                          isProfile: false,
                          countryIndex: widget.currentIndex,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        margin: const EdgeInsets.only(top: 20),
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.question!,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                height: 16,
                                width: 21,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      widget.flagImage!,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Text(
                                ' ${widget.countryName!}?',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Region(
                      isProfile: false,
                      countryName: widget.countryName!,
                      countryIndex: widget.currentIndex,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xff0048ff),
                ),
                height: 50,
                child: Center(
                  child: Text(
                    widget.answer!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
