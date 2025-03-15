import 'package:eyeforyou_plus/widgets/custom_help_screen.dart';
import 'package:flutter/material.dart';

class HelpMain extends StatelessWidget {
  const HelpMain({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHelpScreen(
        title: "AI 카메라 서비스",
        description: "편의점 물건들을 카메라로 찍으면, 물건이 무엇인지 보이스 오버 기능을 통해 읽어줍니다.",
        content: [
          {
            "keyword": "기능소개",
            "detail": "물건 인식: 편의점에서 카메라로 물건을 찍으면 물건의 정보를, 여러개를 찍으면 코너 정보를 알려줍니다."
          },
          {
            "keyword": "\n사용 방법",
            "detail": "1. 카메라로 물건 찍기: 편의점에서 원하는 사진을 카메라로 찍으세요. 화면의 아무 곳이나 누르면 사진이 찍힙니다.\n\n"
            "2. 물건 정보 듣기: 찍힌 물건의 정보를 보이스 오버 기능으로 음성을 확인하세요."
          }
        ]
    );
  }
}
