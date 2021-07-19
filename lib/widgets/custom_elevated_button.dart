import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key key,
    @required this.backgroundColor,
    @required this.buttonText,
    @required this.textColor,
    @required this.onPressed,
    @required this.child,
  }) : super(key: key);

  final Color backgroundColor;
  final String buttonText;
  final Color textColor;
  final Function onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
            )),
        child: child,
      ),
    );
  }
}
