import 'dart:io';

import 'package:dutch_app/android_app.dart';
import 'package:dutch_app/ios_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isIOS) {
    runApp(const IosApp());
  } else {
    runApp(const AndroidApp());
  }
}
