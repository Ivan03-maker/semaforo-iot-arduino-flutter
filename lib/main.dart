import 'package:flutter/material.dart';
import 'screens/control_center_screen.dart';

void main() {
  runApp(const SemaphoIoTApp());
}

class SemaphoIoTApp extends StatelessWidget {
  const SemaphoIoTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Centro de Control Semáforo IoT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFEEE8D6),
      ),
      home: const ControlCenterScreen(),
    );
  }
}