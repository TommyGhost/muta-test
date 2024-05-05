import 'package:babelos_app/presentation/base/base.vm.dart';

class HomeViewModel extends BaseViewModel {
  String selectedItem = 'Yoruba Lessons';

  List<String> items = [
    'Yoruba Lessons',
    'Swahili Lessons',
    'Amharic Lessons',
  ];

  onChanged(String value) {
    selectedItem = value;
    notifyListeners();
  }
}
