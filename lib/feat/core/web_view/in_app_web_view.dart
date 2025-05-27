import 'package:flutter/material.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';

class InAppWebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  const InAppWebViewScreen({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);

  @override
  State<InAppWebViewScreen> createState() => _InAppWebViewScreenState();
}

class _InAppWebViewScreenState extends State<InAppWebViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NbaTheme.bgColor,
      appBar: AppBar(
        backgroundColor: NbaTheme.bgColor,
        title: Text(widget.title, style: TextStyle(color: NbaTheme.white),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: NbaTheme.primaryNoraml),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Image.network(
          widget.url,
          fit: BoxFit.contain,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff1B4753)),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Text(
                'Error loading image',
                style: TextStyle(color: Colors.red),
              ),
            );
          },
        ),
      ),
    );
  }
} 