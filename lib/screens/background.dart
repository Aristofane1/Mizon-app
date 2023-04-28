import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget content;
   const Background({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
      //   height: double.maxFinite,
      // width: double.maxFinite,
        decoration:  const BoxDecoration(
        color: Color(0xFF282844),
        gradient: LinearGradient(
          begin: Alignment(
                5.48,
                -0.81,
              ),
              end: Alignment(
                0.43,
                0.54,
              ),
          stops: [
            0.6,1
          ],
          colors: [
          Color(0xFF282844),
          Color(0xff373958),
        ])
      ),
      child: content
      )
    );
  }
}