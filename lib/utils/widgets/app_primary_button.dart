import 'package:flutter/material.dart';
import 'package:quotes/utils/constant/sizes.dart';


class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
    this.onTap,
  });

  final String buttonText;
  final Color buttonColor, textColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: AppSizes.buttonHeight,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(4)),
        child: Center(
            child: Text(
          buttonText,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
