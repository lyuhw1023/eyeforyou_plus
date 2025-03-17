import 'package:eyeforyou_plus/viewmodels/camera_viewmodel.dart';
import 'package:eyeforyou_plus/viewmodels/list_viewmodel.dart';
import 'package:eyeforyou_plus/viewmodels/selection_viewmodel.dart';
import 'package:eyeforyou_plus/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CameraViewModel()),
        ChangeNotifierProvider(create: (_) => SelectionViewModel()),
        ChangeNotifierProvider(create: (_) => ListViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "EYEFORYOU",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
      //home: const CameraScreen(),
    );
  }
}
