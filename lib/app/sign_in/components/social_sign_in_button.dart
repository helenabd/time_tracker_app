import 'package:flutter/material.dart';
import 'package:time_tracker_app/widgets/widgets.dart';

class SocialSignInButton extends CustomElevatedButton {
  SocialSignInButton({
    Color backgroundColor,
    String buttonText,
    Color textColor,
    Function onPressed,
    String imagePath,
  }) : super(
          backgroundColor: backgroundColor,
          buttonText: buttonText,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(imagePath),
              Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                ),
              ),
              Opacity(
                opacity: 0.0,
                child: Image.asset(imagePath),
              ),
            ],
          ),
          textColor: textColor,
          onPressed: onPressed,
        );
}
