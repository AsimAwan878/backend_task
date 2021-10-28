
import 'package:dummy_task/views/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      //Status BAr
      systemNavigationBarIconBrightness:
      Brightness.light, //Bottom of Screen Button
    ));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Task',
      home: WelcomeScreen(),
    );
  }
}