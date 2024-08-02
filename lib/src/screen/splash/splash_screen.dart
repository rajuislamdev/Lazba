import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Image.asset("assets/logos/splash.gif",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.scaleDown,
            width: MediaQuery.of(context).size.width),
      ),
    );
  }
}
