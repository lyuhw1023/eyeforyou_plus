import 'dart:io';
import 'package:eyeforyou_plus/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String imagePath;
  final String resultText = "촬영된 제품 정보(코너/상품)";

  const ResultScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "사진 확인",
        // 뒤로가기 버튼
        onBackPressed: () {
          Navigator.pop(context);
        },
        // 추후 도움말 페이지 연결
        onHelpPressed: () {},
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 촬영한 이미지 표시
          Expanded(
            child: Image.file(File(imagePath), fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          // 결과값 출력
          Padding(
              padding: const EdgeInsets.all(16.0),
            child: Text(
              resultText,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
