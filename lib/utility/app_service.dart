import 'package:dio/dio.dart';
import 'package:ielproject/utility/app_snackbar.dart';

class AppService {
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

      print("token ---> ${response.data['token']}");
    } on Exception catch (e) {
      AppSnackBar(title: 'Login False', message: 'Please Try Again')
          .errorSnackBar();
    }
  }
}
