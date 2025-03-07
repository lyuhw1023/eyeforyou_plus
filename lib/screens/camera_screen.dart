import 'dart:async';
import 'package:eyeforyou_plus/screens/loading_screen.dart';
import 'package:eyeforyou_plus/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  late List<CameraDescription> cameras;
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    // 사용 가능한 카메라 목록
    cameras = await availableCameras();
    _controller = CameraController(
        cameras.first,
        ResolutionPreset.medium,
        enableAudio: false
    );

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

    final XFile image = await _controller!.takePicture();
    setState(() {
      _imagePath = image.path;
    });

    print("사진 촬영 완료: $_imagePath");

    // 촬영 후 로딩 화면으로
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoadingScreen(imagePath: _imagePath!),
      ),
    );
  }


  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // 추후 혜택 정보 페이지 연결
        onLeftButtonPressed: () {},
        // 추후 도움말 페이지 연결
        onHelpPressed: () {},
      ),
      body: _controller?.value.isInitialized ?? false
          ? Center(
            child: GestureDetector(
                onTap: _takePicture,
                child: CameraPreview(_controller!),
                  ),
          )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
