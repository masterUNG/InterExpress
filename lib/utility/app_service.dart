import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ielproject/models/token_model.dart';
import 'package:ielproject/states/main_home.dart';
import 'package:ielproject/utility/app_controller.dart';
import 'package:ielproject/utility/app_snackbar.dart';

class AppService {
  AppController appController = Get.put(AppController());

  Future<void> checkAuthen(
      {required String user, required String password}) async {
    String urlApi =
        'https://dev-api-ismart.interexpress.co.th/User/login/employee';

    Map<String, dynamic> map = {};
    map['UserName'] = user;
    map['Password'] = password;
    map['ApplicationId'] = 6;

    print('map ---> $map');

    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';

    try {
      var response = await dio.post(urlApi, data: map);

      // print("token ---> ${response.data['token']}");

      TokenModel tokenModel = TokenModel.fromMap(response.data['token']);

      appController.tokenModels.add(tokenModel);

      AppSnackBar(
              title: 'Authen Success',
              message: 'Welcom EmployeeNo : ${tokenModel.employeeNo}')
          .normalSnackBar();

      if (appController.rememberMe.value) {
        Map<String, dynamic> data = {};
        data['user'] = user;
        data['password'] = password;

        await GetStorage().write('data', data);
      }

      Get.offAll(const MainHome());

      print('tokenModel ---> ${tokenModel.toMap()}');
    } on Exception catch (e) {
      AppSnackBar(title: 'Login False', message: 'Please Try Again')
          .errorSnackBar();
    }
  }

  Future<void> findTokenModel(
      {required String user, required String password}) async {
    String urlApi =
        'https://dev-api-ismart.interexpress.co.th/User/login/employee';

    Map<String, dynamic> map = {};
    map['UserName'] = user;
    map['Password'] = password;
    map['ApplicationId'] = 6;

    print('map ---> $map');

    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';

    try {
      var response = await dio.post(urlApi, data: map);

      // print("token ---> ${response.data['token']}");

      TokenModel tokenModel = TokenModel.fromMap(response.data['token']);

      appController.tokenModels.add(tokenModel);

      print('tokenModel ---> ${tokenModel.toMap()}');
    } on Exception catch (e) {
      AppSnackBar(title: 'Login False', message: 'Please Try Again')
          .errorSnackBar();
    }
  }

  Future<void> insertNewData({required Map<String, dynamic> map}) async {
    String urlApi =
        'https://dev-api-ismart.interexpress.co.th/Test/insert-data';

    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Authorization'] =
        'Bearer ${appController.tokenModels.last.accessToken}';

    try {
      var response = await dio.post(urlApi, data: map);

      Get.back();

      AppSnackBar(title: 'Add New Data Success', message: 'Thankyou')
          .normalSnackBar();
      
    } on Exception catch (e) {
      AppSnackBar(title: 'Cannot Add New Data', message: 'Please Try Again')
          .errorSnackBar();
    }
  }
}
