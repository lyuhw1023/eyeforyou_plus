import 'dart:io';
import 'package:eyeforyou_plus/screens/helps/help_result.dart';
import 'package:eyeforyou_plus/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResultScreen extends StatefulWidget {
  final String imagePath;
  final String resultText;

  const ResultScreen(
      {super.key,
        required this.imagePath,
        this.resultText = "촬영된 제품 정보(코너/상품)"});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500), () {
      SemanticsService.announce(widget.resultText, TextDirection.ltr);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "사진 확인",
        // 뒤로가기 버튼
        onBackPressed: () {
          Navigator.pop(context);
        },
        // 결과 페이지 도움말
        onHelpPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HelpResult()),
          );
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 촬영한 이미지 표시
          Expanded(
            child: Image.file(File(widget.imagePath), fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          // 결과값 출력
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.resultText,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
