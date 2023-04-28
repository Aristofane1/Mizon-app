import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mizon/screens/home2Screen.dart';
import 'package:mizon/screens/splash2Screen.dart';

import '../widgets/toast.dart';

class AuthController extends GetxController{
 static AuthController authInstance = Get.find();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(_firebaseAuth.currentUser);
    firebaseUser.bindStream(_firebaseAuth.userChanges());

    ever(firebaseUser, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user != null) {
      // user is logged in
      Get.offAll(() => const Home2Screen());
    } else {
      // user is null as in user is not available or not logged in
      Get.offAll(() => const Splash2Screen());
    }
  }

Future signInWithEmailAndPassword(String email, String password, context) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return credential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      displayToastMessage("Wrong email", context);
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      displayToastMessage('Wrong password provided for that user.', context);
    } else {
      print('some error check connection $e');
      displayToastMessage("Check Your Connection", context);
    }
  }
}

// Future signInWithGoogle()async{
//   final GooglSignIn googleSignIn = GooglSignIn()
// }

Future<User?> registerWithEmailAndPassword(
    String mail, String password, context,) async {
  try {
    User? firebaseUser = (await _firebaseAuth.createUserWithEmailAndPassword(
            email: mail, password: password))
        .user;
    return firebaseUser;
  } on FirebaseAuthException catch (e) {
    if (e.code.toString() == "email-already-in-use") {
      // Navigator.pop(context);
      displayToastMessage("This Mail Adress Is Taken.", context);
    } else if (e.code.toString() == "network-request-failed") {
      // Navigator.pop(context);
      displayToastMessage("Check Your Connection", context);
    } else {
      // Navigator.pop(context);
      displayToastMessage("Unknown Error.", context);
    }
  }
  return null;

  // User? firebaseUser = (await firebaseAuth
  //         .createUserWithEmailAndPassword(email: mail, password: password)
  //         .catchError((errMsg) {
  // if (errMsg.code.toString() == "email-already-in-use") {
  //   // Navigator.pop(context);
  //   displayToastMessage("This Mail Adress Is Taken.", context);
  // } else if (errMsg.code.toString() == "network-request-failed") {
  //   // Navigator.pop(context);
  //   displayToastMessage("Check Your Connection", context);
  // } else {
  //   // Navigator.pop(context);
  //   displayToastMessage("Unknown Error.", context);
  // }
  // }))
  // .user;
  // data to get x variables
}

Future changePassword(email, context) async {
  try {
    print("bbbbbbbbbbbbbbbbbbb");

    await _firebaseAuth.sendPasswordResetEmail(email: email);
    displayToastMessage(
        "Reset password link sent. Check spam if you don't receive it.",
        context);
  } on FirebaseAuthException catch (e) {
    print("cccccccc");

    displayToastMessage(e.code.toString(), context);
  } catch (e) {
    displayToastMessage('Some error happen.', context);
  }
}

Future signOut() async {
  try {
    // googleSignIn.signOut();

    return await _firebaseAuth.signOut();
  } catch (e) {
    print(e.toString());
  }
}

}