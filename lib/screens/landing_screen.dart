import 'package:flutter/material.dart';

import '../resource/asset_manger.dart';
import '../resource/color_manager.dart';
import '../resource/routes_manager.dart';
import '../resource/string_manager.dart';
import '../resource/styles_manager.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  Image.asset(
                    AssetManager.logo,
                    height: size.height * .15,
                    width: size.height * .15,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppStrings.title,
                    style: getSemiBoldtStyle(
                        color: ColorManager.primary, fontSize: 35),
                  ),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //navigating to login page
                      Navigator.pushNamed(context, Routes.loginRoute);
                    },
                    child: const Text(AppStrings.signin),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * .75, size.height * .06),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(AppStrings.register),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * .75, size.height * .06),
                    ),
                  ),
                ],
              ),
              TextButton(
                child: Text(
                  AppStrings.takeTour,
                  style:
                      getMediumtStyle(color: ColorManager.black, fontSize: 15),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
