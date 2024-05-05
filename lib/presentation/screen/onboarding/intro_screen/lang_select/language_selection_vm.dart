import 'package:babelos_app/presentation/base/base.vm.dart';

class LangSelectionViewModel extends BaseViewModel {
  String _langDescription = 'english';

  String get langDescription => _langDescription;

  void updateLang(String newLang) {
    String newDescription = getLangDescription(newLang);
    if (_langDescription != newDescription) {
      _langDescription = newDescription;
      notifyListeners();
    }
    print(newDescription);
  }

  String getLangDescription(String lang) {
    switch (lang) {
      case 'english':
        return 'english';
      case 'french':
        return 'french';
      case 'spanish':
        return 'spanish';
      case 'portuguese':
        return 'portuguese';
      default:
        return 'english';
    }
  }
}
