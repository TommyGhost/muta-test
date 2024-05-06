import 'package:babelos_app/presentation/base/base_ui.dart';
import 'package:babelos_app/presentation/screen/onboarding/intro_screen/rate_prof/rate_proficiency_vm.dart';
import 'package:babelos_app/routes/routes.dart';
import 'package:babelos_app/utils/__utils.dart';
import 'package:babelos_app/widgets/__widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RateProficiency extends StatelessWidget {
  const RateProficiency({super.key, required this.language});

  final String language;

  @override
  Widget build(BuildContext context) {
    return BaseView<RateProfViewModel>(
      onModelReady: (model) {},
      builder: (context, model, child) => Scaffold(
        appBar: const Navbar(
          showLeading: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: padOnly(left: 17, right: 16, top: 24, down: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${AppStrings.rateProf}$language',
                style: getSemiBoldStyle(
                    fontSize: FontSize.s20,
                    height: 32.0.toFigmaHeight(20),
                    color: Pallet.white),
              ),
              64.0.sbH,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RateProfCard(
                    onTap: () =>
                        model.updateLevel(AppStrings.novice.toLowerCase()),
                    title: AppStrings.novice,
                    subtitle: '${AppStrings.newTo}$language',
                    isSelected: model.levelDescription == AppStrings.novice,
                  ),
                  RateProfCard(
                    onTap: () =>
                        model.updateLevel(AppStrings.beginner.toLowerCase()),
                    title: AppStrings.beginner,
                    subtitle: '${AppStrings.knowSomeWrds}$language',
                    isSelected: model.levelDescription == AppStrings.beginner,
                  ),
                  RateProfCard(
                    onTap: () => model
                        .updateLevel(AppStrings.intermediate.toLowerCase()),
                    title: AppStrings.intermediate,
                    subtitle: '${AppStrings.simpConv}$language',
                    isSelected:
                        model.levelDescription == AppStrings.intermediate,
                  ),
                ],
              ),
              152.0.sbH,
              BabButton(
                onPressed: () async {
                  if (model.levelDescription == 'ok') {
                    showCustomToast('Please select your proficiency level');
                  } else {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString(
                        sharedPreference.levelKey, model.levelDescription);
                    navigationService.navigateTo(AppRoutes.signUp);
                  }
                },
                title: AppStrings.cont.toUpperCase(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
