import 'package:borzo_app/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({super.key, required this.isPerson});

  bool isPerson;
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.isPerson
                          ? const Text(
                              'Your Phone',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : const Text(
                              'Your email',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: widget.isPerson
                                  ? const Text(
                                      'An SMS verification code will be sent to this number',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    )
                                  : const Text(
                                      'Enter the email address you used to sign up - we\'ll send you a password reset link',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: widget.isPerson
                      ? TextFormField(
                          initialValue: '+91 ',
                          autofocus: true,
                          cursorColor: const Color(0xff0048ff),
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff0048ff),
                              ),
                            ),
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        )
                      : CustomTextFormField(
                          textController: emailController,
                          isnumber: false,
                          hintText: 'E-mail',
                        ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  height: 50,
                  width: 57,
                  decoration: BoxDecoration(
                      color: const Color(0xff0048ff),
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
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
