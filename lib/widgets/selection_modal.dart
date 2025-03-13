import 'package:flutter/material.dart';

class SelectionModal {
  // 모달창 띄우기
  static void show({
    required BuildContext context,
    required String categoryType,
    required Function(String) onItemSelected,
  }) {
    // 선택할 리스트 데이터
    final List<String> items = categoryType == "생애주기"
        ? ["영유아", "아동청소년", "성인", "노인"]
        : ["생활안정", "가족지원", "고용", "거주/이용", "보육/교육", "건강/의료",
      "문화/여가", "편의", "보조기기", "권익", "상담", "바우처"];

    showModalBottomSheet(
        context: context,
        // 모달 높이 자동 조절
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
      builder: (BuildContext context){
          return Container(
            constraints: BoxConstraints(
              // 최대 높이 70% 제한
              maxHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "$categoryType를 선택하세요",
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  Flexible(
                      child: ListView.separated(
                          shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: items.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index){
                          return ListTile(
                            title: Text(
                              items[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 18),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              onItemSelected(items[index]);
                            },
                          );
                        },
                      ),
                  ),
                ],
              ),
          );
      }
    );
  }
}
