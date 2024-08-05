import 'package:get/get.dart';

class AdminMainController extends GetxController {
  var selectedIndex = 1.obs;
  var selectedSubMenu = Rxn<String>();
  var currentRoute = ''.obs;

  void toggleMenu(int index) {
    selectedIndex.value = selectedIndex.value == index ? -1 : index;
    selectedSubMenu.value = null;
  }

  void onMenuItemTap(Map<String, String> item) {
    selectedSubMenu.value = item['text'];
    currentRoute.value = item['route']!;
  }

  void onButtonTap(int index, String route) {
    selectedIndex.value = index;
    currentRoute.value = route;
  }
}
