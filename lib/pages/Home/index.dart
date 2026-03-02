import 'package:flutter/material.dart';
import 'package:hm_shop/components/Home/HMCategory.dart';
import 'package:hm_shop/components/Home/HMHot.dart';
import 'package:hm_shop/components/Home/HMMoreList.dart';
import 'package:hm_shop/components/Home/HMSlider.dart';
import 'package:hm_shop/components/Home/HMSuggestion.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: CustomScrollView(slivers: _getScrollChildren()),
    );
  }

  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: HMSlider()),
      SliverToBoxAdapter(child: HMCategory()),
      SliverToBoxAdapter(child: HMSuggestion()),
      SliverToBoxAdapter(child: HMHot()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HMMoreList(),
      // SliverToBoxAdapter(child: HMHot(),),
    ];
  }
}
