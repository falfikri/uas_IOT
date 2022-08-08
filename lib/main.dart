import 'package:firebase_core/firebase_core.dart';
import 'package:uas_1220428/ui/uas_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      projectId: "uas12204028",
      appId: "1:20441521164:android:61ee8b00ba70f7858e6229",
      apiKey: "AIzaSyCH0HkShCRuMSUvtTmv-n5w4x3HoEXD6Ko",
      messagingSenderId: "",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firestore App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UasScreen(),
    );
  }
}