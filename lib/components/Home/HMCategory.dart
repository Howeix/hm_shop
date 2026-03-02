import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HMCategory extends StatefulWidget {
  HMCategory({super.key});

  @override
  State<HMCategory> createState() => _HMCategoryState();
}

class _HMCategoryState extends State<HMCategory> {
  /// 分类列表
  List<CategoryItem> _categoryList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCategoryList();
  }

  void _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: _categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            // color: const Color.fromARGB(255, 255, 199, 217),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 199, 217),
              borderRadius: BorderRadius.circular(10),
            ),
            width: 90,
            // height: 30,
            margin: EdgeInsets.fromLTRB(3, 6, 3, 6),
            child: Column(
              children: [
                Image.network(
                  '${_categoryList[index].picture}',
                  width: 50,
                  height: 50,
                ),
                SizedBox(height: 4,),
                Text(
                  '${_categoryList[index].name}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 242, 242),
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
