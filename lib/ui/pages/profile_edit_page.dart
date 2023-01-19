import 'package:ewallet/blocs/auth/auth_bloc.dart';
import 'package:ewallet/models/user_edit_form_model.dart';
import 'package:ewallet/shared/shared_method.dart';
import 'package:ewallet/shared/shared_theme.dart';
import 'package:ewallet/ui/pages/home_page.dart';
import 'package:ewallet/ui/pages/profile_edit_success_page.dart';
import 'package:ewallet/ui/widgets/button.dart';
import 'package:ewallet/ui/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final usernameController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      usernameController.text = authState.user.username!;
      nameController.text = authState.user.name!;
      emailController.text = authState.user.email!;
      passwordController.text = authState.user.password!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.e);
          }
          if (state is AuthSuccess) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileEditSuccessPage(),
                ),
                (route) => false);
          }
        }, builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: [
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
                      text: "Username",
                      controller: usernameController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormFieldWidget(
                      text: "Full Name",
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormFieldWidget(
                      text: "Email Address",
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormFieldWidget(
                      obscureText: true,
                      text: "Password",
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      text: "Update Now",
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthUpdateUser(
                                UserEditFormModel(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                  username: usernameController.text,
                                ),
                              ),
                            );
                      },
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
