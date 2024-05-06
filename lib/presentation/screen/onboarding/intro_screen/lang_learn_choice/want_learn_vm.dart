import 'package:babelos_app/domain/models/languages_response.dart';
import 'package:babelos_app/presentation/base/base.vm.dart';

class WantLearnViewModel extends BaseViewModel {
  String _langDescription = '';
  String _langName = '';

  String get langDescription => _langDescription;
  String get langName => _langName;

  void updateLang(String newLang) {
    _langDescription = newLang;
    print(newLang);

    notifyListeners();
  }

  void updateLangName(String newLang) {
    _langName = newLang;
    print(newLang);

    notifyListeners();
  }

  Future<GetLanguagesResponse?> languages() async {
    GetLanguagesResponse? getLanguagesResponse =
        await userRepository.getLanguage();
    return getLanguagesResponse;
  }
}
