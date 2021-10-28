
import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;

  final VoidCallback onPress;

  const CustomButton(
      {Key? key,
        required this.buttonText,
        required this.buttonColor,
        required this.textColor,
        required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizeWidth(context) / 1.2,
      // color: buttonColor,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),

                )
            )
        ),
        onPressed: onPress,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonText.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: textColor),
                  // textAlign: TextAlign.center,
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}