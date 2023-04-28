import 'package:flutter/material.dart';

import 'background.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(content: Center(child: Image.asset("assets/images/logo_name.png"),),);
  }
}