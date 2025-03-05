import 'package:eyeforyou_plus/screens/camera_screen.dart';
import 'package:eyeforyou_plus/screens/splash_screen.dart';
import 'package:flutter/material.dart';
//
// void main() {
//   runApp(createApp());
// }
//
// Widget createApp() => const _App();
//
// class _App extends StatelessWidget {
//   const _App({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//     );
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "EYEFORYOU",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CameraScreen(),
      //onGenerateInitialRoutes: Navigation.generateRoute,
    );
  }
}
