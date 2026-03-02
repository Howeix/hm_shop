import 'package:flutter/material.dart';

class HMMoreList extends StatefulWidget {
  const HMMoreList({super.key});

  @override
  State<HMMoreList> createState() => _HMMoreListState();
}

class _HMMoreListState extends State<HMMoreList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 30,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        crossAxisCount: 2,
        
      ),
      itemBuilder: (context, index) {
        return Container(color: Colors.blue,);
      },
    );
  }
}
