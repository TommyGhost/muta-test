import 'package:babelos_app/presentation/screen/onboarding/sign_in/sign_in_vm.dart';
import 'package:babelos_app/routes/routes.dart';
import 'package:babelos_app/utils/__utils.dart';
import 'package:babelos_app/widgets/__widgets.dart';
import 'package:flutter/material.dart';
import 'package:babelos_app/presentation/base/base_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInDetails extends StatelessWidget {
  const SignInDetails({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BaseView<SignInViewModel>(
      onModelReady: (model) {
        model.emails = TextEditingController(text: email);
      },
      builder: (context, model, child) => Scaffold(
        appBar: const Navbar(
          elevation: 0,
          showLeading: true,
        ),
        body: SingleChildScrollView(
          padding: padOnly(left: 17, right: 16, top: 24),
          child: Form(
            key: model.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.enterPass,
                  style: getBoldStyle(
                      fontSize: FontSize.s24,
                      height: 40.0.toFigmaHeight(24),
                      color: Pallet.white),
                  textAlign: TextAlign.center,
                ),
                40.0.sbH,
                InputField(
                  underline: true,
                  topLabel: AppStrings.email,
                  keyBoardType: TextInputType.emailAddress,
                  controller: model.emails,
                  autofillHints: const [AutofillHints.email],
                  validator: (val) {
                    String validate = val!.replaceAll(RegExp(r"\s+"), "");
                    if (validate.isEmpty ||
                        !RegExp(model.emailReg).hasMatch(validate)) {
                      return 'Enter valid email';
                    }
                    return null;
                  },
                  autovalidateMode: model.autovalidateMode,
                  textCapitalization: TextCapitalization.none,
                ),
                32.0.sbH,
                InputField(
                  obscureText: !model.isPasswordVisible,
                  suffixIcon: GestureDetector(
                    onTap: () => model.togglePasswordVisibility(),
                    child: Icon(
                        model.isPasswordVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 24.w,
                        weight: 2.0,
                        color: Pallet.visible),
                  ),
                  underline: true,
                  topLabel: AppStrings.password,
                  controller: model.password,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter your new password";
                    } else if (val.length < 8) {
                      return "Enter a password of at least 8 characters";
                    }
                    return null;
                  },
                  autovalidateMode: model.autovalidateMode,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.done,
                ),
                16.0.sbH,
                Text(
                  AppStrings.forgotPass,
                  style: getRegularStyle(
                      fontSize: FontSize.s14,
                      height: 16.0.toFigmaHeight(14),
                      color: Pallet.visible),
                ),
                48.0.sbH,
                BabButton(
                  loading: model.isLoading,
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (model.formKey.currentState!.validate()) {
                      model.check();
                    } else {
                      model.setValidateMode(AutovalidateMode.onUserInteraction);
                    }
                  },
                  title: AppStrings.login.toUpperCase(),
                ),
                24.0.sbH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.dontHave,
                      style: getRegularStyle(
                          fontSize: FontSize.s13,
                          height: 20.0.toFigmaHeight(13),
                          color: Pallet.wsBlue),
                    ),
                    BabInkWell(
                      onTap: () {
                        navigationService.navigateTo(AppRoutes.langSel);
                      },
                      child: Text(
                        ' ${AppStrings.signup}',
                        style: TextStyle(
                          fontSize: FontSize.s13,
                          fontFamily: AppStrings.fontFamily,
                          fontWeight: FontWeight.w400,
                          height: 20.0.toFigmaHeight(13),
                          color: Pallet.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: Pallet.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
