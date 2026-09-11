import 'package:mh_shop/contants/index.dart';
import 'package:mh_shop/utils/DioRequest.dart';
import 'package:mh_shop/viewmodels/home.dart';

// 猜你喜欢有参数
// page: 1 pageSize: 10
Future<GoodDetailItems> getGuessListAPI(Map<String, dynamic> params) async {
  return GoodDetailItems.fromJson(
    await dioRequest.get(HttpConstants.GUESS_LIST, params: params),
  );
}
