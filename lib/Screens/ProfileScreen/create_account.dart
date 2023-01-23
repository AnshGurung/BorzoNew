import 'package:borzo_app/Screens/ProfileScreen/otp_screen.dart';
import 'package:borzo_app/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
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
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mobile No',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'OTP will be sent on this number',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: phoneNumberController,
                        //initialValue: '+91 ',
                        keyboardType: TextInputType.number,
                        autofocus: true,
                        cursorColor: const Color(0xff0048ff),
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff0048ff),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.length < 10) {
                            return '';
                          } else {
                            return null;
                          }
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
            child: Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                      children: const [
                        TextSpan(
                          text: 'By registering or signing in you accept the',
                        ),
                        TextSpan(
                          text: ' Terms and conditions ',
                          style: TextStyle(
                            color: Color(0xff0048ff),
                          ),
                        ),
                        TextSpan(
                          text:
                              'and confirm that you\'ve read and acknowledged the',
                        ),
                        TextSpan(
                          text: ' Privacy Policy ',
                          style: TextStyle(
                            color: Color(0xff0048ff),
                          ),
                        ),
                        TextSpan(
                          text: 'of Borzo India Private Limited',
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    final isValid = formKey.currentState?.validate();
                    if (isValid!) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(
                            mobileNumber: phoneNumberController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
