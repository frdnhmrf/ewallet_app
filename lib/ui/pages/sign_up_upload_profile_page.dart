import 'package:ewallet/models/sign_up_form_model.dart';
import 'package:ewallet/ui/pages/sign_up_upload_ktp_page.dart';
import 'package:flutter/material.dart';

import '../../shared/shared_theme.dart';
import '../widgets/button.dart';
import '../widgets/form.dart';

class SignUpUploadProfilePage extends StatefulWidget {
  final SignUpFormModel data;
  const SignUpUploadProfilePage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<SignUpUploadProfilePage> createState() =>
      _SignUpUploadProfilePageState();
}

class _SignUpUploadProfilePageState extends State<SignUpUploadProfilePage> {
  final TextEditingController pinController = TextEditingController();
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
            'Join Us to Unlock\nYour Growth',
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
                  "Shayna Hanna",
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormFieldWidget(
                  controller: pinController,
                  text: "Set PIN (6 digit number)",
                  obscureText: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: "Continue",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpUploadKtpPage()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
