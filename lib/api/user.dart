// 登录接口API

import 'package:mh_shop/contants/index.dart';
import 'package:mh_shop/utils/DioRequest.dart';
import 'package:mh_shop/viewmodels/user.dart';

Future<UserInfo> loginAPI(Map<String, dynamic> data) async {
  return UserInfo.fromJSON(
    await dioRequest.post(HttpConstants.LOGIN, data: data),
  );
}

Future<UserInfo> getUserInfoAPI() async {
  return UserInfo.fromJSON(
    await dioRequest.get(HttpConstants.USER_PROFILE),
  );
}
