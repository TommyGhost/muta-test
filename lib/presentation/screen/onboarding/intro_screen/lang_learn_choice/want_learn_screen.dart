import 'package:babelos_app/domain/models/languages_response.dart';
import 'package:babelos_app/presentation/base/base_ui.dart';
import 'package:babelos_app/presentation/screen/onboarding/intro_screen/lang_learn_choice/want_learn_vm.dart';
import 'package:babelos_app/routes/routes.dart';
import 'package:babelos_app/utils/__utils.dart';
import 'package:babelos_app/widgets/__widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WantLearn extends StatelessWidget {
  const WantLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<WantLearnViewModel>(
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
                AppStrings.wantLearn,
                style: getSemiBoldStyle(
                    fontSize: FontSize.s20,
                    height: 32.0.toFigmaHeight(20),
                    color: Pallet.white),
              ),
              32.0.sbH,
              FutureBuilder<GetLanguagesResponse?>(
                future: model.languages(),
                builder: (context, snapshot) {
                  GetLanguagesResponse? request = snapshot.data;
                  var languages = request?.data;
                  if (snapshot.data != null) {
                    return Container(
                      child: languages?.length == 0
                          ? Container(
                              alignment: Alignment.center,
                              width: 200.w,
                              height: 200.h,
                              child: Column(
                                children: [
                                  40.0.sbH,
                                  Container(
                                    height: 100.h,
                                    width: 100.w,
                                    padding: pad(horiz: 7, vert: 7),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(100.r),
                                      color: Pallet.primary.withOpacity(0.07),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.close,
                                        size: 80.w,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  15.0.sbH,
                                  Text(
                                    'You have no languages',
                                    style:
                                        getMediumStyle(fontSize: FontSize.s15),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(
                              width: width(context),
                              child: GridView.builder(
                                shrinkWrap: true,
                                padding: pad(),
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemCount: languages?.length ?? 0,
                                itemBuilder: (_, index) {
                                  Data? newLanguage = languages?[index];
                                  return SelectLangLearn(
                                    index: index,
                                    image: newLanguage?.languageIcon ?? '',
                                    title: newLanguage?.languageName ?? '',
                                    isSelected: model.langDescription ==
                                        newLanguage?.languageId,
                                    onTap: () {
                                      model.updateLang(
                                          newLanguage?.languageId ?? '');
                                      model.updateLangName(
                                          newLanguage?.languageName ?? '');
                                    },
                                  );
                                },
                              ),
                            ),
                    );
                  } else {
                    return const LanguageShimmerCart();
                  }
                },
              ),
              66.0.sbH,
              BabButton(
                onPressed: () async {
                  if (model.langName == '') {
                    showCustomToast('Please select a language');
                  } else {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString(
                        sharedPreference.languageKey, model.langDescription);
                    navigationService.navigateTo(AppRoutes.rateProf,
                        argument: model.langName);
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
