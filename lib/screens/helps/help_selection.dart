import 'package:eyeforyou_plus/widgets/custom_help_screen.dart';
import 'package:flutter/material.dart';

class HelpSelection extends StatelessWidget {
  const HelpSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHelpScreen(
        title: "중증/경증 선택",
        description: "사용자의 중증도에 따라 결과를 선택할 수 있습니다. 화면에는 중증 버튼과 경증 버튼이 있습니다. 둘 중 해당하는 등급의 버튼을 선택하세요.",
        content: [
          {
            "keyword": "중증과 경증",
            "detail": "중증은 1급에서 3급, 경증은 4급에서 6급을 뜻합니다."
          },
          {
            "keyword": "사용 방법",
            "detail": "등급을 선택하면 다음 조건을 선택하는 페이지로 넘어갑니다. 다음 조건은 생애주기와 복지서비스입니다."
          },
        ]
    );
  }
}
