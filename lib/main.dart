import 'dart:io';

import 'package:dutch_app/android_app.dart';
import 'package:dutch_app/ios_app.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    runApp(const AndroidApp());
  } else if (Platform.isIOS) {
    runApp(const IosApp());
  } else {
    runApp(const AndroidApp());
  }
}
