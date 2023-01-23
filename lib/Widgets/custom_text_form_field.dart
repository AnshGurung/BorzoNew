import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.textController,
    this.hintText,
    this.suffixicon,
    required this.isnumber,
    this.lableText,
    this.isEnabled,
  });

  TextEditingController textController;
  String? hintText = '';
  IconData? suffixicon;
  bool isnumber;
  String? lableText;
  bool? isEnabled;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 60,
      child: TextFormField(
        maxLines: null,
        enabled: widget.isEnabled == false ? false : true,
        keyboardType:
            widget.isnumber ? TextInputType.number : TextInputType.name,
        cursorColor: const Color(0xff0048ff),
        controller: widget.textController,
        decoration: InputDecoration(
          labelText: widget.lableText,
          labelStyle: const TextStyle(color: Colors.grey),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff0048ff),
            ),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 13,
            color: Colors.grey[400],
          ),
          suffixIcon: Icon(
            widget.suffixicon,
            color: Colors.grey[300],
          ),
        ),
      ),
    );
  }
}
