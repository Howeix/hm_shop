import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HMSuggestion extends StatefulWidget {
  const HMSuggestion({super.key});

  @override
  State<HMSuggestion> createState() => _HMSuggestionState();
}

class _HMSuggestionState extends State<HMSuggestion> {
  SpecialOfferResult? _specialOfferResult;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化特惠推荐列表
    getSpecialOfferListAPI().then((value) {
      _specialOfferResult = value;
      setState(() {
        print(value);
        // var specialOfferResult = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.cyan,
          image: DecorationImage(
            image: AssetImage('lib/assets/home_cmd_sm.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: 160,
                child: Image(
                  image: AssetImage('lib/assets/home_cmd_title.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 80,
                      height: 140,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/assets/home_cmd_inner.png'),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: SizedBox(
                        height: 140,
                        // color: Colors.amber,
                        child: _getSpecialOfferListView(),
                      ),
                    ),
                  ),
                  // ,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSpecialOfferListView() {
    GoodsItems? goodsItems = _specialOfferResult?.subTypes?.first.goodsItems;
    int length = goodsItems?.items?.length ?? 0;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: length,
      itemBuilder: (BuildContext context, int index) {
        return _getSpecialOfferItem(goodsItems?.items?[index]);
      },
    );
  }

  Widget _getSpecialOfferItem(GoodsItem? goodsItem) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: SizedBox(
        // width: 80,
        // height: 180,
        child: GestureDetector(
          onTap: () {
            print(goodsItem.name);
          },
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  errorBuilder: (context, error, stackTrace) {
                    //加载失败 返回一个占位图
                    return Image.asset(
                      'lib/assets/home_cmd_inner.png',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    );
                  },
                  goodsItem!.picture!,
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.fromLTRB(12, 2, 12, 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '¥${goodsItem.price!}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
