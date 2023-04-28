import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/formButtonWidget.dart';
import '../../widgets/textFormWidget.dart';
import '../background.dart';
import '../mainScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Background(
      content: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            children: [
              Text("Se Connecter",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
              const SizedBox(
                height: 12,
              ),
              Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                              child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white,
                                child: ClipRRect(borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                      "https://media.licdn.com/dms/image/C5603AQHD5mPVl66yQQ/profile-displayphoto-shrink_800_800/0/1600552843351?e=2147483647&v=beta&t=V-lFpcM21Mw6UO-CCRtotAEl-xD0C8Kt5Od0bPg4-0Q"),
                                ),
                              )),
              const SizedBox(
                height: 30,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormWidget(label: "E-mail", maxLines: 1, controller: emailController,),
                    const SizedBox(
                      height: 8,
                    ),TextFormWidget(label: "Mot de Passe", maxLines: 1, obscureText:true, controller: passwordController,),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const PolicyWidget(),
              const SizedBox(
                height: 8,
              ),
              FormButtonWidget(
                title: "Create Account",tap: () => Get.to(() =>const MainScreen())
                //  AuthController().signInWithEmailAndPassword(emailController.text.trim(), passwordController.text, context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PolicyWidget extends StatelessWidget {
  const PolicyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(textAlign: TextAlign.center,
        text: const TextSpan(
            text: "By continuing you agree to Mizon ",
            children: [
          TextSpan(text: "Terms of Use", style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: " and "),
          TextSpan(text: "Privacy Policy.", style: TextStyle(fontWeight: FontWeight.bold))
        ]));
  }
}
