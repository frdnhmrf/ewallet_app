import 'package:ewallet/blocs/auth/auth_bloc.dart';
import 'package:ewallet/models/sign_up_form_model.dart';
import 'package:ewallet/shared/shared_method.dart';
import 'package:ewallet/ui/pages/sign_in_page.dart';
import 'package:ewallet/ui/widgets/button.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/shared_theme.dart';
import '../widgets/form.dart';
import 'sign_up_upload_profile_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameContorller = TextEditingController();
  final TextEditingController emailContorller = TextEditingController();
  final TextEditingController passwordContorller = TextEditingController();

  bool validate() {
    if (nameContorller.text.isEmpty ||
        emailContorller.text.isEmpty ||
        passwordContorller.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          showCustomSnackBar(context, state.e);
        }

        if (state is AuthCheckEmailSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpUploadProfilePage(
                data: SignUpFormModel(
                  email: emailContorller.text,
                  password: passwordContorller.text,
                  name: nameContorller.text,
                ),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
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
                  TextFormFieldWidget(
                    text: "Full Name",
                    controller: nameContorller,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormFieldWidget(
                    text: "Email Address",
                    controller: emailContorller,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormFieldWidget(
                    text: "Password",
                    controller: passwordContorller,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    text: "Continue",
                    onPressed: () {
                      if (validate()) {
                        context
                            .read<AuthBloc>()
                            .add(AuthCheckEmail(emailContorller.text));
                      } else {
                        showCustomSnackBar(
                            context, 'Semua field harus diisi yagesya');
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButtonWidget(
              text: 'Sign In',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ),
                );
              },
            )
          ],
        );
      },
    ));
  }
}
