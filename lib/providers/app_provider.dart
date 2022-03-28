import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixbit/APIs/apis.dart';
import 'package:pixbit/models/login_response.dart';
import 'package:pixbit/models/users.dart';
import 'package:pixbit/utils/toast.dart';

class AppProvider with ChangeNotifier {
  bool _isAuthenticating = false;

  String? token;
  bool get isAuthenticating => _isAuthenticating;

  Future<LoginResponse?> loginUser(String email, String password) async {
    LoginResponse? response;
    _isAuthenticating = true;
    notifyListeners();
    try {
      response = await APIs().loginUser(email, password);
      if (response != null) {
        token = response.data!.accessToken;
      }
      _isAuthenticating = false;
    } on DioError catch (_) {
      _isAuthenticating = false;
      toast("Failed To Login,check credential");
    } catch (e) {
      _isAuthenticating = false;
      toast('Something went wrong');
    }
    _isAuthenticating = false;
    notifyListeners();
    return response;
  }
}
