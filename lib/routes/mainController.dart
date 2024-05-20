import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

final MainController controller = Get.put(MainController());

class CustomIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomIndicatorPainter(this);
  }
}

class _CustomIndicatorPainter extends BoxPainter {
  final CustomIndicator decoration;

  _CustomIndicatorPainter(this.decoration);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint();
    paint.color = Colors.orange; // 선택 표시의 색상을 설정하세요.
    canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(2.0)), paint);
  }
}