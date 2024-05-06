import 'package:babelos_app/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/font_manager.dart';
import '../utils/pallet.dart';
import '../utils/style_manager.dart';
import '../utils/value_manager.dart';

class InputField extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final TextCapitalization? textCapitalization;
  final TextAlign? textAlign;
  final TextInputType? keyBoardType;
  final String? Function(String? val)? validationCallback;
  final String? Function(String? val)? onSaved;
  final void Function()? onEdittingComplete;
  final String? formError;
  final String label;
  final String topLabel;
  final String? hintText;
  final String? helperText;
  final Iterable<String>? autofillHints;
  final FocusNode? focusnode;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? message;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Function()? clearForm;
  final Function()? onTap;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final int? maxLines;
  final int? helperMaxLines;
  final int? minLines;
  final double? height;
  final bool? enabled;
  final bool autofocus;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final BorderRadius? borderRadius;
  final Color? fillColor;
  final Color? hintColor;
  final bool? showCursor;
  final bool readOnly;
  final Widget? labelRightItem;
  final Widget? topLabelRightItem;
  final TextStyle? labelStyle;
  final TextStyle? topLabelStyle;
  final TextStyle? helperStyle;
  final String? initialValue;
  final String? Function(String?)? validator;
  final bool underline;

  const InputField({
    Key? key,
    this.autovalidateMode,
    this.textCapitalization,
    this.inputFormatters,
    this.textAlign,
    this.keyBoardType,
    this.onEdittingComplete,
    this.validationCallback,
    this.onSaved,
    this.message,
    this.hintText,
    this.helperText,
    this.label = '',
    this.topLabel = '',
    this.formError,
    this.focusnode,
    this.textInputAction,
    this.controller,
    this.clearForm,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.onChanged,
    this.contentPadding,
    this.onTap,
    this.maxLength,
    this.maxLines = 1,
    this.helperMaxLines,
    this.minLines,
    this.enabled = true,
    this.autofocus = false,
    this.border,
    this.enabledBorder,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.borderRadius,
    this.fillColor,
    this.validator,
    this.hintColor,
    this.autofillHints,
    this.showCursor,
    this.readOnly = false,
    this.labelRightItem,
    this.topLabelRightItem,
    this.labelStyle,
    this.topLabelStyle,
    this.helperStyle,
    this.initialValue,
    this.underline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (topLabel != "")
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    topLabel,
                    style: topLabelStyle ??
                        getRegularStyle(
                          fontSize: FontSize.s13,
                          height: 16.0.toFigmaHeight(13),
                          color: Pallet.wsBlue,
                        ),
                  ),
                  if (topLabelRightItem != null) labelRightItem!
                ],
              ),
              SizedBox(
                height: AppSize.s8.h,
              ),
            ],
          ),
        TextFormField(
          autofillHints: autofillHints,
          style: getRegularStyle(fontSize: FontSize.s15, height: 24.0.toFigmaHeight(15), color: Pallet.white),
          initialValue: initialValue,
          showCursor: showCursor,
          cursorColor: Pallet.white,
          readOnly: readOnly,
          autofocus: autofocus,
          validator: validator,
          maxLength: maxLength,
          enabled: enabled,
          onTap: onTap,
          minLines: minLines,
          maxLines: maxLines,
          autovalidateMode: autovalidateMode,
          focusNode: focusnode,
          onSaved: onSaved,
          controller: controller,
          textInputAction: textInputAction ?? TextInputAction.next,
          decoration: InputDecoration(
            counterText: '',
            helperText: helperText,
            helperStyle: helperStyle,
            helperMaxLines: helperMaxLines,
            border: border,
            enabledBorder: enabledBorder ??
                (!underline
                    ? OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Pallet.borderUnfocus),
                        borderRadius:
                            borderRadius ?? BorderRadius.circular(8.r),
                      )
                    : UnderlineInputBorder(
                        borderSide: BorderSide(color: Pallet.wsBlue, width: 0.5.w),
                      )),
            disabledBorder: enabledBorder ??
                (!underline
                    ? OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Pallet.borderUnfocus),
                        borderRadius:
                            borderRadius ?? BorderRadius.circular(8.r),
                      )
                    : UnderlineInputBorder(
                        borderSide: BorderSide(color: Pallet.wsBlue, width: 0.5.w),
                      )),
            focusedBorder: focusedBorder ??
                (!underline
                    ? OutlineInputBorder(
                        borderSide: const BorderSide(color: Pallet.primary),
                        borderRadius:
                            borderRadius ?? BorderRadius.circular(8.r),
                      )
                    : UnderlineInputBorder(
                        borderSide: BorderSide(color: Pallet.buttonOutline, width: 1.5.w),
                      )),
            focusedErrorBorder: focusedErrorBorder ??
                (!underline
                    ? OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius:
                            borderRadius ?? BorderRadius.circular(8.r),
                      )
                    : UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.5.w),
                      )),
            errorBorder: errorBorder ??
                (!underline
                    ? OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius:
                            borderRadius ?? BorderRadius.circular(8.r),
                      )
                    : UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 0.5.w),
                      )),
            alignLabelWithHint: true,
            labelText: label == '' ? null : label,
            labelStyle: getRegularStyle(
                      fontSize: FontSize.s13,
                      height: 16.0.toFigmaHeight(13),
                      color: Pallet.buttonOutline),
            // MaterialStateTextStyle.resolveWith(
            //   (states) {
            //     // Modify the text style based on different states
            //     if (states.contains(MaterialState.focused)) {
            //       return getRegularStyle(
            //           fontSize: FontSize.s13,
            //           height: 16.0.toFigmaHeight(13),
            //           color: Pallet.buttonOutline);
            //     } else if (states.contains(MaterialState.error)) {
            //       return getRegularStyle(
            //           fontSize: FontSize.s13,
            //           height: 16.0.toFigmaHeight(13),
            //           color: Colors.red);
            //     } else {
            //       return getRegularStyle(
            //           fontSize: FontSize.s13, height: 16.0.toFigmaHeight(13));
            //     }
            //   },
            // ),
            isDense: true,
            hintText: hintText,
            hintStyle: getRegularStyle(fontSize: FontSize.s15, height: 24.0.toFigmaHeight(15), color: Pallet.wsBlue),
            errorText: formError,
            errorMaxLines: 3,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(
                    vertical: height == null ? AppPadding.p12 : height!,
                    ),
            suffixIcon: suffixIcon,
            suffixIconConstraints: const BoxConstraints(
              minHeight: 24,
              maxHeight: 24,
            ),
            prefixIcon: prefixIcon,
            fillColor: fillColor ?? Theme.of(context).scaffoldBackgroundColor,
            filled: true,
          ),
          textAlign: textAlign ?? TextAlign.start,
          inputFormatters: inputFormatters,
          keyboardType: keyBoardType,
          onChanged: onChanged,
          textCapitalization:
              textCapitalization ?? TextCapitalization.sentences,
          onEditingComplete: onEdittingComplete,
          obscureText: obscureText ?? false,
        ),
      ],
    );
  }
}
