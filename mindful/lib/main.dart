// import 'dart:ffi';
import 'package:firebase_core/firebase_core.dart';
import 'package:mindful/profile.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:mindful/launch.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:mindful/convo.dart';
// import 'package:mindful/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    title: 'Hello App',
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    debugShowCheckedModeBanner: false, // Remove debug label
    home: const LaunchScrn(),
  ));
}
