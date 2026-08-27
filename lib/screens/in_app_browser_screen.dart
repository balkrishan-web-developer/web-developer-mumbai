import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import '../models/store_model.dart';
import '../models/user_model.dart';

class InAppBrowserScreen extends StatefulWidget {
  final StoreModel store;

  const InAppBrowserScreen({super.key, required this.store});

  @override:
  State<InAppBrowserScreen> createState() => _InAppBrowserScreenState();
}

class _InAppBrowserScreenState extends State<InAppBrowserScreen> {
  double _progress = 0;
  InAppWebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final trackingUrl = widget.store.getTrackingUrl(user.userId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        foregroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.store.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Cashback Tracking Activated ✓',
              style: TextStyle(fontSize: 11, color: Color(0xFF10B981)),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _webViewController?.reload(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Tracking Active Notification Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: const Color(0xFF10B981),
            child: Row(
              children: [
                const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Shopping on ${widget.store.name} • ${widget.store.cashbackRate}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_progress < 1.0)
            LinearProgressIndicator(value: _progress, color: const Color(0xFF059669)),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri(trackingUrl)),
              initialSettings: InAppWebViewSettings(
                javaScriptEnabled: true,
                useShouldOverrideUrlLoading: true,
              ),
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
              onProgressChanged: (controller, progress) {
                setState(() {
                  _progress = progress / 100;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
