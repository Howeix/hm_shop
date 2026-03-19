import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HMHot extends StatefulWidget {
  const HMHot({super.key});

  @override
  State<HMHot> createState() => _HMHotState();
}

class _HMHotState extends State<HMHot> {
  SpecialOfferResult _inVogueResult = SpecialOfferResult(
    id: '',
    title: '',
    subTypes: [],
  );
  SpecialOfferResult _oneStopResult = SpecialOfferResult(
    id: '',
    title: '',
    subTypes: [],
  );

  void _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  void _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    setState(() {});
  }

  List<GoodsItem?> get _inVogueResultData {
    if (_inVogueResult.subTypes!.isEmpty) {
      return [];
    }
    return _inVogueResult.subTypes!.first.goodsItems!.items!.take(2).toList();
  }

  List<GoodsItem?> get _oneStopResultData {
    if (_inVogueResult.subTypes!.isEmpty) {
      return [];
    }
    return _oneStopResult.subTypes!.first.goodsItems!.items!.take(2).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getInVogueList();
    _getOneStopList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
      child: SizedBox(
        height: 160,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            // 爆款
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 171, 223, 247),
                ),
                alignment: Alignment.center,
                child: _getInVogueView( _inVogueResultData),
              ),
            ),
            SizedBox(width: 6),
            // 一站式买全
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 241, 241, 170),
                ),
                alignment: Alignment.center,
                child: _getInVogueView( _oneStopResultData),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getInVogueView(List<GoodsItem?> data) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: 150,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
              children: [
                TextSpan(text: '爆款推荐 ',style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 18)),
                
                TextSpan(text: '最受欢迎',style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 12)),
              ]
            )),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _getInVogueItem(data),
        ),
      ],
    );
  }

  List<Widget> _getInVogueItem(List<GoodsItem?> data) {
    return data.map((e) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              errorBuilder: (context, error, stackTrace) {
                //加载失败 返回一个占位图
                return Image.asset(
                  'lib/assets/home_cmd_inner.png',
                  fit: BoxFit.cover,
                  width: 80,
                  height: 90,
                );
              },
              e!.picture!,
              fit: BoxFit.cover,
              width: 50,
              height: 70,
            ),
          ),
          SizedBox(height: 6),
          Container(
            padding: EdgeInsets.fromLTRB(12, 2, 12, 2),
            child: Text(
              '¥${e.price}',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      );
    }).toList();
  }
}
