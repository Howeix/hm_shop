import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

/// 获取首页banner列表
Future<List<BannerItem>> getBannerListAPI() async {
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((e) {
    return BannerItem.fromJson(e as Map<String, dynamic>);
  }).toList();
}

/// 获取分类列表
Future<List<CategoryItem>> getCategoryListAPI() async {
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((e) {
    return CategoryItem.fromJson(e as Map<String, dynamic>);
  }).toList();
}

///特惠推荐列表
Future<SpecialOfferResult> getSpecialOfferListAPI() async {
  return SpecialOfferResult.fromJson(
    await dioRequest.get(HttpConstants.PRODUCT_LIST),
  );
}

///爆款推荐
Future<SpecialOfferResult> getInVogueListAPI() async {
  return SpecialOfferResult.fromJson(
    await dioRequest.get(HttpConstants.IN_VOGUE_LIST),
  );
}

///一站式买全
Future<SpecialOfferResult> getOneStopListAPI() async {
  return SpecialOfferResult.fromJson(
    await dioRequest.get(HttpConstants.ONE_STOP_LIST),
  );
}

///商品详情
Future<List<GoodDetailItem>> getGoodDetailAPI(
  {required Map<String, dynamic> params}
) async {
  return ((await dioRequest.get(HttpConstants.RECOMMEND_LIST, params: params))
          as List)
      .map((e) {
        return GoodDetailItem.fromJson(e as Map<String, dynamic>);
      })
      .toList();
}
