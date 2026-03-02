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
