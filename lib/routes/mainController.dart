import 'package:flutter/material.dart';
import 'package:get/get.dart';

final MainController controller = Get.put(MainController());

// ignore: deprecated_member_use
class MainController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 5, vsync: this, initialIndex: 2);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
