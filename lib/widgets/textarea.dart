import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/font_manager.dart';
import '../utils/pallet.dart';
import '../utils/style_manager.dart';
import '../utils/value_manager.dart';

class Textarea extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final TextAlign? textAlign;
  final TextInputType? keyBoardType;
  final String? Function(String? val)? validationCallback;
  final void Function()? onEdittingComplete;
  final String? formError;
  final String label;
  final String? hintText;
  final FocusNode? focusnode;
  final TextEditingController? controller;
  final String? message;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Function()? clearForm;
  final Function()? onTap;
  final Function(String)? onChanged;
  final int? maxLength;
  final bool? enabled;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final Color? hintColor;
  final bool? showCursor;
  final bool readOnly;
  final Widget? labelRightItem;
  final TextStyle? labelStyle;
  final int? minLines;
  final int? maxLines;

  const Textarea({
    this.autovalidateMode,
    this.inputFormatters,
    this.textAlign,
    this.keyBoardType,
    this.onEdittingComplete,
    this.validationCallback,
    this.message,
    this.hintText,
    this.label = '',
    this.formError,
    this.focusnode,
    this.controller,
    this.clearForm,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.onChanged,
    this.onTap,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.enabled = true,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.fillColor,
    this.hintColor,
    this.showCursor,
    this.readOnly = false,
    this.labelRightItem,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: labelStyle ??
                  getRegularStyle(
                    fontSize: FontSize.s14,
                  ),
            ),
            if (labelRightItem != null) labelRightItem!,
          ],
        ),
        const SizedBox(
          height: AppSize.s4,
        ),
        TextField(
          showCursor: showCursor,
          readOnly: readOnly,
          maxLength: 1000,
          enabled: enabled,
          onTap: onTap,
          minLines: minLines,
          maxLines: 6,
          focusNode: focusnode,
          controller: controller,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            fillColor: Theme.of(context).primaryColorLight,
            counterText: '',
            hintStyle: getRegularStyle(
                color: hintColor ?? Pallet.grey,
                fontSize: FontSize.s14),
            isDense: true,
            hintText: hintText,
            errorText: formError,
            contentPadding:
                const EdgeInsets.only(left: 16, top: 18, bottom: 16),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            filled: true,
          ),
          textAlign: textAlign ?? TextAlign.start,
          style: getRegularStyle(
            // color: Pallet.white,
            fontSize: FontSize.s14,
          ),
          inputFormatters: inputFormatters,
          keyboardType: keyBoardType,
          onChanged: onChanged,
          onEditingComplete: onEdittingComplete,
          obscureText: obscureText ?? false,
        ),
      ],
    );
  }
}
