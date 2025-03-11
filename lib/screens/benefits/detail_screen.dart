import 'package:eyeforyou_plus/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;

  DetailScreen({Key? key, required this.title}) : super(key: key);

  final Map<String, String> descriptions = {
    "장애인 콜택시 지원": "장애인을 위한 이동 서비스 지원",
    "건강보험": "특정 질환자 및 장애인 대상 건강보험 혜택",
    "긴급복지": "긴급 상황에서 제공되는 복지 지원",
    "재난적 의료비 지원": "예상치 못한 의료비 부담 완화를 위한 지원",
  };

  final List<Map<String, String>> details = [
    {
      "keyword": "서비스 대상",
      "detail": "만 18세 미만 장애인 아동",
    },
    {
      "keyword": "지원 내용",
      "detail": "장애인 이동 서비스, 의료비 지원",
    },
    {
      "keyword": "신청 방법",
      "detail": "시청 및 주미센터 방문 신청",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        onBackPressed: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(
                descriptions.containsKey(title)
                    ? descriptions[title]!
                    : "설명 없음",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Divider(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: details.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          details[index]["keyword"]!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          details[index]["detail"]!,
                          style: const TextStyle(
                              fontSize: 14,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
