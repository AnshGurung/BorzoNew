import 'package:borzo_app/Screens/Country%20and%20Region/country.dart';
import 'package:borzo_app/Screens/Country%20and%20Region/region.dart';
import 'package:borzo_app/Screens/ProfileScreen/AboutPages/about.dart';
import 'package:borzo_app/Screens/ProfileScreen/create_account.dart';
import 'package:borzo_app/Screens/ProfileScreen/sign_in.dart';
import 'package:borzo_app/WelcomePages/welcome_to_borzo.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100, left: 20, bottom: 25),
                child: Text(
                  'Hello! ',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.grey[100],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Region(
                        isProfile: true,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(
                              Icons.public_rounded,
                              color: Colors.grey,
                            ),
                          ),
                          Text('Region'),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Mumbai',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Container(
                            height: 18,
                            width: 23,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            margin: const EdgeInsets.only(left: 10, right: 20),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  'assets/flags/india.png',
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.grey[100],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const About(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.info_outline_rounded,
                          color: Colors.grey,
                        ),
                      ),
                      Text('About'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
            child: Column(
              children: [
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => WelcomeToBorzo(),
                //       ),
                //     );
                //   },
                //   child: Container(
                //     margin: const EdgeInsets.only(bottom: 15),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(25),
                //       color: const Color(0xff0048ff),
                //     ),
                //     height: 45,
                //     child: const Center(
                //       child: Text(
                //         'TEMP',
                //         style: TextStyle(
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignIn(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xff0048ff),
                    ),
                    height: 45,
                    child: const Center(
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  highlightColor: Colors.grey[200],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccount(),
                      ),
                    );
                  },
                  child: const SizedBox(
                    height: 45,
                    child: Center(
                      child: Text(
                        'Create account',
                        style: TextStyle(
                          color: Color(0xff0048ff),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
