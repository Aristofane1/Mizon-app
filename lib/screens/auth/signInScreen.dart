import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mizon/controllers/Auth.dart';
import 'package:mizon/screens/auth/verifyScreen.dart';

import '../../widgets/formButtonWidget.dart';
import '../../widgets/textFormWidget.dart';
import '../background.dart';
import 'loginScreen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Background(
      content: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: DefaultTextStyle(
            style: Get.textTheme.bodyMedium!,
            child: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: Column(
                        children: [
                          Text("Creer un compte",
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
                            height: 12,
                          ),
                          Form(
                            child: Column(
                              children: [
                                TextFormWidget(
                                  label: "Nom Complet",
                                  maxLines: 1,
                                  controller: nameController,
                                ),
                                TextFormWidget(
                                  label: "Bio",
                                  maxLines: 3,
                                  controller: bioController,
                                ),
                                TextFormWidget(
                                  label: "E-mail",
                                  maxLines: 1,
                                  controller: emailController,
                                ),
                                // TextFormWidget(
                                //   label: "Phone",
                                //   maxLines: 1,
                                //   controller: phoneController,
                                // ),
                                InternationalPhoneNumberInput(
                                  onInputChanged: (PhoneNumber number) {
                                    print(number.phoneNumber);
                                  },
                                  onInputValidated: (bool value) {
                                    print(value);
                                  },
                                  selectorConfig: const SelectorConfig(
                                    selectorType:
                                        PhoneInputSelectorType.BOTTOM_SHEET,
                                  ),
                                  ignoreBlank: false,
                                  autoValidateMode: AutovalidateMode.disabled,
                                  selectorTextStyle:
                                      const TextStyle(color: Colors.white),
                                  // initialValue: number,
                                  // textFieldController: controller,
                                  formatInput: false,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  inputBorder: const OutlineInputBorder(),
                                  onSaved: (PhoneNumber number) {
                                    print('On Saved: $number');
                                  },
                                ),
                              ],
                            ),
                          ),
                          // const Spacer(),
                          const PolicyWidget(),
                          const SizedBox(
                            height: 8,
                          ),
                          FormButtonWidget(
                            title: "Create Account",
                            tap: () =>  Get.to(() => const VerifyScreen())
                            // AuthController()
                            //     .registerWithEmailAndPassword(
                            //         emailController.text.trim(),
                            //         bioController.text,
                            //         context),
                          ),
                        ],
                      )));
            }),
          ),
        ),
      ),
    );
  }
}
