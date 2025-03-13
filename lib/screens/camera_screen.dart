import 'dart:async';
import 'dart:io';
import 'package:eyeforyou_plus/screens/benefits/selection_screen.dart';
import 'package:eyeforyou_plus/screens/result_screen.dart';
import 'package:eyeforyou_plus/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;
import 'package:lottie/lottie.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  late List<CameraDescription> cameras;
  String? _imagePath;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    // 기존 컨트롤러 해제
    if (_controller != null) {
      await _controller!.dispose();
    }

    WidgetsFlutterBinding.ensureInitialized();
    // 사용 가능한 카메라 목록
    cameras = await availableCameras();
    _controller = CameraController(cameras.first, ResolutionPreset.medium,
        enableAudio: false);

    try {
      await _controller!.initialize();
      if (!mounted) return;
      setState(() {});
    } catch (e) {
      print('Camera initialization failed: $e');
    }
  }

  Future<void> _takePicture() async {
    if (_controller?.value.isInitialized != true) {
      print('Controller is not initialized');
      return;
    }

    // 로딩 화면 즉시 띄움
    setState(() {
      _isLoading = true;
    });

    try {
      final XFile image = await _controller!.takePicture();
      File imageFile = File(image.path);

      // 4:3 비율로 크롭 처리
      File croppedFile = await _cropTo4by3(imageFile);

      setState(() {
        _imagePath = croppedFile.path;
      });

      print("사진 촬영 완료: $_imagePath");

      // 2초 후 결과 화면으로 이동
      await Future.delayed(const Duration(seconds: 2));

      // 이미지 전달
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(imagePath: _imagePath!),
          ),
        ).then((_) {
          // 결과 화면에서 돌아왔을 때 로딩 해제
          setState(() {
            _isLoading = false;
          });
        });
      }
    } catch (e) {
      print("사진 촬영 중 오류 발생 : $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  // 4:3 비율로 이미지 크롭
  Future<File> _cropTo4by3(File imageFile) async {
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
    }

    // 크롭된 이미지를 새로운 파일로 저장
    /*File croppedFile = File('${imageFile.path}_cropped.jpg');
    croppedFile.writeAsBytesSync(img.encodeJpg(image));*/

    // 크롭된 이미지를 앱 캐시 디렉토리에 저장
    final String croppedPath =
        '${Directory.systemTemp.path}/cropped_${DateTime.now().millisecondsSinceEpoch}.jpg';
    File croppedFile = File(croppedPath);
    croppedFile.writeAsBytesSync(img.encodeJpg(image));

    return croppedFile;
  }

  @override
  void dispose() {
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // 혜택 정보 페이지
        onLeftButtonPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectionScreen()),
          );
        },
        // 추후 도움말 페이지 연결
        onHelpPressed: () {},
      ),
      body: Stack(children: [
        _controller?.value.isInitialized ?? false
            ? Center(
                child: GestureDetector(
                  onTap: _takePicture,
                  child: CameraPreview(_controller!),
                ),
              )
            : Container(),
        if (_isLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: Lottie.asset(
                'assets/lottie/loading2.json',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
          )
      ]),
    );
  }
}
