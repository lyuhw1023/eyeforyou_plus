import 'dart:io';
import 'package:eyeforyou_plus/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'camera_screen.dart';

class ResultScreen extends StatelessWidget {
  final String imagePath;

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
          const SizedBox(height: 20),

          // 다시 촬영하기 버튼
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const CameraScreen()),
              );
            },
            child: const Text("다시 촬영하기",),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
