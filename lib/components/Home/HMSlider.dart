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
  final CarouselSliderController _carouselSliderController =
      CarouselSliderController();
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

  int _currentBannerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider(), _getSearch(), _getDots()]);
  }

  Widget _getSlider() {
    return CarouselSlider(
      carouselController: _carouselSliderController,
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
        autoPlayInterval: Duration(seconds: 3),
        onPageChanged: (index, reason) {
          _currentBannerIndex = index;
          setState(() {});
        },
      ),
    );
  }

  Widget _getSearch() {
    return Positioned(
      left: 0,
      top: 6,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          alignment: Alignment.centerLeft,
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, .4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            '搜索...',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _getDots() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_bannerList.length, (idx) {
            return GestureDetector(
              onTap: () {
                _carouselSliderController.animateToPage(idx);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 8,
                width: _currentBannerIndex == idx ? 40: 20,
                margin: EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  color:
                      _currentBannerIndex == idx
                          ? const Color.fromARGB(255, 103, 100, 100)
                          : Colors.white,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
