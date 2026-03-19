import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HMMoreList extends StatefulWidget {
  const HMMoreList({super.key});

  @override
  State<HMMoreList> createState() => _HMMoreListState();
}

class _HMMoreListState extends State<HMMoreList> {
  List<GoodDetailItem> _goodDetailItem = [];

  List<GoodDetailItem> get _getGoodDetailItemList {
    if (_goodDetailItem.isEmpty) return [];
    return _goodDetailItem;
  }

  ///获取商品详情
  void _getGoodDetail() async {
    _goodDetailItem = await getGoodDetailAPI(params: {'limit': 10});
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getGoodDetail();
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: _getGoodDetailItemList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: .66,
      ),
      itemBuilder: (context, index) {
        return _getChild(_getGoodDetailItemList[index]);
      },
    );
  }

  Widget _getChild(GoodDetailItem detailItem) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Image.network(detailItem.picture!, fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: 3),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '${detailItem.name}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '¥${detailItem.price ?? 'null'}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(text: ' '),
                    TextSpan(
                      text: '¥${detailItem.price ?? 'null'}',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${detailItem.payCount}人付款',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
