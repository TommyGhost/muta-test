import 'package:babelos_app/presentation/screen/onboarding/sign_up/signup_vm.dart';
import 'package:babelos_app/routes/routes.dart';
import 'package:babelos_app/utils/__utils.dart';
import 'package:babelos_app/widgets/__widgets.dart';
import 'package:flutter/material.dart';
import 'package:babelos_app/presentation/base/base_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpDetails extends StatelessWidget {
  const SignUpDetails({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
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
                  AppStrings.enterNandP,
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
                  underline: true,
                  topLabel: AppStrings.firstName,
                  controller: model.firstName,
                  autofillHints: const [AutofillHints.name],
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                  autovalidateMode: model.autovalidateMode,
                ),
                32.0.sbH,
                InputField(
                  underline: true,
                  topLabel: AppStrings.lastName,
                  controller: model.lastName,
                  autofillHints: const [AutofillHints.name],
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please enter your lastname';
                    }
                    return null;
                  },
                  autovalidateMode: model.autovalidateMode,
                ),
                32.0.sbH,
                InputField(
                  underline: true,
                  suffixIcon: GestureDetector(
                    onTap: () => model.password.clear(),
                    child: Icon(Icons.close, size: 24.r, color: Pallet.wsBlue),
                  ),
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
                8.0.sbH,
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      size: 16.r,
                      color: model.getTextColor(model.password.text.length),
                    ),
                    8.0.sbW,
                    Text(
                      AppStrings.use8,
                      style: getRegularStyle(
                        fontSize: FontSize.s12,
                        height: 16.0.toFigmaHeight(12),
                        color: model.getTextColor(model.password.text.length),
                      ),
                    ),
                  ],
                ),
                48.0.sbH,
                BabButton(
                  loading: model.isLoading,
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (model.formKey.currentState!.validate()) {
                      String lang =
                          prefs.getString(sharedPreference.languageKey)!;
                      model.check(lang);
                    } else {
                      model.setValidateMode(AutovalidateMode.onUserInteraction);
                    }
                  },
                  title: AppStrings.signup.toUpperCase(),
                ),
                24.0.sbH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.alrMuta,
                      style: getRegularStyle(
                          fontSize: FontSize.s13,
                          height: 20.0.toFigmaHeight(13),
                          color: Pallet.wsBlue),
                    ),
                    BabInkWell(
                      onTap: () {
                        navigationService.navigateTo(AppRoutes.signIn);
                      },
                      child: Text(
                        ' ${AppStrings.login}',
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
