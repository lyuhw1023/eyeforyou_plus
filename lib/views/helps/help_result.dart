import 'package:eyeforyou_plus/widgets/custom_help_screen.dart';
import 'package:flutter/material.dart';

class HelpResult extends StatelessWidget {
  const HelpResult({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHelpScreen(
        title: "결과 화면 안내",
        description: "AI 카메라가 인식한 물건의 정보를 보여줍니다. 보이스 오버 기능을 통해 정보를 음성으로 들을 수 있습니다.",
        content: [
          {
            "keyword": "결과 화면 구성",
            "detail": "물건을 찍으면 물건의 정보를 알려주고, 공간을 찍으면 해당 코너의 정보를 알려줍니다."
          },
          {
            "keyword": "\n홈으로 돌아가기",
            "detail": "뒤로가기 버튼을 누르면 홈으로 돌아갑니다.\n"
                "홈으로 돌아가면 다시 촬영할 수 있습니다."
          }
        ]
    );
  }
}
