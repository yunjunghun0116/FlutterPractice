
import 'package:get/get.dart';

class OptionViewController extends GetxController {

  final _isVisible = true.obs;
  set isVisible(value) {
    _isVisible.value = value;
    if (_isVisible.value == false) selectedLists.clear();
  }
  get isVisible => _isVisible.value;

  final RxList _selectedLists = [].obs;
  set selectedLists(value) => _selectedLists.value = value;
  List get selectedLists {
    _selectedLists.refresh();
    return _selectedLists.value;
  }

  // 선택 여부 체크
  void checkSelected(data) {
    selectedLists.contains(data) ? selectedLists.remove(data) : selectedLists.add(data);
  }

  // 값 추가
  void selectedValue(value) {
    _selectedLists.add(value);
  }
}