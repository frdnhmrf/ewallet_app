import 'package:ewallet/shared/shared_theme.dart';
import 'package:flutter/material.dart';

class HomeServiceItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? onPressed;

  const HomeServiceItem({
    Key? key,
    required this.iconUrl,
    required this.title,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
          child: Center(
              child: Image.asset(
            iconUrl,
            width: 26,
          )),
        ),
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontWeight: medium,
          ),
        )
      ],
    );
  }
}
