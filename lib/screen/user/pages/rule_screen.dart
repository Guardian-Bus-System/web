import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/controller/userController/rules_controller.dart';
import 'package:capstone_front/model/RulesModel.dart';
import 'package:capstone_front/screen/user/auth/login_page.dart';
import 'package:capstone_front/screen/user/widget/custom_appbar.dart';
import 'package:capstone_front/screen/user/widget/ruleRow_widget.dart';
import 'package:capstone_front/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class RuleScreen extends StatefulWidget {
  const RuleScreen({super.key});

  @override
  _RuleScreenState createState() => _RuleScreenState();
}

class _RuleScreenState extends State<RuleScreen> {
  RulesController rulesController = RulesController();

  late RxList<Rule> rules = <Rule>[].obs;

  @override
  void initState() {
     _getRules();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _getRules() async {
    if (await checkTokens()) {
      RuleResponse ruleResponse = await rulesController.getRules();
      rules.value = ruleResponse.data;
    }else{
      Get.to(LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: CustomAppBar(
          appBarTitle: '규칙',
        ),
      ),
      body: Obx(() {
        if (rules.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            height20,
            Row(
              children: [
                '교내 귀가버스 규칙은 다음과 같다.'.text.bold.size(FontSiz16).color(baseColor).make(),
              ],
            ),
            height20,
            ...rules.map((rule) => RuleRowWidget(
              number: rule.number,
              ruleText: rule.content,
            )),
          ],
        ).pOnly(left: 25);
      }),
    );
  }
}
