import 'package:babelos_app/routes/routes.dart';
import 'package:babelos_app/utils/__utils.dart';
import 'package:babelos_app/widgets/__widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width(context),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.introScreen),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: padOnly(left: 17.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  248.0.sbH,
                  Text(
                    AppStrings.learnLang,
                    style: getLightStyle(
                        fontSize: FontSize.s18,
                        height: 24.0.toFigmaHeight(18),
                        color: Pallet.white),
                  ),
                  16.0.sbH,
                  Text(
                    AppStrings.africa,
                    style: TextStyle(
                        fontSize: FontSize.s64,
                        height: 72.0.toFigmaHeight(64),
                        color: Pallet.white),
                  ),
                  32.0.sbH,
                  SizedBox(
                    width: width(context),
                    child: Text(
                      AppStrings.mutaHelps,
                      style: getRegularStyle(
                          fontSize: FontSize.s15,
                          height: 24.0.toFigmaHeight(15),
                          color: Pallet.wsBlue),
                    ),
                  ),
                  72.0.sbH,
                  BabButton(
                    onPressed: () {
                      navigationService.navigateTo(AppRoutes.langSel);
                    },
                    title: AppStrings.getStarted.toUpperCase(),
                  ),
                  32.0.sbH,
                  BabButton(
                    buttonType: ButtonType.outline,
                    onPressed: () {
                      navigationService.navigateTo(AppRoutes.signIn);
                    },
                    title: AppStrings.login.toUpperCase(),
                    buttonTextColor: Pallet.buttonOutline,
                  ),
                  104.0.sbH,
                  Center(
                    child: Container(
                      padding: pad(horiz: 30),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 3.w,
                        runSpacing: 5.h,
                        children: [
                          Text(
                            AppStrings.byCont,
                            style: getRegularStyle(
                                fontSize: FontSize.s12,
                                height: 20.0.toFigmaHeight(12),
                                color: Pallet.wsBlue),
                          ),
                          BabInkWell(
                            onTap: () {
                              showCustomToast(AppStrings.terms, success: true);
                            },
                            child: Text(
                              AppStrings.terms,
                              style: getRegularStyle(
                                  fontSize: FontSize.s12,
                                  height: 20.0.toFigmaHeight(12),
                                  color: Pallet.buttonOutline),
                            ),
                          ),
                          Text(
                            AppStrings.and,
                            style: getRegularStyle(
                                fontSize: FontSize.s12,
                                height: 20.0.toFigmaHeight(12),
                                color: Pallet.wsBlue),
                          ),
                          BabInkWell(
                            onTap: () {
                              showCustomToast(AppStrings.privPol,
                                  success: true);
                            },
                            child: Text(
                              AppStrings.privPol,
                              style: getRegularStyle(
                                  fontSize: FontSize.s12,
                                  height: 20.0.toFigmaHeight(12),
                                  color: Pallet.buttonOutline),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
