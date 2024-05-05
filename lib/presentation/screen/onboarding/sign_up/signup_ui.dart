import 'package:babelos_app/presentation/screen/onboarding/sign_up/signup_vm.dart';
import 'package:babelos_app/routes/routes.dart';
import 'package:babelos_app/utils/__utils.dart';
import 'package:babelos_app/widgets/__widgets.dart';
import 'package:flutter/material.dart';
import 'package:babelos_app/presentation/base/base_ui.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
      onModelReady: (model) {},
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
                  AppStrings.signUpAndLearn,
                  style: getBoldStyle(
                      fontSize: FontSize.s24,
                      height: 40.0.toFigmaHeight(24),
                      color: Pallet.white),
                  textAlign: TextAlign.center,
                ),
                56.0.sbH,
                const SignUpOptionsCard(google: true),
                const SignUpOptionsCard(google: false),
                32.0.sbH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Divider(
                      height: 0.5,
                      color: Pallet.divider,
                    ),
                    Text(
                      AppStrings.or.toUpperCase(),
                      style: getBoldStyle(
                          fontSize: FontSize.s14,
                          height: 16.0.toFigmaHeight(14),
                          color: Pallet.wsBlue),
                    ),
                    const Divider(
                      height: 0.5,
                      color: Pallet.divider,
                    ),
                  ],
                ),
                40.0.sbH,
                InputField(
                  underline: true,
                  keyBoardType: TextInputType.emailAddress,
                  hintText: AppStrings.enterEmail,
                  controller: model.email,
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
                40.0.sbH,
                BabButton(
                  loading: model.isLoading,
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (model.formKey.currentState!.validate()) {
                      navigationService.navigateTo(AppRoutes.signUpDets, argument: model.email.text.trim());
                    } else {
                      model.setValidateMode(AutovalidateMode.onUserInteraction);
                    }
                  },
                  title: AppStrings.signUpE.toUpperCase(),
                ),
                24.0.sbH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.alrMuta,
                      style: getRegularStyle(
                          fontSize: FontSize.s13, height: 20.0.toFigmaHeight(13), color: Pallet.wsBlue),
                    ),
                    BabInkWell(
                      onTap: () {
                        navigationService.navigateTo(AppRoutes.signIn);
                      },
                      child: Text(
                        ' ${AppStrings.login}',
                        style:  TextStyle(
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
