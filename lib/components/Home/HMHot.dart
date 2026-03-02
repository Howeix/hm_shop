import 'package:flutter/material.dart';

class HMHot extends StatefulWidget {
  const HMHot({super.key});

  @override
  State<HMHot> createState() => _HMHotState();
}

class _HMHotState extends State<HMHot> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.lightBlue,
              child: const Text('爆款'),
            ),
          ),
          SizedBox(width: 6),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.lightBlue,
              child: const Text('爆款'),
            ),
          ),
        ],
      ),
    );
  }
}
