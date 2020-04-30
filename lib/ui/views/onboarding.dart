import 'package:flutter/material.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/constants/assets.dart';
import 'package:little_drops/ui/widgets/page_item.dart';
import 'package:little_drops/ui/shared/screen_util.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:little_drops/constants/route_names.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _pageController;
  int currentIndex = 0;
  bool isLast = false;
  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;

      if (index == 2) {
        isLast = true;
      } else {
        isLast = false;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 414, height: 896, allowFontScaling: true);
    return Scaffold(
      backgroundColor: AppColors().background,
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: onChangedFunction,
            children: <Widget>[
              PageItem(
                illustration: AppAsset().illustration2,
                text1: "We make life easy and less stressful",
                text2: 'We’ll handle your clothings, you can relax!',
              ),
              PageItem(
                illustration: AppAsset().illustration2,
                text1: "Clean and Crisp-looking Garment",
                text2:
                    'You do not need to worry about a chores-filled-weekend anymore.',
              ),
              PageItem(
                illustration: AppAsset().illustration2,
                text1: "Swift Delivery",
                text2: 'Now relax, Let’s bring your clothes to you!',
              ),
            ],
          ),
          Positioned(
            bottom: 60,
            left: halfScreenWidth(context) - 20,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Indicator(
                  positionIndex: 0,
                  currentIndex: currentIndex,
                ),
                SizedBox(
                  width: 10,
                ),
                Indicator(
                  positionIndex: 1,
                  currentIndex: currentIndex,
                ),
                SizedBox(
                  width: 10,
                ),
                Indicator(
                  positionIndex: 2,
                  currentIndex: currentIndex,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, SignUpViewRoute);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      isLast ? 'let’s go!' : 'Skip',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 14, color: AppColors().textColor),
                      ),
                    ),
                    SizedBox(width: 5),
                    isLast
                        ? Icon(
                            Icons.arrow_forward,
                            color: AppColors().primaryColor,
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  const Indicator({this.currentIndex, this.positionIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors().primaryColor),
          color: positionIndex == currentIndex
              ? AppColors().primaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
