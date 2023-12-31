import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/signin.dart';
import 'package:e_commerce_app/features/welcome/presentation/widgets/get_started_one.dart';
import 'package:e_commerce_app/features/welcome/presentation/widgets/get_started_three.dart';
import 'package:e_commerce_app/features/welcome/presentation/widgets/get_started_two.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedOneScreenState();
}

class _GetStartedOneScreenState extends State<GetStartedScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            vSpacing(40),
            heading1(
              'AOS-Shopping',
            ),
            vSpacing(10),
            SizedBox(
              height: MediaQuery.of(context).size.height * .55,
              child: PageView(
                /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                /// Use [Axis.vertical] to scroll vertically.
                controller: _pageController,
                children: const <Widget>[
                  GetStartedOneScreen(),
                  GetStartedTwoScreen(),
                  GetStartedThreeScreen(),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              onDotClicked: (int index) => setState(() {
                _pageController.animateToPage(
                  index,
                  duration:
                      const Duration(milliseconds: 500), // Animation duration.
                  curve: Curves.easeInOut,
                );
              }),
              effect: WormEffect(activeDotColor: Pallete.secondary),
            ),
            const Spacer(
              flex: 2,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignInScreen()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Pallete.primaryDark,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 19),
                )),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
