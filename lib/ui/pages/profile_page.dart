import 'package:ewallet/blocs/auth/auth_bloc.dart';
import 'package:ewallet/shared/shared_method.dart';
import 'package:ewallet/shared/shared_theme.dart';
import 'package:ewallet/ui/pages/pin_page.dart';
import 'package:ewallet/ui/pages/profile_edit_page.dart';
import 'package:ewallet/ui/pages/profile_edit_pin_page.dart';
import 'package:ewallet/ui/pages/sign_in_page.dart';
import 'package:ewallet/ui/widgets/custom_text_button.dart';
import 'package:ewallet/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgrounColor,
      appBar: AppBar(
        title: const Text(
          'My Profile',
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.e);
          }

          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInPage(),
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
          if (state is AuthSuccess) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 22,
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: state.user.profilePicture == null
                                ? const AssetImage('assets/image_profile.png')
                                : NetworkImage(
                                    state.user.profilePicture!,
                                  ) as ImageProvider,
                          ),
                        ),
                        child: state.user.verified == 1
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: whiteColor,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.check_circle,
                                      color: greenColor,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        state.user.name.toString(),
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ProfileMenuItem(
                        onTap: () async {
                          if (await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const PinPage())) ==
                              true) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfileEditPage()));
                          }
                        },
                        iconUrl: 'assets/ic_edit_profile.png',
                        title: 'Edit Profile',
                      ),
                      ProfileMenuItem(
                        onTap: () async {
                          if (await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const PinPage())) ==
                              true) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfileEditPinPage()));
                          }
                        },
                        iconUrl: 'assets/ic_pin.png',
                        title: 'My PIN',
                      ),
                      ProfileMenuItem(
                        onTap: () {},
                        iconUrl: 'assets/ic_setting_wallet.png',
                        title: 'Wallet Settings',
                      ),
                      ProfileMenuItem(
                        onTap: () {},
                        iconUrl: 'assets/ic_my_reward.png',
                        title: 'My Reward',
                      ),
                      ProfileMenuItem(
                        onTap: () {},
                        iconUrl: 'assets/ic_help_center.png',
                        title: 'Help Center',
                      ),
                      ProfileMenuItem(
                        onTap: () {
                          context.read<AuthBloc>().add(AuthLogout());
                        },
                        iconUrl: 'assets/ic_logout.png',
                        title: 'Log Out',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 87,
                ),
                CustomTextButton(
                  text: 'Report a Problem',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
