import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

// ignore: must_be_immutable
class HMSlider extends StatefulWidget {
  const HMSlider({super.key});

  @override
  State<HMSlider> createState() => _HMSliderState();
}

class _HMSliderState extends State<HMSlider> {
  final List<BannerItem> _bannerList = [
    BannerItem(
      id: '1',
      imgUrl:
          "https://img2.baidu.com/it/u=1916085022,2414154081&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=611",
    ),
    BannerItem(
      id: '2',
      imgUrl:
          "https://img2.baidu.com/it/u=3844016614,3264779257&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1067",
    ),
    BannerItem(
      id: '3',
      imgUrl:
          "https://img0.baidu.com/it/u=4279639265,3959979430&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1400",
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider()]);
  }

  Widget _getSlider() {
    return CarouselSlider(
      items: List.generate(_bannerList.length, (idx) {
        final imgUrl = _bannerList[idx].imgUrl!;

        return Image.network(
          imgUrl,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        );
      }),
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1.01,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
      ),
    );
  }
}
