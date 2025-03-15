import 'dart:io';
import 'package:eyeforyou_plus/viewmodels/camera_viewmodel.dart';
import 'package:eyeforyou_plus/views/helps/help_result.dart';
import 'package:eyeforyou_plus/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CameraProvider>(context, listen: false);

    // 0.5초 후 읽기
    Future.delayed(Duration(milliseconds: 500), () {
      if (provider.imagePath != null) {
        SemanticsService.announce(provider.resultText, TextDirection.ltr);
      }
    });

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
          if (provider.imagePath != null)
            // 촬영한 이미지 표시
            Expanded(
              child: Image.file(File(provider.imagePath!), fit: BoxFit.cover),
            ),
          const SizedBox(height: 10),
          // 결과값 출력
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              provider.resultText,
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
