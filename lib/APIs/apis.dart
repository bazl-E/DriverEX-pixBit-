import 'package:dio/dio.dart';
import 'package:pixbit/models/login_response.dart';
import 'package:pixbit/models/users.dart';

class APIs {
  String loginURl = 'http://training.pixbit.in/api/login';
  String userUrl = "http://training.pixbit.in/api/employees";

//funtion to login user
//return null if the authentication faild
//else return login response

  Future<LoginResponse?> loginUser(String email, String password) async {
    LoginResponse? log;
    try {
      final response = await Dio().post(loginURl, data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log = LoginResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      throw DioError(error: e, requestOptions: RequestOptions(path: ''));
    } catch (e) {
      throw e;
    }

    return log;
  }

  Future<List<User>?> getUserData(String token) async {
    UserData? userData;
    List<User>? user;

    try {
      final response = await Dio().get(
        userUrl,
        options: Options(headers: {
          "authorization": "Bearer $token",
          "Accept": "application/json"
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        userData = UserData.fromJson(response.data);

        user = userData.data!.user;
      }
    } on DioError catch (e) {
      throw DioError(error: e, requestOptions: RequestOptions(path: ''));
    } catch (e) {
      throw e;
    }
    return user;
  }
}
