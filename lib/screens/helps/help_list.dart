import 'package:eyeforyou_plus/widgets/custom_help_screen.dart';
import 'package:flutter/material.dart';

class HelpList extends StatelessWidget {
  const HelpList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHelpScreen(
        title: "맞춤 혜택 목록",
        description: "선택한 조건(장애정도 & 카테고리)에 맞는 혜택 목록을 확인할 수 있습니다. 원하는 혜택을 선택하면 상세 정보를 볼 수 있습니다.",
        content: [
          {
            "keyword": "화면 구성",
            "detail": "각 혜택은 한 줄에 2개씩 카드 형태로 되어있습니다. 각 혜택 카드를 누르면 상세 페이지로 이동하여 지원대상, 신청 방법, 지원 내용 등의 정보를 확인할 수 있습니다."
          },
          {
            "keyword": "\n다른 혜택 보기",
            "detail": "다른 혜택을 확인하고 싶다면, 왼쪽 상단 '뒤로가기' 버튼을 눌러 이전 화면으로 돌아가서 조건을 다시 선택하세요."
          }
        ]
    );
  }
}
