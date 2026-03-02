import 'package:flutter/material.dart';

class HMCategory extends StatefulWidget {
  const HMCategory({super.key});

  @override
  State<HMCategory> createState() => _HMCategoryState();
}

class _HMCategoryState extends State<HMCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 80,
            // height: 30,
            margin: EdgeInsets.fromLTRB(6, 6, 3, 6),
            child: const Text(
              'text',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          );
        },
      ),
    );
  }
}
