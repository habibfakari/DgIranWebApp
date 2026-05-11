import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth_bloc.dart';
import '../l10n/app_localizations.dart';
import '../pages/login_page.dart';
import '../utility/htify.dart';

class WebAppPage extends StatefulWidget {
  const WebAppPage({super.key});

  @override
  State<WebAppPage> createState() => _WebAppPageState();
}

class _WebAppPageState extends State<WebAppPage> {
  InAppWebViewController? controller;

  final String baseUrl = "https://digiran.io";
  static const authRoutes = [
    '/login',
    '/register',
    '/auth',
  ];

  PullToRefreshController? pullToRefreshController;

  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      settings: PullToRefreshSettings(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (controller != null) {
          controller!.reload();
        }
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller?.loadUrl(
        urlRequest: URLRequest(
          url: WebUri("https://digiran.io/profile"),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,res) async {
        if (didPop) return;

        final canGoBack = await controller?.canGoBack() ?? false;

        if (canGoBack) {
          controller?.goBack();
        } else {
          final exit = await showDialog<bool>(
            context: context,
            builder: (_) => AlertDialog(
              title:  Text(AppLocalizations.of(context)!.exit),
              content:  Text(AppLocalizations.of(context)!.exitAppQuestion),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child:  Text(AppLocalizations.of(context)!.no),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child:  Text(AppLocalizations.of(context)!.yes),
                ),
              ],
            ),
          );

          if (exit == true) {
            SystemNavigator.pop();
          }
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri(baseUrl),
            ),

            pullToRefreshController: pullToRefreshController,

            // ✅ مهم برای ارتباط با Flutter
            onWebViewCreated: (webController) {
              controller = webController;

              /// ✅ handler برای login مستقیم
              controller?.addJavaScriptHandler(
                handlerName: 'loginRequired',
                callback: (args) {
                  _goToLogin();
                },
              );

              /// ✅ handler برای تغییر URL در SPA
              controller?.addJavaScriptHandler(
                handlerName: 'urlChanged',
                callback: (args) {
                  final path = args.first;

                  // print("URL Changed => $path");

                  if (authRoutes.contains(path)) {
                    _goToLogin();
                  }
                },
              );


              /// 🔥 logout handler
              controller?.addJavaScriptHandler(
                handlerName: 'logout',
                callback: (args) async {
                  print("🚪 Logout called from Web");

                  await CookieManager.instance().deleteAllCookies();

                  /// (اختیاری) پاک کردن توکن خودت
                  await TokenManager.clear();

                  /// 👇 برو صفحه اصلی
                  controller?.loadUrl(
                    urlRequest: URLRequest(
                      url: WebUri("https://digiran.io"),
                    ),
                  );
                },
              );

            },

            initialSettings: InAppWebViewSettings(
              transparentBackground: true,
            ),
            // /// ✅ لودینگ
            // onLoadStart: (controller, url) {
            //   final path = url?.path ?? '';
            //
            //   if (authRoutes.contains(path)) {
            //     controller.stopLoading();
            //     _goToLogin();
            //   }
            // },

            onLoadStop: (controller, url) async {
              pullToRefreshController?.endRefreshing();
              await controller.evaluateJavascript(source: """
    (function() {
      function notifyFlutter() {
        if (window.flutter_inappwebview) {
          window.flutter_inappwebview.callHandler('urlChanged', window.location.pathname);
        }
      }

      const pushState = history.pushState;
      history.pushState = function() {
        pushState.apply(history, arguments);
        notifyFlutter();
      };

      window.addEventListener('popstate', notifyFlutter);
    })();
  """);
            },

            /// ✅ intercept url
            shouldOverrideUrlLoading: (controller, action) async {
              final uri = action.request.url;

              if (uri != null) {
                final path = uri.path;

                if (authRoutes.contains(path)) {
                  await _goToLogin();

                  return NavigationActionPolicy.CANCEL;
                }
              }

              return NavigationActionPolicy.ALLOW;
            },

            onReceivedError:( controller,request, error){
              pullToRefreshController?.endRefreshing();
              // _showError(error.description);
            } ,

          ),
        ),
      ),
    );
  }

  bool _isNavigatingToLogin = false;

  Future<void> _goToLogin() async {
    if (_isNavigatingToLogin || !mounted) return;

    _isNavigatingToLogin = true;

    try {
      await controller?.stopLoading();
    } catch (_) {}

    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );

    _isNavigatingToLogin = false;

    if (result == true) {
      /// ⏳ یه تاخیر کوچیک برای sync شدن cookie
      await Future.delayed(const Duration(milliseconds: 300));

      controller?.loadUrl(
        urlRequest: URLRequest(
          url: WebUri("https://digiran.io/profile"),
        ),
      );
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}