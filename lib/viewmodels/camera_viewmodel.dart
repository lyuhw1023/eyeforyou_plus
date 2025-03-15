import 'dart:io';
import 'package:eyeforyou_plus/views/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

class CameraProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _imagePath;
  String _resultText = "촬영된 제품 정보(코너/상품)";

  bool get isLoading => _isLoading;
  String? get imagePath => _imagePath;
  String get resultText => _resultText;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setImagePath(String path, BuildContext context) async {
    _imagePath = path;
    notifyListeners();

    // 사진 촬영 완료 메시지
    print("사진 촬영 완료: $_imagePath");

    // 2초 후 결과 화면으로 이동
    await Future.delayed(const Duration(seconds: 2));

    if(context.mounted){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ResultScreen()),
      ).then((_) {
        setLoading(false);
      });
    }
  }

  void setResultText(String text) {
    _resultText = text;
    notifyListeners();
  }

  Future<File> cropTo4by3(File imageFile) async {
    img.Image? image = img.decodeImage(imageFile.readAsBytesSync());
    if (image == null) {
      print("이미지 디코딩 실패");
      return imageFile; // 실패 시 원본 반환
    }

    final width = image.width;
    final height = image.height;

    // 4:3 비율로 크롭
    int targetHeight = (width * 4) ~/ 3;

    if (targetHeight < height) {
      int yOffset = (height - targetHeight) ~/ 2;
      image = img.copyCrop(
        image,
        x: 0,
        y: yOffset,
        width: width,
        height: targetHeight,
      );

      // 크롭된 이미지를 앱 캐시 디렉토리에 저장
      final String croppedPath =
          '${Directory.systemTemp.path}/cropped_${DateTime.now().millisecondsSinceEpoch}.jpg';
      File croppedFile = File(croppedPath);
      croppedFile.writeAsBytesSync(img.encodeJpg(image));

      return croppedFile;
    }
    return imageFile;
  }
}
