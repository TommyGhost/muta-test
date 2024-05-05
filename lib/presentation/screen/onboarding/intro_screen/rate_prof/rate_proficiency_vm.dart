import 'package:babelos_app/presentation/base/base.vm.dart';
import 'package:babelos_app/utils/app_strings.dart';

class RateProfViewModel extends BaseViewModel {
  String _levelDescription = 'ok';

  String get levelDescription => _levelDescription;

  void updateLevel(String newLevel) {
    String newDescription = getLevelDescription(newLevel);
    if (_levelDescription != newDescription) {
      _levelDescription = newDescription;
      notifyListeners();
    }
    print(newDescription);
  }

  String getLevelDescription(String level) {
    switch (level) {
      case 'novice':
        return AppStrings.novice;
      case 'beginner':
        return AppStrings.beginner;
      case 'intermediate':
        return AppStrings.intermediate;
      default:
        return 'ok';
    }
  }
}
