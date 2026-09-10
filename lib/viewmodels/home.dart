class BannerItem {
  String id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});
  // 扩展一个工厂函数 一般用factory来声明 一般用来创建实例对象
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    // 必须返回一个BannerItem对象
    return BannerItem(id: json["id"] ?? "", imgUrl: json["imgUrl"] ?? "");
  }
}

// 根据json编写class对象和工厂转化函数
class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  List<CategoryItem>? goods;
  CategoryItem({required this.id, required this.name, required this.picture, this.children, this.goods});
  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json["id"],
      name: json["name"],
      picture: json["picture"],
      children: json["children"] != null
          ? (json["children"] as List).map((e) => CategoryItem.fromJson(e as Map<String, dynamic>)).toList()
          : null,
      goods: json["goods"] != null
          ? (json["goods"] as List).map((e) => CategoryItem.fromJson(e as Map<String, dynamic>)).toList()
          : null,
    );
  }
}

// ==================== 特惠推荐 ====================

// 商品项:items 数组中的每一项
class GoodsItem {
  String id;
  String name;
  String? desc; // 商品描述,可能为 null
  String price; // 价格在 json 中是字符串 "1213.00",不是数字
  String picture;
  int orderNum; // 销量是数字
  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });
  factory GoodsItem.fromJson(Map<String, dynamic> json) {
    return GoodsItem(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      desc: json["desc"],
      price: json["price"] ?? "",
      picture: json["picture"] ?? "",
      orderNum: json["orderNum"] ?? 0,
    );
  }
}

// 商品分页数据:goodsItems 对象
class GoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodsItem> items;
  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });
  factory GoodsItems.fromJson(Map<String, dynamic> json) {
    return GoodsItems(
      counts: json["counts"] ?? 0,
      pageSize: json["pageSize"] ?? 0,
      pages: json["pages"] ?? 0,
      page: json["page"] ?? 0,
      items: json["items"] != null
          ? (json["items"] as List)
              .map((e) => GoodsItem.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
    );
  }
}

// 子分类:抢先尝鲜 / 新品预告
class SubType {
  String id;
  String title;
  GoodsItems goodsItems;
  SubType({
    required this.id,
    required this.title,
    required this.goodsItems,
  });
  factory SubType.fromJson(Map<String, dynamic> json) {
    return SubType(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      goodsItems: GoodsItems.fromJson(json["goodsItems"] as Map<String, dynamic>),
    );
  }
}

// result 对象:特惠推荐主体
class SpecialRecommend {
  String id;
  String title;
  List<SubType> subTypes;
  SpecialRecommend({
    required this.id,
    required this.title,
    required this.subTypes,
  });
  factory SpecialRecommend.fromJson(Map<String, dynamic> json) {
    return SpecialRecommend(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      subTypes: json["subTypes"] != null
          ? (json["subTypes"] as List)
              .map((e) => SubType.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
    );
  }
}

class GoodDetailItem extends GoodsItem {
  int payCount = 0;

  /// 商品详情项
  GoodDetailItem({
    required super.id,
    required super.name,
    required super.price,
    required super.picture,
    required super.orderNum,
    required this.payCount,
  }) : super(desc: "");
  // 转化方法
  factory GoodDetailItem.formJSON(Map<String, dynamic> json) {
    return GoodDetailItem(
      id: json["id"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      price: json["price"]?.toString() ?? "",
      picture: json["picture"]?.toString() ?? "",
      orderNum: int.tryParse(json["orderNum"]?.toString() ?? "0") ?? 0,
      payCount: int.tryParse(json["payCount"]?.toString() ?? "0") ?? 0,
    );
  }
}
