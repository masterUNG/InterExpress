import 'package:get/get.dart';
import 'package:ielproject/models/token_model.dart';

class AppController extends GetxController {
  RxBool redEye = true.obs;
  RxBool rememberMe = false.obs;

  RxList<TokenModel> tokenModels = <TokenModel>[].obs;
}
