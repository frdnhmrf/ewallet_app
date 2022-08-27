import "package:flutter/material.dart";

import '../../shared/shared_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  const CustomButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: purpleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: whiteTextSyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}

class TextButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const TextButtonWidget({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 24,
      child: TextButton(
          style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
          onPressed: onPressed,
          child: Text(
            text,
            style: greyTextStyle.copyWith(
              fontSize: 16,
            ),
          )),
    );
  }
}
