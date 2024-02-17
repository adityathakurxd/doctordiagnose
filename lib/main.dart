import 'package:doctordiagnose/firebase_options.dart';
import 'package:doctordiagnose/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
            titleMedium: TextStyle(color: Color(0xFF252525)),
            bodyMedium: TextStyle(color: Colors.white),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFc9f66f),
          ),
          scaffoldBackgroundColor: const Color(0xFF1C1C1C),
          colorScheme:
              ColorScheme.fromSeed(seedColor: const Color(0xFFc9f66f))),
      home: const HomeScreen(),
    );
  }
}
