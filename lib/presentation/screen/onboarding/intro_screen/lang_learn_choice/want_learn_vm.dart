import 'package:babelos_app/domain/models/languages_response.dart';
import 'package:babelos_app/presentation/base/base.vm.dart';

class WantLearnViewModel extends BaseViewModel {
  String _langDescription = '';

  String get langDescription => _langDescription;

  void updateLang(String newLang) {
    _langDescription = newLang;
    print(newLang);

    notifyListeners();
  }

  Stream<GetLanguagesResponse?> languages() async* {
    GetLanguagesResponse? getLanguagesResponse =
        await userRepository.getLanguage();
    yield getLanguagesResponse;
  }
}
