import 'package:dummy_task/views/forms/login_form.dart';
import 'package:flutter/material.dart';


import '../../../constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: sizeWidth(context),
            height: sizeHeight(context),
            color: const Color(0xffffffff),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Spacer(
                  flex: 2,
                ),
                Container(
                  width: sizeWidth(context),
                  height: sizeHeight(context) / 3.2,
                  // decoration: const BoxDecoration(
                  //     image: DecorationImage(
                  //         image: AssetImage("assets/images/realstate.jpg"))),
                ),
                const Spacer(
                  flex: 1,
                ),
                const LoginForm(),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
