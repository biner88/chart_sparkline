import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Chart Sparkline',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.network(
                  'https://github.githubassets.com/assets/GitHub-Mark-ea2971cee799.png',
                  width: 20,
                ),
                Text(
                  'https://github.com/biner88/chart_sparkline',
                  style: TextStyle(color: Colors.black45),
                ),
              ],
            ),
            onPressed: () {
              launchUrl(
                Uri.parse('https://github.com/biner88/chart_sparkline'),
              );
            },
          ),
        ],
      ),
    );
  }
}
