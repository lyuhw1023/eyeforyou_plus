import 'dart:io';
import 'package:flutter/material.dart';
import 'camera_screen.dart';

class ResultScreen extends StatelessWidget {
  final String imagePath;

  const ResultScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("결과 화면")),
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
