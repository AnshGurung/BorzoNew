import 'package:flutter/material.dart';

import 'forgot_password.dart';

class StoreSignInForm extends StatefulWidget {
  const StoreSignInForm({super.key});

  @override
  State<StoreSignInForm> createState() => _StoreSignInFormState();
}

class _StoreSignInFormState extends State<StoreSignInForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //BOOLEAN
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 10),
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    //autofocus: true,
                    //initialValue: widget.isPerson ? '+91 ' : ' ',
                    controller: emailController,
                    cursorColor: const Color(0xff0048ff),
                    decoration: const InputDecoration(
                      label: Text('E-mail'),
                      labelStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff0048ff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  obscureText: isObscure,
                  cursorColor: const Color(0xff0048ff),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: isObscure
                          ? const Icon(
                              Icons.visibility_rounded,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.grey,
                            ),
                    ),
                    label: const Text('Password'),
                    labelStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff0048ff),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPassword(isPerson: false),
                    ),
                  );
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color(0xff0048ff),
                  ),
                ),
              ),
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
    );
    // bottomNavigationBar: Padding(
    //   padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       const Text(
    //         'Forgot Password?',
    //         style: TextStyle(
    //           color: Color(0xff0048ff),
    //         ),
    //       ),
    //       Container(
    //         margin: const EdgeInsets.only(left: 25),
    //         height: 50,
    //         width: 57,
    //         decoration: BoxDecoration(
    //             color: const Color(0xff0048ff),
    //             borderRadius: BorderRadius.circular(25)),
    //         child: const Center(
    //           child: Icon(
    //             Icons.arrow_forward,
    //             color: Colors.white,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // ),
  }
}
