import 'package:flutter/material.dart';

class HMSlider extends StatefulWidget {
  const HMSlider({super.key});

  @override
  State<HMSlider> createState() => _HMSliderState();
}

class _HMSliderState extends State<HMSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: 200,
      child: const Text('轮播图'),);
  }
}