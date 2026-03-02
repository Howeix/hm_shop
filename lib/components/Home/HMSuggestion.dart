import 'package:flutter/material.dart';

class HMSuggestion extends StatefulWidget {
  const HMSuggestion({super.key});

  @override
  State<HMSuggestion> createState() => _HMSuggestionState();
}

class _HMSuggestionState extends State<HMSuggestion> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
        color: Colors.cyan,
        child: const Text(
          '特惠推荐',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
