import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mizon/screens/mainScreen.dart';

import '../../widgets/formButtonWidget.dart';
import '../../widgets/textFormWidget.dart';
import '../background.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  TextEditingController verifController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Background(
      content: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            children: [
              Text("Vérifier",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
              const SizedBox(
                height: 30,
              ),
              Form(
                child: Column(
                  children: [
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Entrez le code que nous venons d’ envoyer à votre numero.",
                        textAlign: TextAlign.center,style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    )
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormWidget(label: "Code", maxLines: 1, textInputType: TextInputType.number,controller: verifController,),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Vous n'avez pas reçu le code ? "),
                        TextButton(
                            onPressed: () {}, child: const Text("Renvoyez"))
                      ],
                    ),
                     FormButtonWidget(
                      title: "Verify",tap: () {
                        Get.to(() =>const MainScreen());
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
