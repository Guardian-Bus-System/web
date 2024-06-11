import 'package:get/get.dart';

class AdminController extends GetxController {
  RxInt selectedIndex = 1.obs;
  RxString selectedSubMenu = ''.obs;

  void toggleMenu(int index) {
    if (selectedIndex.value == index) {
      selectedIndex.value = -1;
      selectedSubMenu.value = '';
    } else {
      selectedIndex.value = index;
      selectedSubMenu.value = '';
    }
  }

  void selectSubMenu(String text) {
    selectedSubMenu.value = text;
  }
}
