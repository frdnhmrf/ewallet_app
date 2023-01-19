import 'package:flutter/material.dart';

import 'package:ewallet/shared/shared_theme.dart';

class PinButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const PinButton({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: numberBackgroundColor,
        ),
        child: Center(
            child: Text(
          title,
          style: whiteTextSyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        )),
      ),
    );
  }
}
