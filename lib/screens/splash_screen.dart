import 'dart:async';
import 'package:flutter/material.dart';

import '../resource/asset_manger.dart';
import '../resource/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNextPage);
  }

  _goNextPage() {
    Navigator.pushReplacementNamed(context, Routes.landingScreen);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          width: size * .3,
          height: size * .3,
          image: const AssetImage(
            AssetManager.logo,
          ),
        ),
      ),
    );
  }
}
