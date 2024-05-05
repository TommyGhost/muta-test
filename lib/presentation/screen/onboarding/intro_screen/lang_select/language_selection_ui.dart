import 'package:babelos_app/presentation/base/base_ui.dart';
import 'package:babelos_app/presentation/screen/onboarding/intro_screen/lang_select/language_selection_vm.dart';
import 'package:babelos_app/routes/routes.dart';
import 'package:babelos_app/utils/__utils.dart';
import 'package:babelos_app/widgets/__widgets.dart';
import 'package:babelos_app/widgets/dumb_widgets/language_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LangSelection extends StatelessWidget {
  const LangSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LangSelectionViewModel>(
      onModelReady: (model) {},
      builder: (context, model, child) => Scaffold(
        appBar: const Navbar(
          showLeading: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: padOnly(left: 17.w, right: 16.w, top: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectLang(
                onTap: () => model.updateLang('english'),
                image: AppImages.english,
                text: AppStrings.speakEng,
                isSelected: model.langDescription == 'english',
              ),
              SelectLang(
                onTap: () => model.updateLang('french'),
                image: AppImages.french,
                text: AppStrings.speakFre,
                isSelected: model.langDescription == 'french',
              ),
              SelectLang(
                onTap: () => model.updateLang('portuguese'),
                image: AppImages.portuguese,
                text: AppStrings.speakPort,
                isSelected: model.langDescription == 'portuguese',
              ),
              SelectLang(
                onTap: () => model.updateLang('spanish'),
                image: AppImages.spanish,
                text: AppStrings.speakEsp,
                isSelected: model.langDescription == 'spanish',
              ),
              24.0.sbH,
              BabButton(
                onPressed: () {
                  navigationService.navigateTo(AppRoutes.wantLearn);
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
