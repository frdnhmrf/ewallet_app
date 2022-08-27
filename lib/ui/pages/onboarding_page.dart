import 'package:carousel_slider/carousel_slider.dart';
import 'package:ewallet/shared/shared_theme.dart';
import 'package:ewallet/ui/pages/sign_in_page.dart';
import 'package:ewallet/ui/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> titles = [
    'Grow Your\nFinancial Today',
    'Build From\nZero to Freedom',
    'Start Together'
  ];

  List<String> subtitles = [
    'Our system is helping you to\nachieve a better goal',
    'We provide tips for you so that\nyou can adapt easier',
    'We will guide you to where\nyou wanted it too'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgrounColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              carouselController: carouselController,
              items: [
                Image.asset(
                  'assets/image_scene_1.png',
                  height: 331,
                ),
                Image.asset(
                  'assets/image_scene_2.png',
                  height: 331,
                ),
                Image.asset(
                  'assets/image_scene_3.png',
                  height: 331,
                ),
              ],
              options: CarouselOptions(
                height: 331,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) => {
                  setState(() {
                    currentIndex = index;
                  })
                },
              ),
            ),
            const SizedBox(height: 80),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 22,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    titles[currentIndex],
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 26),
                  Text(
                    subtitles[currentIndex],
                    style: greyTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: currentIndex == 2 ? 38 : 50),
                  currentIndex == 2
                      ? Column(
                          children: [
                            CustomButton(
                                text: "Get Started",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUpPage(),
                                    ),
                                  );
                                }),
                            const SizedBox(height: 20),
                            TextButtonWidget(
                                text: "Sign In",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignInPage(),
                                    ),
                                  );
                                }),
                          ],
                        )
                      : Row(
                          children: [
                            Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                color: currentIndex == 0
                                    ? blueColor
                                    : lightBackgrounColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                color: currentIndex == 1
                                    ? blueColor
                                    : lightBackgrounColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                color: currentIndex == 2
                                    ? blueColor
                                    : lightBackgrounColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const Spacer(),
                            CustomButton(
                                width: 150,
                                text: "Continue",
                                onPressed: () {
                                  carouselController.nextPage();
                                }),
                          ],
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
