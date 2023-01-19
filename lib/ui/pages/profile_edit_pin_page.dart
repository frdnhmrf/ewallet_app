import 'package:ewallet/blocs/auth/auth_bloc.dart';
import 'package:ewallet/shared/shared_method.dart';
import 'package:ewallet/shared/shared_theme.dart';
import 'package:ewallet/ui/pages/home_page.dart';
import 'package:ewallet/ui/pages/profile_edit_success_page.dart';
import 'package:ewallet/ui/widgets/button.dart';
import 'package:ewallet/ui/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPinPage extends StatefulWidget {
  const ProfileEditPinPage({super.key});

  @override
  State<ProfileEditPinPage> createState() => _ProfileEditPinPageState();
}

class _ProfileEditPinPageState extends State<ProfileEditPinPage> {
  final oldPinController = TextEditingController(text: '');
  final newPinController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
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
          },
          builder: (context, state) {
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
                        text: "Old PIN",
                        controller: oldPinController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormFieldWidget(
                        text: "New PIN",
                        controller: newPinController,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        text: "Update Now",
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                AuthUpdatePin(oldPinController.text,
                                    newPinController.text),
                              );
                        },
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
