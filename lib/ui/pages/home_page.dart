import 'package:ewallet/shared/shared_theme.dart';
import 'package:ewallet/ui/widgets/home_friendly_tips_item.dart';
import 'package:ewallet/ui/widgets/home_send_again_item.dart';
import 'package:ewallet/ui/widgets/home_service_item.dart';
import 'package:ewallet/ui/widgets/home_latest_transaction_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgrounColor,
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          backgroundColor: whiteColor,
          elevation: 0,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_overview.png',
                width: 20,
              ),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_history.png',
                width: 20,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_statistic.png',
                width: 20,
              ),
              label: 'Statistic',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_reward.png',
                width: 20,
              ),
              label: 'Reward',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.asset(
          'assets/icon_plus_circle.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          buildProfile(),
          buildWalletCard(),
          buildLevel(),
          buildService(),
          buildLatestTransaction(),
          buildSendAgain(),
          buildFriendlyTips()
        ],
      ),
    );
  }

  Widget buildProfile() {
    return Container(
        margin: const EdgeInsets.only(
          top: 40,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Howdy,",
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Sayna',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/image_profile.png')),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check_circle,
                      color: greenColor,
                      size: 14,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget buildWalletCard() {
    return Container(
      width: double.infinity,
      height: 220,
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: const DecorationImage(
          image: AssetImage('assets/img_bg_wallet.png'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sayna',
            style: whiteTextSyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Text(
            '**** **** **** 6543',
            style: whiteTextSyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
              letterSpacing: 6,
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          Text(
            'Balance',
            style: whiteTextSyle,
          ),
          Text(
            'Rp 12.500',
            style: whiteTextSyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          )
        ],
      ),
    );
  }

  Widget buildLevel() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Level 1',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              const Spacer(),
              Text(
                '55% ',
                style: greenTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              Text(
                'of Rp 20.000',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              backgroundColor: lightBackgrounColor,
              valueColor: AlwaysStoppedAnimation(greenColor),
              value: 0.55,
              minHeight: 5,
            ),
          )
        ],
      ),
    );
  }

  Widget buildService() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItem(
                onPressed: () {},
                iconUrl: 'assets/ic_topup.png',
                title: 'Top Up',
              ),
              HomeServiceItem(
                onPressed: () {},
                iconUrl: 'assets/ic_send.png',
                title: 'Send',
              ),
              HomeServiceItem(
                onPressed: () {},
                iconUrl: 'assets/ic_withdraw.png',
                title: 'Withdraw',
              ),
              HomeServiceItem(
                onPressed: () {},
                iconUrl: 'assets/ic_more.png',
                title: 'More',
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildLatestTransaction() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transaction',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 14,
            ),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: const [
                HomeLatestTransactionItem(
                  value: '+ Rp 50.000',
                  date: 'Yesterday',
                  iconUrl: 'assets/ic_transaction_topup.png',
                  title: 'Top Up',
                ),
                HomeLatestTransactionItem(
                  value: '+ Rp 50.000',
                  date: 'Yesterday',
                  iconUrl: 'assets/ic_transaction_topup.png',
                  title: 'Top Up',
                ),
                HomeLatestTransactionItem(
                  value: '+ Rp 50.000',
                  date: 'Yesterday',
                  iconUrl: 'assets/ic_transaction_topup.png',
                  title: 'Top Up',
                ),
                HomeLatestTransactionItem(
                  value: '+ Rp 50.000',
                  date: 'Yesterday',
                  iconUrl: 'assets/ic_transaction_topup.png',
                  title: 'Top Up',
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildSendAgain() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                HomeSendAgainItem(
                  imgUrl: 'assets/image_profile.png',
                  username: 'frdnhmrf',
                ),
                HomeSendAgainItem(
                  imgUrl: 'assets/image_profile.png',
                  username: 'frdnhmrf',
                ),
                HomeSendAgainItem(
                  imgUrl: 'assets/image_profile.png',
                  username: 'frdnhmrf',
                ),
                HomeSendAgainItem(
                  imgUrl: 'assets/image_profile.png',
                  username: 'frdnhmrf',
                ),
                HomeSendAgainItem(
                  imgUrl: 'assets/image_profile.png',
                  username: 'frdnhmrf',
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildFriendlyTips() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 17,
            runSpacing: 18,
            children: const [
              HomeFriendlyTipsItem(
                imgUrl: 'assets/image_dummy_tips.png',
                title: 'Best tips for using\na credit card',
                url: 'https://www.google.com/',
              ),
              HomeFriendlyTipsItem(
                imgUrl: 'assets/image_dummy_tips.png',
                title: 'Best tips for using\na credit card',
                url: 'https://www.google.com/',
              ),
              HomeFriendlyTipsItem(
                imgUrl: 'assets/image_dummy_tips.png',
                title: 'Best tips for using\na credit card',
                url: 'https://www.google.com/',
              ),
              HomeFriendlyTipsItem(
                imgUrl: 'assets/image_dummy_tips.png',
                title: 'Best tips for using\na credit card',
                url: 'https://www.google.com/',
              ),
            ],
          )
        ],
      ),
    );
  }
}
