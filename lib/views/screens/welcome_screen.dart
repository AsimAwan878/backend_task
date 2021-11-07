import 'package:dummy_task/views/custom_widget/custom_button.dart';
import 'package:dummy_task/views/custom_widget/custom_text_field.dart';
import 'package:dummy_task/views/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../constants.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(
              initialChangeIndex: 0,
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState!
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  getMobileFormWidget(context) {
    return Column(
      children: [
        const Spacer(
          flex: 3,
        ),
        SizedBox(
          width: sizeWidth(context) / 1.2,
          child: const Center(
            child: Text(
              "Enter your phone number to sign in",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 3,
        ),
        SizedBox(
          height: 50.0,
          width: sizeWidth(context) / 1.2,
          child: CustomTextFormField(
            controller: phoneController,
            hintText: "Enter Your Phone Number",
            isObscure: false,
            keyBoardType: TextInputType.name,
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        SizedBox(
          height: 50.0,
          width: sizeWidth(context) / 1.2,
          child: CustomButton(
            buttonColor: Colors.white,
            buttonText: "Next",
            textColor: Colors.black,
            onPress: () async {
              setState(() {
                showLoading = true;
              });

              await _auth.verifyPhoneNumber(
                phoneNumber: phoneController.text,
                verificationCompleted: (phoneAuthCredential) async {
                  setState(() {
                    showLoading = false;
                  });
                  //signInWithPhoneAuthCredential(phoneAuthCredential);
                },
                verificationFailed: (verificationFailed) async {
                  setState(() {
                    showLoading = false;
                  });
                  _scaffoldKey.currentState!.showSnackBar(SnackBar(
                      content: Text(verificationFailed.message.toString())));
                },
                codeSent: (verificationId, resendingToken) async {
                  setState(() {
                    showLoading = false;
                    currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                    this.verificationId = verificationId;
                  });
                },
                codeAutoRetrievalTimeout: (verificationId) async {},
              );
            },
          ),
        ),
        const Spacer(
          flex: 4,
        ),
        SizedBox(
          height: 50.0,
          width: sizeWidth(context) / 1.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: sizeWidth(context) * 0.35,
                child: const Divider(
                  color: Colors.black,
                  thickness: 1.0,
                ),
              ),
              Text(
                "OR",
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: sizeWidth(context) * 0.35,
                child: const Divider(
                  color: Colors.black,
                  thickness: 1.0,
                ),
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 4,
        ),
        SizedBox(
          height: 50.0,
          width: sizeWidth(context) / 1.2,
          child: CustomButton(
              buttonColor: primaryColor,
              buttonText: "Continue With Email",
              textColor: Colors.white,
              onPress: ()  {
                handleLogin();
              }),
        ),
        const Spacer(
          flex: 1,
        ),
        SizedBox(
          width: sizeWidth(context) / 1.1,
          child: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "By Tapping \"Next\" you agree to",
                style: TextStyle(color: Colors.grey),
                children: <TextSpan>[
                  TextSpan(
                    text: "Terms and Condition",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: " and",
                  ),
                  TextSpan(
                    text: " Privacy Policy",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 1,
        )
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        const Spacer(),
        TextField(
          controller: otpController,
          decoration: const InputDecoration(
            hintText: "Enter OTP",
          ),
        ),
        CustomButton(
          buttonText: "Verify".toUpperCase(),
          buttonColor: primaryColor,
          textColor: Colors.white,
          onPress: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
        ),
        const Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: showLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                ? getMobileFormWidget(context)
                : getOtpFormWidget(context),
        padding: const EdgeInsets.all(16),
      ),
    ));
  }
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  void handleLogin() async {
    final UserCredential user = await signInWithGoogle();
    // Here signInWithGoogle() is your defined function!
    if(user != null){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(
            initialChangeIndex: 0,
          ),
        ),
      );
    }else{
      // Something Wrong!
    }
  }
}
