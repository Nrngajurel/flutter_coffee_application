import 'package:coffee/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch coffee color
        primarySwatch: MaterialColor(0xFF74533c, {
          50: Color(0xFF805d45),
          100: Color(0xFF7a5841),
          200: Color(0xFF6f4f3e),
          300: Color(0xFF6b4a3a),
          400: Color(0xFF674536),
          500: Color(0xFF74533c),
          600: Color(0xFF6f4e37),
          700: Color(0xFF6a4932),
          800: Color(0xFF6b4f3c),
          900: Color(0xFF6f4e37),
        }),
      ),
      home: SplashScreen(),
    );
  }
}
