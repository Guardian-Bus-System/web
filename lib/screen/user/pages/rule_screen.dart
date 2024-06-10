import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/user/widget/custom_appbar.dart';
import 'package:capstone_front/screen/user/widget/ruleRow_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class RuleScreen extends StatelessWidget {
  const RuleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: CustomAppBar(
          appBarTitle: '규칙',
        ),
      ),
      body: Column(
        children: [
          height20,
          Row(
            children: [
              '교내 귀가버스 규칙은 다음과 같다.'.text.bold.size(FontSiz16).color(baseColor).make(),
            ],
          ),
          height20,
          const RuleRowWidget(
            number: 1,
            ruleText: '학교 뒷문 공터에서 14:25 ~ 14:40 사이에 탑승한다.',
          ),
          const RuleRowWidget(
            number: 2,
            ruleText: '캐리어는 코딩관 뒷문에 자신의 캐리어가 헷갈리지 않게 표시해둔다.',
          ),
          const RuleRowWidget(
            number: 3,
            ruleText: '작은 짐은 교실에 보관한다.',
          ),
          const RuleRowWidget(
            number: 4,
            ruleText: '동아리 수업 시 짐을 가지고 이동한다.',
          ),
          const RuleRowWidget(
            number: 5,
            ruleText: '동아리 수업이 마치면 바로 귀가버스에 탑승한다.',
          ),
          const RuleRowWidget(
            number: 6,
            ruleText: '귀가버스 탑승 시 안전에 주의한다.',
          ),
          const RuleRowWidget(
            number: 7,
            ruleText: '탑승 후 버스별 관리학생이 인원점검을 할 때 적극 협조한다.',
          ),
        ],
      ).pOnly(left: 25),
    );
  }
}