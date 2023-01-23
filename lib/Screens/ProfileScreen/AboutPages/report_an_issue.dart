import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReportAnIssue extends StatefulWidget {
  const ReportAnIssue({super.key});

  @override
  State<ReportAnIssue> createState() => _ReportAnIssueState();
}

class _ReportAnIssueState extends State<ReportAnIssue> {
  File? image;
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTmp = File(image.path);
    setState(() {
      this.image = imageTmp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Report an issue',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: const TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: 'Choose a subject',
                    hintStyle: TextStyle(color: Colors.black),
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: TextField(
                  cursorColor: const Color(0xff0048ff),
                  maxLines: 7,
                  decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff0048ff),
                      ),
                    ),
                    hintText: 'Tell us what happened',
                    hintStyle: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              image != null
                  ? const Text(
                      'Attached screenshot',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    )
                  : const Text(
                      'Do you want to upload screenshot?',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
              image != null
                  ? Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          margin: const EdgeInsets.only(top: 15),
                          height: 110,
                          width: 110,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Image.file(
                              image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 85,
                          top: 20,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                image = null;
                              });
                            },
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.grey[100],
                              child: const Center(
                                child: Icon(
                                  Icons.clear,
                                  size: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : GestureDetector(
                      onTap: () {
                        pickImage();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 43,
                        width: 105,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.save_alt,
                              size: 20,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                'Upload',
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xff0048ff),
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Center(
          child: Text(
            'Submit',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
