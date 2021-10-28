import 'package:dummy_task/views/custom_widget/custom_button.dart';
import 'package:dummy_task/views/custom_widget/custom_text_field.dart';
import 'package:dummy_task/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../constants.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  bool circular = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: SizedBox(
            height: 50.0,
            width: sizeWidth(context) / 1.2,
            child: CustomTextFormField(
              hintText: "example@gmail.com",
              isObscure: false,
              keyBoardType: TextInputType.name,
              controller: emailController,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: SizedBox(
            height: 50.0,
            width: sizeWidth(context) / 1.2,
            child: CustomTextFormField(
              hintText: "************",
              isObscure: true,
              keyBoardType: TextInputType.visiblePassword,
              controller: passController,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: SizedBox(
            height: 50.0,
            width: sizeWidth(context) / 1.2,
            child: CustomButton(
              buttonText: "Login",
              buttonColor: primaryColor,
              textColor: Colors.white,
              onPress: () async {
                try {
                  firebase_auth.UserCredential userCredential =
                      await firebaseAuth.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passController.text);
                  setState(() {
                    circular = false;
                  });
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const HomeScreen(
                                initialChangeIndex: 1,
                              )),
                      (route) => false);
                } catch (e) {
                  final skbar = SnackBar(content: Text(e.toString()));
                  ScaffoldMessenger.of(context).showSnackBar(skbar);
                  setState(() {
                    circular = false;
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
