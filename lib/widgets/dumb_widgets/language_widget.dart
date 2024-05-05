import 'package:babelos_app/utils/__utils.dart';
import 'package:babelos_app/widgets/inkwell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SelectLang extends StatelessWidget {
  const SelectLang(
      {super.key,
      required this.onTap,
      required this.image,
      required this.text,
      required this.isSelected});

  final Function() onTap;
  final String image;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return BabInkWell(
      onTap: onTap,
      child: Container(
        width: width(context),
        padding: pad(horiz: 24, vert: 16),
        margin: padOnly(down: 40.h),
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Pallet.wsBlue : Pallet.outlineBorder2,
              width: isSelected ? 2.w : 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  width: 32.w,
                  height: 32.h,
                  fit: BoxFit.cover,
                ),
                16.0.sbW,
                Text(
                  text,
                  style: getMediumStyle(
                      fontSize: FontSize.s16,
                      height: 24.0.toFigmaHeight(16),
                      color: Pallet.white),
                ),
              ],
            ),
            Visibility(
              visible: isSelected,
              child: Container(
                width: 22.w,
                height: 22.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Pallet.primary,
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    size: 10.r,
                    weight: 2.0,
                    color: Pallet.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectLangLearn extends StatelessWidget {
  const SelectLangLearn(
      {super.key,
      required this.image,
      required this.title,
      required this.isSelected, required this.onTap});

  final String image;
  final String title;
  final Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return BabInkWell(
      onTap: onTap,
      child: Container(
        width: 163.w,
        height: 160.h,
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Pallet.primary : Pallet.outlineBorder2,
              width: isSelected ? 2.w : 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 64.h,
                width: 64.w,
                child: CachedNetworkImage(
                  width: 64.w,
                  height: 64.h,
                  fit: BoxFit.cover,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: SizedBox(
                      width: 30.w,
                      height: 30.h,
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Icon(
                      Icons.error,
                      size: 50.w,
                    ),
                  ),
                ),
              ),
              24.0.sbH,
              Text(
                title,
                style: getBoldStyle(
                    fontSize: FontSize.s16,
                    height: 24.0.toFigmaHeight(16),
                    color: Pallet.wsBlue),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RateProfCard extends StatelessWidget {
  const RateProfCard(
      {super.key,
      required this.onTap,
      required this.title,
      required this.subtitle,
      required this.isSelected});

  final Function() onTap;
  final String title;
  final String subtitle;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return BabInkWell(
      onTap: onTap,
      child: Container(
        width: width(context),
        padding: pad(horiz: 16, vert: 20),
        margin: padOnly(down: 32.h),
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Pallet.wsBlue : Pallet.outlineBorder2,
              width: isSelected ? 2.w : 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 32.w,
                  height: 32.h,
                  padding: pad(both: 2),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0.w,
                        top: 0.w,
                        child: Container(
                          height: 8.h,
                          width: 8.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 0.5.w,
                              color: Pallet.wsBlue,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 12.w,
                        top: 12.w,
                        child: Container(
                          height: 8.h,
                          width: 8.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: title != AppStrings.intermediate
                                  ? Border.all(
                                      width: 0.5.w,
                                      color: Pallet.wsBlue,
                                    )
                                  : null,
                              color: title == AppStrings.intermediate
                                  ? Pallet.primary
                                  : null),
                        ),
                      ),
                      Positioned(
                        left: 0.w,
                        bottom: 0.w,
                        child: Container(
                          height: 8.h,
                          width: 8.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: title == AppStrings.novice
                                  ? Border.all(
                                      width: 0.5.w,
                                      color: Pallet.wsBlue,
                                    )
                                  : null,
                              color: title != AppStrings.novice
                                  ? Pallet.primary
                                  : null),
                        ),
                      ),
                    ],
                  ),
                ),
                16.0.sbW,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: getMediumStyle(
                          fontSize: FontSize.s16,
                          height: 24.0.toFigmaHeight(16),
                          color: Pallet.white),
                    ),
                    4.0.sbH,
                    SizedBox(
                      width: 214.w,
                      child: Text(
                        subtitle,
                        style: getRegularStyle(
                            fontSize: FontSize.s14,
                            height: 20.0.toFigmaHeight(14),
                            color: Pallet.wsBlue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Visibility(
              visible: isSelected,
              child: Container(
                width: 22.w,
                height: 22.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Pallet.primary,
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    size: 10.r,
                    weight: 2.0,
                    color: Pallet.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
