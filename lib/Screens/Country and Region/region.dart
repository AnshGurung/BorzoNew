import 'package:borzo_app/WelcomePages/IntroductionScreen/introduction_screen.dart';
import 'package:flutter/material.dart';

import 'country.dart';

class Region extends StatefulWidget {
  Region({
    super.key,
    this.countryName = 'India',
    this.countryIndex = 0,
    required this.isProfile,
  });

  String? countryName;
  int? countryIndex;
  bool isProfile;

  @override
  State<Region> createState() => _RegionState();
}

class _RegionState extends State<Region> {
  int? cityIndex = 0;
  List cities = [
    'Mumbia',
    'Bengaluru',
    'Delhi/NCR',
    'Hyderabad',
    'Ahmedabad',
    'Chennai',
    'Kolkata',
    'Surat',
    'Pune',
    'Jaipur',
    'Goa',
    'Kanpur',
    'Indore',
    'Bhopai',
    'Chandigarh',
    'Lucknow',
    'Dehradun',
    'Udaipur',
    'Amritsar',
    'Jodhpur',
    'Kota',
    'Guwahati',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: widget.isProfile ? true : false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Select city',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Country(
                        isProfile: widget.isProfile,
                        countryIndex: widget.countryIndex,
                      ),
                    ),
                  );
                },
                child: Text(
                  widget.countryName!,
                  style: const TextStyle(
                    color: Color(0xff0048ff),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ScrollConfiguration(
        behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
        child: ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    cityIndex = index;
                  });
                  widget.isProfile
                      ? Navigator.pop(context)
                      : Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const IntroductionScreen(),
                          ),
                          (route) => false);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 13, 20, 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cities[index],
                      ),
                      cityIndex == index
                          ? const Icon(
                              Icons.done,
                              color: Color(0xffe84780),
                              size: 23,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
