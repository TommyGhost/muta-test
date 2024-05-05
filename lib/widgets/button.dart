import 'package:babelos_app/utils/font_manager.dart';
import 'package:babelos_app/utils/pallet.dart';
import 'package:babelos_app/utils/style_manager.dart';
import 'package:babelos_app/utils/widget_extensions.dart';
import 'package:babelos_app/widgets/inkwell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonType { fill, outline, text }

class BabButton extends StatelessWidget {
  final double borderRadius;
  final double? fontSize;
  final double? fontHeight;
  final String title;
  final bool busy;
  final Border? border;
  // final bool fullwidth;
  final Function onPressed;
  final Color buttonBgColor;
  final Color buttonBorderColor;
  final Color? loadingColor;
  final Color? buttonTextColor;
  final Color? leadingIconColor;
  final Color? trailingIconColor;
  final bool? disabled;
  final TextStyle? style;
  final ButtonType? buttonType;
  final String? leadingIcon;
  final String? trailingIcon;
  final double trailingIconSpace;
  final EdgeInsets? padding;
  final bool? loading;
  const BabButton({
    Key? key,
    this.borderRadius = 8.0,
    this.border,
    this.fontSize,
    this.fontHeight,
    this.trailingIconSpace = 4.0,
    required this.onPressed,
    this.buttonBgColor = Pallet.primary,
    this.buttonBorderColor = Pallet.buttonOutline,
    this.buttonTextColor = Pallet.bg,
    required this.title,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingIconColor = Pallet.white,
    this.trailingIconColor = Pallet.white,
    this.busy = false,
    this.style,
    this.loadingColor,
    this.disabled,
    this.padding,
    this.loading,
    this.buttonType = ButtonType.fill,
  }) : super(key: key);

  Color getBackgroundColor() {
    if (buttonType == ButtonType.outline) {
      return Colors.transparent;
    } else if (buttonType == ButtonType.fill) {
      return buttonBgColor;
    } else {
      return Colors.transparent;
    }
  }

  Color getColor() {
    if (buttonType == ButtonType.fill) {
      return buttonTextColor != null ? buttonTextColor! : Pallet.white;
    } else if (buttonType == ButtonType.outline) {
      return buttonTextColor!;
    } else {
      return buttonTextColor != null ? buttonTextColor! : buttonBgColor;
    }
  }

  Border constructBorder() {
    if (border != null) {
      return border!;
    }
    if (buttonType == ButtonType.outline) {
      return Border.all(
        color: buttonBorderColor,
        width: 1.0.w,
      );
    } else {
      return Border.all(
        color: Colors.transparent,
        width: 0.w,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _color = getColor();
    final _bgColor = getBackgroundColor();
    return BabInkWell(
      // onTap: onPressed,
      onTap: ((disabled != null && disabled!) || loading != null && loading!)
          ? null
          : () => onPressed(),
      child: Container(
        height: 53.h,
        padding: padding,
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color:
              (disabled != null && disabled!) || (loading != null && loading!)
                  ? _bgColor.withOpacity(0.6)
                  : _bgColor,
          border: constructBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leadingIcon != null)
              Container(
                margin: EdgeInsets.only(right: 6.w),
                child: Image.asset(
                  leadingIcon!,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            loading != null && loading!
                ? Text('')
                : Text(
                    title,
                    style: style ??
                        getBoldStyle(
                            color: _color,
                            fontSize: fontSize ?? FontSize.s14,
                            height: fontHeight ?? 24.0.toFigmaHeight(14)),
                  ),
            if (trailingIcon != null) SizedBox(width: trailingIconSpace),
            if (trailingIcon != null)
              Image.asset(
                trailingIcon!,
                height: 20.h,
                width: 20.w,
              ),
            if (loading != null && loading!)
              SizedBox(
                width: 16.w,
                height: 16.h,
                child: CircularProgressIndicator(
                  color: loadingColor ?? _color,
                  strokeWidth: 3,
                ),
              )
          ],
        ),
      ),
    );
  }
}
