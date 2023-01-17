import 'package:ewallet/shared/shared_theme.dart';
import 'package:flutter/material.dart';

class HomeSendAgainItem extends StatelessWidget {
  final String imgUrl;
  final String username;

  const HomeSendAgainItem({
    Key? key,
    required this.imgUrl,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 17),
      width: 90,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 45,
            width: 45,
            margin: const EdgeInsets.only(
              bottom: 13,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            '@$username',
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          )
        ],
      ),
    );
  }
}
