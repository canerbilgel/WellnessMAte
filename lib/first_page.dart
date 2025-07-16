import 'package:flutter/material.dart';

class WellnessmateOnboardingThreeScreen extends StatelessWidget {
  const WellnessmateOnboardingThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.maxFinite,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [
                appTheme.blue300,
                appTheme.purpleA100,
                appTheme.deepPurple200,
              ],
            ),
          ),
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(horizontal: 30.h),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.maxFinite,
                            child: Column(
                              children: [
                                Container(
                                  height: 146.h,
                                  width: double.maxFinite,
                                  margin: EdgeInsets.symmetric(horizontal: 34.h),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgPolygon2,
                                        height: 2.h,
                                        width: 4.h,
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.only(
                                          left: 102.h,
                                          top: 40.h,
                                        ),
                                      ),
                                      CustomImageView(
                                        imagePath: ImageConstant
                                            .imgUntitled27120241026234546146x230,
                                        height: 146.h,
                                        width: double.maxFinite,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 14.h),
                                CustomImageView(
                                  imagePath: ImageConstant
                                      .imgUntitled27120241026234546146x230,
                                  height: 146.h,
                                  width: double.maxFinite,
                                  margin:
                                  EdgeInsets.symmetric(horizontal: 34.h),
                                ),
                                SizedBox(height: 14.h),
                                CustomImageView(
                                  imagePath: ImageConstant
                                      .imgUntitled27120241026234546146x230,
                                  height: 146.h,
                                  width: double.maxFinite,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 18.h),
                          SizedBox(
                            width: double.maxFinite,
                            child: Text(
                              "Welcome to the WellnessMate!",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.displayMedium,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          CustomElevatedButton(
                            text: "Get Started",
                            onPressed: () {},
                          ),
                          SizedBox(height: 12.h),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Have an account?",
                                  style:
                                  CustomTextStyles.bodyMediumPoppins,
                                ),
                                TextSpan(
                                  text: " ",
                                ),
                                TextSpan(
                                  text: "Log in!\n",
                                  style: theme.textTheme.titleSmall!
                                      .copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 58.h),
                          CustomImageView(
                            imagePath: ImageConstant.imgImage22,
                            height: 10.h,
                            width: double.maxFinite,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Navigates to the wellnessmateonboardingFourScreen when the action is triggered.
  void onTapGetStarted(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.wellnessmateonboardingFourScreen);
  }
}
