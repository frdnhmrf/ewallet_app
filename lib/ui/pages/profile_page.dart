import 'package:ewallet/shared/shared_theme.dart';
import 'package:ewallet/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgrounColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackColor),
        backgroundColor: lightBackgrounColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Profile',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/image_profile.png')),
                  ),
                  child: Align(
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
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'SAYNA',
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ProfileMenuItem(
                  onTap: () {},
                  iconUrl: 'assets/ic_edit_profile.png',
                  title: 'Edit Profile',
                ),
                ProfileMenuItem(
                  onTap: () {},
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
                  onTap: () {},
                  iconUrl: 'assets/ic_logout.png',
                  title: 'Log Out',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 87,
          ),
          Center(
            child: Text(
              'Report a Problem',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
