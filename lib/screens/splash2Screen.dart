import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mizon/screens/auth/loginScreen.dart';

import 'auth/signInScreen.dart';
import 'background.dart';

class Splash2Screen extends StatelessWidget {
  const Splash2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
        content: Column(
      children: [
        const Spacer(),
        Center(
          child: Image.asset("assets/images/logo_name.png"),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Text("Se connecter ou s'inscrire par"),
              const SizedBox(
                height: 12,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.h),
                        border: Border.all()),
                        padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/FB.png",
                      height: 25.h,
                      width: 25.w,
                    ),
                  ),
                  Container(
                  height: 50.h,
                  width: 130.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.h),
                        border: Border.all()),
                        padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/GO.png",
                      height: 25.h,
                      width: 25.w,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Text("Ou par email"),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(onTap: (){Get.to(() => const SignIn());},
                    child: Container(
                      height: 50.h,
                      width: 130.w,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(12.h),
                          border: Border.all()),
                      child: Center(
                          child: Text("S'inscrire",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600))),
                    ),
                  ),
                  InkWell(onTap: () => Get.to(() => const LoginScreen()),
                    child: Container(
                      height: 50.h,
                      width: 130.w,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(12.h),
                          border: Border.all()),
                      child: Center(
                          child: Text("Se Connecter",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,))),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "By continuing you agree to Mizon Terms of Use and Privacy Policy. ",
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 12,
        )
      ],
    ));
  }
}
