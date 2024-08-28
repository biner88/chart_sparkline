import 'package:flutter/material.dart';

class DemoWidget extends StatelessWidget {
  const DemoWidget({
    super.key,
    required this.title,
    required this.code,
    required this.widget,
  });
  final String title;
  final String code;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 170.0,
                width: 500.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: widget,
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 15),
                height: 170.0,
                width: 400.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SelectableText(code),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
