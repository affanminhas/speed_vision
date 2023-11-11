import 'package:flutter/material.dart';
import 'package:speed_vision/base/app_view.dart';
import 'package:speed_vision/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppView());
}
