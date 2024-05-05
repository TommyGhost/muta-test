import 'package:babelos_app/presentation/base/base_ui.dart';
import 'package:babelos_app/presentation/screen/home/home_vm.dart';
import 'package:babelos_app/utils/__utils.dart';
import 'package:babelos_app/widgets/dumb_widgets/welcome_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) {},
      builder: (context, model, child) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.0.sbH,
            Padding(
              padding: EdgeInsets.only(left: 17.w, right: 16.w),
              child: WelcomeHeader(
                value: model.selectedItem,
                items: model.items,
                onChanged: (value) => model.onChanged(
                  value!,
                ),
              ),
            ),
            SingleChildScrollView(
              padding: padOnly(left: 17, right: 16, top: 10),
              child: Column(
                children: [
                  22.0.sbH,
                  Container(
                    padding: padOnly(left: 24, down: 24, top: 24),
                    width: width(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Pallet.outlineBorder2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.level,
                                  width: 24.w,
                                  height: 24.h,
                                  fit: BoxFit.cover,
                                ),
                                12.0.sbW,
                                Text(
                                  AppStrings.intermediate,
                                  style: getRegularStyle(
                                      fontSize: FontSize.s14,
                                      height: 24.0.toFigmaHeight(14),
                                      color: Pallet.white),
                                ),
                              ],
                            ),
                            8.0.sbH,
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.book,
                                  width: 24.w,
                                  height: 24.h,
                                  fit: BoxFit.cover,
                                ),
                                12.0.sbW,
                                Text(
                                  AppStrings.lesson,
                                  style: getRegularStyle(
                                      fontSize: FontSize.s14,
                                      height: 24.0.toFigmaHeight(14),
                                      color: Pallet.white),
                                ),
                              ],
                            ),
                            16.0.sbH,
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 87.36.w,
                                      height: 4.0.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(8.r),
                                        ),
                                        color: Pallet.sliderOrange,
                                      ),
                                    ),
                                    Container(
                                      width: 80.64.w,
                                      height: 4.0.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(8.r),
                                        ),
                                        color: Pallet.sliderBlue,
                                      ),
                                    ),
                                  ],
                                ),
                                8.0.sbW,
                                Text(
                                  '52%',
                                  style: getRegularStyle(
                                      fontSize: FontSize.s12,
                                      height: 16.0.toFigmaHeight(12),
                                      color: Pallet.white),
                                ),
                              ],
                            ),
                            22.0.sbH,
                            Container(
                              width: 208.w,
                              padding:
                                  padOnly(left: 16, down: 16, top: 16, right: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32.r),
                                color: Pallet.buttonOutline,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.startLearn,
                                    style: getRegularStyle(
                                        fontSize: FontSize.s14,
                                        height: 24.0.toFigmaHeight(14),
                                        color: Pallet.white),
                                  ),
                                  Image.asset(
                                    AppImages.play,
                                    width: 32.w,
                                    height: 32.h,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          AppImages.yoruba2,
                          width: 86.w,
                          height: 128.h,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  40.0.sbH,
                  Container(
                    padding: pad(horiz: 16, vert: 28),
                    width: width(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Pallet.reviewCont,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AppImages.review,
                              width: 48.w,
                              height: 48.h,
                              fit: BoxFit.cover,
                            ),
                            16.0.sbW,
                            SizedBox(
                              width: 200.w,
                              child: Flexible(
                                child: Text(
                                  AppStrings.reviewLess,
                                  style: getBoldStyle(
                                      fontSize: FontSize.s16,
                                      height: 24.0.toFigmaHeight(16),
                                      color: Pallet.outlineBorder2),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 24.r,
                          color: Pallet.divider,
                        ),
                      ],
                    ),
                  ),
                  40.0.sbH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.leaderBoard,
                        style: getBoldStyle(
                            fontSize: FontSize.s16,
                            height: 24.0.toFigmaHeight(16),
                            color: Pallet.white),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 24.r,
                        color: Pallet.divider,
                      ),
                    ],
                  ),
                  16.0.sbH,
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) => Container(
                      width: width(context),
                      margin: padOnly(down: 16),
                      height: 96.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Pallet.buttonOutline,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 24.w,
                            height: 26.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.r),
                                bottomRight: Radius.circular(8.r),
                              ),
                              color: Pallet.white,
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}.',
                                style: getBoldStyle(
                                    fontSize: FontSize.s12,
                                    height: 16.0.toFigmaHeight(12),
                                    color: Pallet.bg),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                padOnly(left: 16, down: 24, top: 24, right: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      AppImages.avatar,
                                      width: 48.w,
                                      height: 48.h,
                                      fit: BoxFit.cover,
                                    ),
                                    16.0.sbW,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tino Vinus',
                                          style: getBoldStyle(
                                              fontSize: FontSize.s15,
                                              height: 24.0.toFigmaHeight(15),
                                              color: Pallet.white),
                                        ),
                                        4.0.sbH,
                                        Row(
                                          children: [
                                            Text(
                                              'United States',
                                              style: getRegularStyle(
                                                  fontSize: FontSize.s13,
                                                  height: 16.0.toFigmaHeight(13),
                                                  color: Pallet.visible),
                                            ),
                                            8.0.sbW,
                                            Image.asset(
                                              AppImages.usa,
                                              width: 20.w,
                                              height: 20.h,
                                              fit: BoxFit.cover,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  '🏆 15,832',
                                  style: getMediumStyle(
                                      fontSize: FontSize.s13,
                                      height: 16.0.toFigmaHeight(13),
                                      color: Pallet.sliderOrange),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width(context),
                    height: 96.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Pallet.meLeaderboard,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 41.w,
                          height: 26.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.r),
                              bottomRight: Radius.circular(8.r),
                            ),
                            color: Pallet.white,
                          ),
                          child: Center(
                            child: Text(
                              '607.',
                              style: getBoldStyle(
                                  fontSize: FontSize.s12,
                                  height: 16.0.toFigmaHeight(12),
                                  color: Pallet.bg),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              padOnly(left: 16, down: 24, top: 24, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    AppImages.avatar,
                                    width: 48.w,
                                    height: 48.h,
                                    fit: BoxFit.cover,
                                  ),
                                  16.0.sbW,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Me',
                                        style: getBoldStyle(
                                            fontSize: FontSize.s15,
                                            height: 24.0.toFigmaHeight(15),
                                            color: Pallet.white),
                                      ),
                                      4.0.sbH,
                                      Row(
                                        children: [
                                          Text(
                                            'United States',
                                            style: getRegularStyle(
                                                fontSize: FontSize.s13,
                                                height: 16.0.toFigmaHeight(13),
                                                color: Pallet.visible),
                                          ),
                                          8.0.sbW,
                                          Image.asset(
                                            AppImages.usa,
                                            width: 20.w,
                                            height: 20.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                '🏆 15,832',
                                style: getMediumStyle(
                                    fontSize: FontSize.s13,
                                    height: 16.0.toFigmaHeight(13),
                                    color: Pallet.sliderOrange),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  40.0.sbH,
                  Container(
                    width: width(context),
                    padding: pad(horiz: 24, vert: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.r),
                      color: Pallet.buttonOutline,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.play,
                          width: 32.w,
                          height: 32.h,
                          fit: BoxFit.cover,
                        ),
                        16.0.sbH,
                        Text(
                          AppStrings.upgrade,
                          style: getMediumStyle(
                              fontSize: FontSize.s14,
                              height: 16.0.toFigmaHeight(14),
                              color: Pallet.bg),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
