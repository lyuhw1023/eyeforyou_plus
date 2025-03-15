import 'package:eyeforyou_plus/widgets/custom_help_screen.dart';
import 'package:flutter/material.dart';

class HelpCategory extends StatelessWidget {
  const HelpCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHelpScreen(
        title: "카테고리 선택 ",
        description:
            "화면에는 생애주기 버튼과 복지서비스 버튼이 있습니다. 둘 중 해당하는 서비스의 버튼을 선택하세요. 버튼을 클릭하면 해당 목록이 나옵니다.",
        content: [
          {
            "keyword": "생애주기 선택",
            "detail":
                "연령대에 따라 받을 수 있는 혜택을 찾고싶다면 '생애주기'를 선택하세요. 이후 나타나는 목록에서 본인의 연령대를 선택하면 해당 혜택을 확인할 수 있습니다."
                    "목록에는 영유아, 아동청소년, 성인, 노인 이 있습니다.\n"
          },
          {
            "keyword": "복지서비스 선택",
            "detail":
                "필요한 복지 분야를 중심으로 혜택을 찾고싶다면 '복지서비스'를 선택하세요. 이후 나타나는 목록에서 원하는 서비스를 선택하면 해당 혜택을 확인할 수 있습니다."
                    "목록에는 생활안정, 고용, 거주/이용, 보육/교육, 건강/의료, 문화/여가, 편의, 보조기기, 권익, 상담, 바우처 가 있습니다\n"
          },
          {
            "keyword": "선택 후 다음 단계",
            "detail":
            "버튼을 누르면 선택한 카테고리에 맞는 목록이 화면에 나타납니다. 원하는 항복을 클릭하면 혜택 리스트를 확인할 수 있습니다."
          },
        ]);
  }
}
