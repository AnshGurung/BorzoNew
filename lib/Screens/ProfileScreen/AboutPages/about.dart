import 'package:borzo_app/Screens/ProfileScreen/AboutPages/report_an_issue.dart';
import 'package:borzo_app/Screens/ProfileScreen/AboutPages/service_information.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  List aboutPageLists = [
    'Service information',
    'Terms and Conditions',
    'Privacy policy',
    'Report a problem',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 15, bottom: 20),
              child: Image(
                image: AssetImage('assets/b.jpg'),
                height: 80,
                width: 80,
              ),
            ),
            const Text(
              'Borzo',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                'Version 1.75.1',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: aboutPageLists.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ServiceInformation(),
                          ),
                        );
                      } else if (index == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReportAnIssue(),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 16, bottom: 16, left: 20),
                      child: Text(
                        aboutPageLists[index],
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
