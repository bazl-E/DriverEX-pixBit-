import 'package:flutter/material.dart';
import 'package:pixbit/resource/color_manager.dart';
import 'package:pixbit/resource/styles_manager.dart';

class AuthenticationIndicator extends StatelessWidget {
  const AuthenticationIndicator({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ColorManager.primary,
        ),

        // width: 70,
        height: 60,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: getBoldtStyle(
                color: ColorManager.white,
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 10),
            const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
