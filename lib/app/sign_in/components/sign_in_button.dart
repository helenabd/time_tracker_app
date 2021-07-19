import 'package:flutter/material.dart';
import 'package:time_tracker_app/widgets/widgets.dart';

class SignInButton extends CustomElevatedButton {
  SignInButton({
    Color backgroundColor,
    String buttonText,
    Color textColor,
    Function onPressed,
    String imagePath,
    bool haveImage,
  }) : super(
          backgroundColor: backgroundColor,
          buttonText: buttonText,
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: 15,
            ),
          ),
          textColor: textColor,
          onPressed: onPressed,
        );
}
