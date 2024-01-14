import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice_apps/screens/mainpage.dart';
import 'package:flutter_practice_apps/screens/web_view_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF091122),
  ));
  runApp(const NexaNews());
}

class NexaNews extends StatelessWidget {
  const NexaNews({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nexa News",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: const Color(0xFF091122),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontFamily: "Times New Roman"),
          bodyMedium: TextStyle(fontFamily: "Times New Roman"),
        ),
      ),
      routes: {
        "/": (context) => const Mainpage(),
        "/webviewpage": (context) => const WebViewPage(),
      },
    );
  }
}
