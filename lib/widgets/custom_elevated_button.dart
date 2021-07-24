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
    Color backgroundDisabledColor = Colors.grey;
    return Container(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return backgroundColor;
                if (states.contains(MaterialState.disabled)) {
                  Color disabledColor = backgroundDisabledColor;
                  if (backgroundDisabledColor == null) {
                    disabledColor = backgroundColor.withOpacity(0.5);
                  }

                  return disabledColor;
                }

                return backgroundColor; // Use default color.
              },
            ),
            // backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
            )),
        child: child,
      ),
    );
  }
}
