import 'package:flutter/material.dart';
import 'package:pixbit/providers/app_provider.dart';
import 'package:pixbit/resource/routes_manager.dart';
import 'package:pixbit/utils/auth_indicator.dart';
import 'package:pixbit/utils/toast.dart';
import 'package:provider/provider.dart';

import '../resource/color_manager.dart';
import '../resource/string_manager.dart';
import '../resource/styles_manager.dart';
import 'package:pixbit/utils/validator_service.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email = '';
  String? _password = '';
  void validateAndLogin() async {
    if (primaryFocus!.hasFocus) {
      primaryFocus!.unfocus();
    }
    final authProvider = Provider.of<AppProvider>(context, listen: false);
    _formKey.currentState!.save();
    if (_email == null || _email!.isEmpty) {
      toast('Email can\'t be emty');
      return;
    } else if (!_email!.isValidEmail()) {
      toast('Provide a valid email ');
      return;
    } else if (_password == null || _password!.isEmpty) {
      toast('Enter a Password');
      return;
    } else {
      final response = await authProvider.loginUser(_email!, _password!);
      if (response != null) {
        Navigator.pushReplacementNamed(context, Routes.home);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        leading: Container(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                color: ColorManager.black,
              ))
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
              child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.signin,
                    style: getSemiBoldtStyle(
                        color: ColorManager.black, fontSize: 35),
                  ),
                  SizedBox(height: size.height * .1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: size.width * .75,
                        child: TextFormField(
                          key: const ValueKey('Email'),
                          decoration:
                              const InputDecoration(hintText: AppStrings.mail),
                          onSaved: (s) {
                            _email = s!;
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: size.width * .75,
                        child: TextFormField(
                          key: const ValueKey('Password'),
                          decoration: const InputDecoration(
                              hintText: AppStrings.password),
                          onSaved: (s) {
                            _password = s;
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.forgotPass,
                          style: getSemiBoldtStyle(
                              color: ColorManager.primary, fontSize: 13),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          validateAndLogin();
                        },
                        child: const Text(AppStrings.signin),
                        style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(size.width * .75, size.height * .05),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: kToolbarHeight,
                  )
                ],
              ),
            ),
          )),
          if (authProvider.isAuthenticating)
            ModalBarrier(
                color: Colors.black.withAlpha(50),
                barrierSemanticsDismissible: false),
          if (authProvider.isAuthenticating)
            const AuthenticationIndicator(text: 'Authenticating..')
        ],
      ),
    );
  }
}
