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
      backgroundColor: Colors.white, // یا Conf.backColor
      body: SafeArea(
        child: Column(
          children: [
            /// فضای بالا
            const Spacer(),

            /// لوگو
            Center(
              child: Image.asset(
                'assets/img/logo_android12.png',
                width: 200,
              ),
            ),

            const Spacer(),

            /// نسخه اپ
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                version,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}