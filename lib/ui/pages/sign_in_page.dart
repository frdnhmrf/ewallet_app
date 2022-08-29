import 'package:ewallet/blocs/auth/auth_bloc.dart';
import 'package:ewallet/models/sign_in_form_model.dart';
import 'package:ewallet/shared/shared_theme.dart';
import 'package:ewallet/ui/pages/home_page.dart';
import 'package:ewallet/ui/widgets/button.dart';
import 'package:ewallet/ui/widgets/form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/shared_method.dart';
import 'sign_up_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailContorller = TextEditingController();
  final TextEditingController passwordContorller = TextEditingController();

  bool validate() {
    if (emailContorller.text.isEmpty || passwordContorller.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgrounColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false);
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
                'Sign In &\nGrow Your Finance',
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
                      text: "Email Address",
                      controller: emailContorller,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormFieldWidget(
                      text: "Password",
                      controller: passwordContorller,
                      obscureText: true,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password',
                          style: blueTextStyle,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: purpleColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(56),
                          ),
                        ),
                        onPressed: () {
                          if (validate()) {
                            context.read<AuthBloc>().add(
                                  AuthLogin(
                                    SignInFormModel(
                                      email: emailContorller.text,
                                      password: passwordContorller.text,
                                    ),
                                  ),
                                );
                          } else {
                            showCustomSnackBar(
                                context, 'Please fill all fields');
                          }
                        },
                        child: Text(
                          'Sign In',
                          style: whiteTextSyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextButtonWidget(
                text: "Create New Account",
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpPage(),
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
