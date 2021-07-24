import 'package:flutter/material.dart';
import 'package:time_tracker_app/widgets/widgets.dart';

class FormSubmitButton extends CustomElevatedButton {
  FormSubmitButton({
    @required String text,
    VoidCallback onPressed,
  }) : super(
          backgroundColor: Colors.indigo,
          buttonText: text,
          textColor: Colors.white,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: onPressed,
        );
}
