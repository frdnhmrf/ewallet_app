import 'package:ewallet/ui/pages/sign_up_success_page.dart';
import 'package:flutter/material.dart';

import '../../shared/shared_theme.dart';
import '../widgets/button.dart';
import 'home_page.dart';

class SignUpUploadKtpPage extends StatelessWidget {
  const SignUpUploadKtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 100),
            width: 155,
            height: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/icon_logo_dark.png',
                ),
              ),
            ),
          ),
          Text(
            'Verify Your\nAccount',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: lightBackgrounColor,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/icon_upload.png',
                      width: 32,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Passport/ID Card",
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: "Continue",
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        (route) => false);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          TextButtonWidget(
            text: 'Skip for Now',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpSuccessPage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
