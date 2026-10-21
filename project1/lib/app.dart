import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/report_form_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaternalCare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      routes: {
        'report': (context) => const ReportFormScreen(),
      },
    );
  }
}