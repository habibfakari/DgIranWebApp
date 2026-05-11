import 'package:flutter/material.dart';

import 'home_page_webview.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String version = '';

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {

    setState(() {
      version = "v1.0.1";
    });

    /// شبیه‌سازی لود (مثلاً api یا token check)
    await Future.delayed(const Duration(seconds: 2));

    /// رفتن به WebView
    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const WebAppPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🔥 بک‌گراند تمام صفحه
          Positioned.fill(
            child: Image.asset(
              'assets/img/splash.jpg', // 👈 تصویر فول
              fit: BoxFit.cover,
            ),
          ),

          /// 🔽 ورژن پایین صفحه
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Center(
                child: Text(
                  version,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white, // 👈 روی عکس بهتر دیده بشه
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}