import 'dart:async';
import 'dart:io';
import 'package:eyeforyou_plus/providers/camera_provider.dart';
import 'package:eyeforyou_plus/screens/benefits/selection_screen.dart';
import 'package:eyeforyou_plus/screens/helps/help_main.dart';
import 'package:eyeforyou_plus/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  late List<CameraDescription> cameras;

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

  Future<void> _takePicture(BuildContext context) async {
    final provider = Provider.of<CameraProvider>(context, listen: false);
    if (_controller?.value.isInitialized != true) {
      print('Controller is not initialized');
      return;
    }

    provider.setLoading(true);

    try {
      final XFile image = await _controller!.takePicture();
      File imageFile = File(image.path);

      // 4:3 비율로 크롭 처리
      File croppedFile = await provider.cropTo4by3(imageFile);

      provider.setImagePath(croppedFile.path, context);

    } catch (e) {
      print("사진 촬영 중 오류 발생 : $e");
      provider.setLoading(false);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CameraProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
        // 혜택 정보 페이지
        onLeftButtonPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectionScreen()),
          );
        },
        // 메인 도움말 페이지
        onHelpPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HelpMain()),
          );
        },
      ),
      body: Stack(children: [
        _controller?.value.isInitialized ?? false
            ? Center(
                child: Semantics(
                  label: "카메라",
                  child: GestureDetector(
                    onTap: () {
                      // 비동기적으로 "로딩중" 읽음
                      Future.microtask(() {
                        SemanticsService.announce("로딩 중", TextDirection.ltr);
                      });
                      // 사진 촬영 실행
                      _takePicture(context);
                    },
                    child: CameraPreview(_controller!),
                  ),
                ),
              )
            : Container(),
        if (provider.isLoading)
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