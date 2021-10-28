
import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool isObscure;
  final TextInputType keyBoardType;

  final TextEditingController controller;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.isObscure,
    required this.keyBoardType,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      width: sizeWidth(context) / 1.2,
      child: TextFormField(
        controller: controller,
        obscureText: isObscure ? true : false,
        keyboardType: keyBoardType,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: primaryColor, width: 1.0),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
